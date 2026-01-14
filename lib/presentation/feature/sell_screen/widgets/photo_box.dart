import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPhotoBox extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final IconData icon;
  final bool isSelected;

  const AddPhotoBox({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          width: 128.w,
          height: 94.h,
          decoration: BoxDecoration(
            color: AppColors.greyshade,
            border: Border.all(
              color: isSelected ? AppColors.primaryColor : AppColors.greyshade,
              width: 1,
            ),
          ),
          child: Row(
            spacing: 3.w,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.grey, size: 20.sp),
              Text(
                text,
                style: AppTextStyles.neueMontreal(
                  fontSize: 14.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
