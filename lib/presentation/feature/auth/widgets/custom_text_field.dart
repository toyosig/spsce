import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:circ/utils/validators/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool readOnly;
  final TextInputType textInputType;
  final VoidCallback? onTap;
  final int maxLines;
  final bool isTitleVisible;
  final double? width;
  final double? height;
  final IconData? hintIcon;
  final String? Function(String?)? validator;
  final IconData? suffixIcon;
  final bool isObscureText;
  final VoidCallback? onSuffixIconTap;
  final bool isSuffixIconVisible;
  final ValueChanged<String>? onChanged;
  const LabelTextField({
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
    this.hintIcon,
    this.validator,
    this.isObscureText = false,
    this.onSuffixIconTap,
    this.isSuffixIconVisible = false,
    required this.textInputType,
    this.suffixIcon,
    this.onChanged,
  });
  String? Function(String?) getDefaultValidator() {
    if (label.toLowerCase().contains('password')) {
      return FormValidators.validatePassword;
    } else {
      return FormValidators.validateRequired;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.neueMontreal(
            color: AppColors.primaryBlack.withValues(alpha: 0.6),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        5.verticalSpace,
        SizedBox(
          width: width ?? double.infinity,
          child: TextFormField(
            validator: validator ?? getDefaultValidator(),
            controller: controller,
            readOnly: readOnly,
            maxLines: maxLines,
            keyboardType: textInputType,
            onTap: onTap,
            onChanged: onChanged,
            obscureText: isObscureText,
            decoration: InputDecoration(
              suffixIcon: isSuffixIconVisible
                  ? suffixIcon != null
                        ? IconButton(
                            onPressed: onSuffixIconTap,
                            icon: Icon(suffixIcon, color: Colors.grey),
                          )
                        : IconButton(
                            onPressed: onSuffixIconTap,
                            icon: Icon(
                              isObscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          )
                  : null,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 14.h,
              ),
              hintText: hintText,
              hintStyle: AppTextStyles.neueMontreal(
                color: Colors.grey,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2.r),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2.r),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2.r),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
