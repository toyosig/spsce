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
    this.title, // <-- ADD THIS LINE
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
    final dropdownHeight = widget.items.length * 45.0 + 8;

    final positionY = widget.openAbove
        ? offset.dy - dropdownHeight
        : offset.dy + size.height;

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
                offset: Offset(0, 47.h),
                child: Material(
                  elevation: 4,
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
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
        return CompositedTransformTarget(
          link: _layerLink,
          child: CustomAppButtons.trailingIconButton(
            text: _selected ?? widget.title ?? 'Select', // <-- TO THIS
            onTap: () => _toggleDropdown(field),
            icon: Icons.arrow_forward_ios,
            iconColor: AppColors.primaryBlack,
            width: 165.5.w,
            height: 47.h,
            backgroundColor: AppColors.white,
            textColor: AppColors.primaryBlack,
            borderRadius: 8.r,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            bordercolor: Colors.grey.shade400,
          ),
        );
      },
    );
  }
}
