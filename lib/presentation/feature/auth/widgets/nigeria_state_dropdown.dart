import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NigeriaStateDropdown extends StatelessWidget {
  final String title;
  final String? selectedState;
  final ValueChanged<String?> onChanged;
  final FormFieldValidator<String>? validator;

  const NigeriaStateDropdown({
    super.key,
    required this.title,
    required this.selectedState,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.neueMontreal(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.greyText,
          ),
        ),
        const SizedBox(height: 8),
        Theme(
          data: Theme.of(context).copyWith(
            inputDecorationTheme: InputDecorationTheme(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: AppColors.black),
              ),
              errorStyle: TextStyle(
                color: AppColors.primaryColor, // error text color
              ),
            ),
          ),
          child: DropdownButtonFormField<String>(
            initialValue: nigeriaStates.contains(selectedState)
                ? selectedState
                : null,
            validator:
                validator ??
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a state';
                  }
                  return null;
                },
            dropdownColor: AppColors.white,
            items: [
              DropdownMenuItem(
                value: null,
                child: Text(
                  'Select a state',
                  style: AppTextStyles.neueMontreal(
                    color: AppColors.greyText,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ...nigeriaStates.map(
                (state) => DropdownMenuItem(
                  value: state,
                  child: Text(
                    state,
                    style: AppTextStyles.neueMontreal(
                      color: AppColors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
            onChanged: onChanged,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: AppColors.black),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                  width: 1.2,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                  width: 1.4,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

final List<String> nigeriaStates = [
  'Lagos',
  'FCT - Abuja',
];
