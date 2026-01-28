import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String selectedValue;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator;
  final bool openAbove;
  final double? width;
  final double? height;
  final String? title;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.validator,
    this.openAbove = false,
    this.width,
    this.height,
    this.title,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  String? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selectedValue;
  }

  void _toggleDropdown(FormFieldState<String> field) {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlay(field);
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _removeDropdown();
    }
  }

  void _removeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlay(FormFieldState<String> field) {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    
    // Calculate available space
    final screenHeight = MediaQuery.of(context).size.height;
    final spaceBelow = screenHeight - offset.dy - size.height;
    final spaceAbove = offset.dy;
    
    // Maximum height for dropdown (limit to 200.h or available space)
    final maxDropdownHeight = 200.0.h;
    final itemHeight = 45.0;
    final calculatedHeight = (widget.items.length * itemHeight + 8).clamp(0.0, maxDropdownHeight);
    
    // Determine if dropdown should open above or below
    final shouldOpenAbove = widget.openAbove || (spaceBelow < calculatedHeight && spaceAbove > spaceBelow);
    
    final positionY = shouldOpenAbove
        ? offset.dy - calculatedHeight - 8
        : offset.dy + size.height + 8;

    return OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: _removeDropdown,
                behavior: HitTestBehavior.translucent,
              ),
            ),
            Positioned(
              width: size.width,
              left: offset.dx,
              top: positionY,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset.zero,
                child: Material(
                  elevation: 4,
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: calculatedHeight,
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      children: widget.items.map((item) {
                        return ListTile(
                          dense: true,
                          title: Text(
                            item,
                            style: AppTextStyles.neueMontreal(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () {
                            setState(() => _selected = item);
                            widget.onChanged(item);
                            field.didChange(item);
                            _removeDropdown();
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _removeDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: widget.selectedValue,
      validator: widget.validator,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.title != null)
              Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Text(
                  widget.title!,
                  style: AppTextStyles.neueMontreal(
                    fontSize: 15.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            CompositedTransformTarget(
              link: _layerLink,
              child: CustomAppButtons.trailingIconButton(
                text: _selected ?? 'Select',
                onTap: () => _toggleDropdown(field),
                icon: Icons.arrow_forward_ios,
                iconColor: AppColors.primaryBlack,
                width: widget.width ?? 165.5.w,
                height: widget.height ?? 47.h,
                backgroundColor: AppColors.white,
                textColor: AppColors.primaryBlack,
                borderRadius: 8.r,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                bordercolor: Colors.grey.shade400,
              ),
            ),
            if (field.hasError)
              Padding(
                padding: EdgeInsets.only(top: 4.h, left: 12.w),
                child: Text(
                  field.errorText ?? '',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12.sp,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}