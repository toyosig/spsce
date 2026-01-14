import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:circ/utils/validators/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool readOnly;
  final VoidCallback? onTap;
  final int? maxLines;
  final bool isTitleVisible;
  final double? width;
  final double? height;
  final TextInputType? textInputType;
  final TextEditingController? controller1;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final Widget? prefix;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.readOnly = false,
    this.onTap,
    required this.maxLines,
    required this.isTitleVisible,
    this.width,
    this.height,
    this.controller1,
    this.validator,
    this.onChanged,
    this.textInputType = TextInputType.text,
    this.focusNode,
    this.nextFocusNode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.prefix,
  });

  String? Function(String?) getDefaultValidator() {
    if (label.toLowerCase().contains('title')) {
      return FormValidators.validateRequired;
    } else if (label.toLowerCase().contains('₦ price')) {
      return FormValidators.validateRequired;
    } else {
      return FormValidators.validateRequired;
    }
  }

  void _handleNextInput(BuildContext context, String value) {
    final isNumericInput = textInputType == TextInputType.number;
    final isLikelyDropdownNext = nextFocusNode == null;

    if (isNumericInput && value.length >= 5) {
      if (isLikelyDropdownNext) {
        FocusScope.of(context).unfocus();
      } else {
        FocusScope.of(context).requestFocus(nextFocusNode);
      }
    }
    if (onChanged != null) {
      onChanged!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isTitleVisible
            ? Text(
                label,
                style: AppTextStyles.neueMontreal(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              )
            : const SizedBox(),
        SizedBox(height: 6.h),
        SizedBox(
          width: width ?? double.infinity,
          child: TextFormField(
            keyboardType: textInputType,
            validator: validator ?? getDefaultValidator(),
            style: AppTextStyles.neueMontreal(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            focusNode: focusNode,
            controller: controller,
            readOnly: readOnly,
            maxLines: maxLines,

            onTap: onTap,
            textInputAction:
                textInputAction ??
                (nextFocusNode == null
                    ? TextInputAction.done
                    : TextInputAction.next),
            onChanged: (value) => _handleNextInput(context, value),
            onFieldSubmitted:
                onFieldSubmitted ??
                (_) {
                  if (nextFocusNode != null) {
                    FocusScope.of(context).requestFocus(nextFocusNode);
                  } else {
                    FocusScope.of(context).unfocus();
                  }
                },
            decoration: InputDecoration(
              prefixIcon: prefix,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 8.h,
              ),
              hintText: hintText,
              hintStyle: AppTextStyles.neueMontreal(
                color: AppColors.grey,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
