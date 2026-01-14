import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/home_screen/view_model/home_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/app_images.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../presentation/feature/explore/view_model/explore_view_model.dart';

class SuggestionSearchField extends StatefulWidget {
  final bool isHomeScreen;
  final void Function(String)? onSearchSubmit;
  const SuggestionSearchField({
    super.key,
    this.onSearchSubmit,
    this.isHomeScreen = false,
  });

  @override
  State<SuggestionSearchField> createState() => _SuggestionSearchFieldState();
}

class _SuggestionSearchFieldState extends State<SuggestionSearchField> {
  final LayerLink _layerLink = LayerLink();
  final FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _removeOverlay();
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _showOverlay(BuildContext context, List<String> suggestions) {
    _removeOverlay();
    if (suggestions.isEmpty) return;
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: 16.h,
        top: renderBox.localToGlobal(Offset.zero).dy + size.height + 8.h,
        width: size.width - 32.w,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(16.w, 47.h),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(2),
            color: AppColors.white,
            child: Consumer<ExploreViewModel>(
              builder: (context, vm, _) {
                if (vm.suggestions.isEmpty) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 58.h),
                    child: Center(
                      child: Text(
                        "No Results Found",
                        style: AppTextStyles.neueMontreal(
                          fontSize: 15.sp,
                          color: AppColors.primaryBlack.withValues(alpha: 0.6),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }
                return ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 350.h),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: vm.suggestions
                        .map(
                          (s) => ListTile(
                            title: Text(
                              s,
                              style: AppTextStyles.neueMontreal(
                                fontSize: 15.sp,
                                color: AppColors.primaryBlack,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onTap: () {
                              if (widget.isHomeScreen == true) {
                                final homeVm = getIt.get<HomeViewModel>();
                                homeVm.setIndex(1);
                              }
                              vm.searchController.text = s;
                              widget.onSearchSubmit?.call(s);
                              _removeOverlay();
                              _focusNode.unfocus();
                            },
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Consumer<ExploreViewModel>(
        builder: (context, vm, _) {
          return Container(
            height: 47.h,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextField(
              focusNode: _focusNode,
              controller: vm.searchController,
              style: AppTextStyles.neueMontreal(
                color: AppColors.primaryBlack,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
              // onTapOutside: (_) {
              //   // _removeOverlay();
              //   _focusNode.unfocus();
              // },
              onSubmitted: (query) async {
                if (widget.isHomeScreen == true) {
                  final homeVm = getIt.get<HomeViewModel>();
                  homeVm.setIndex(1);
                }
                vm.searchController.text = query;

                // Only proceed with search if query is not empty and there are suggestions
                if (query.trim().isNotEmpty) {
                  // Check if there are suggestions for this query
                  await vm.getSuggestions(query: query.trim());

                  // Only call onSearchSubmit if there are suggestions or user explicitly submitted
                  if (vm.suggestions.isNotEmpty || query.trim().length >= 3) {
                    widget.onSearchSubmit?.call(query);
                  }
                }
                _removeOverlay();
                _focusNode.unfocus();
              },

              onChanged: (query) {
                if (query.isNotEmpty) {
                  context.read<ExploreViewModel>().getSuggestions(query: query);
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _showOverlay(
                      context,
                      context.read<ExploreViewModel>().suggestions,
                    );
                  });
                } else {
                  _removeOverlay();
                }
              },
              decoration: InputDecoration(
                hintText: 'What are you looking for',
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: SvgPicture.asset(
                    AppImages.searchFieldIcon,
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
                suffixIcon: vm.searchController.text.trim() != ""
                    ? GestureDetector(
                        onTap: () {
                          vm.searchController.clear();
                          _removeOverlay();
                          _focusNode.unfocus();
                          vm.setCurrentState(1);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Icon(
                            Icons.close,
                            color: Colors.black54,
                            size: 20.sp,
                          ),
                        ),
                      )
                    : null,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28.r),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28.r),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),

                contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                hintStyle: AppTextStyles.neueMontreal(
                  color: Color(0xFF71717A),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
