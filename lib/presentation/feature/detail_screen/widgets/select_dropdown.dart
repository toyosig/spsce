import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdownSelectorTile extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final String? selectedValue;

  const DropdownSelectorTile({
    super.key,
    required this.label,
    this.selectedValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
        // border: Border.all(color: const Color(0xFFDCE3EC)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.neueMontreal(
              fontSize: 14.sp,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 35.h,      
              decoration: BoxDecoration(color: Colors.transparent),
              child: Row(
                children: [
                  Text(
                    selectedValue ?? 'Select',
                    style: AppTextStyles.neueMontreal(
                      fontSize: 14.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  15.horizontalSpace,
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 18.sp,
                    color: AppColors.black.withAlpha(140),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
