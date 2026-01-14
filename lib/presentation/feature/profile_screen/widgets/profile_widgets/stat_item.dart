import 'package:flutter/material.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatItem extends StatelessWidget {
  final String value;
  final String label;
  final void Function()? onTap;
  final bool showStar;
  final Color? textcolor;

  const StatItem({
    required this.value,
    required this.label,
    this.onTap,
    this.showStar = false,
    super.key,
    this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    final content = SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value,
                style: AppTextStyles.neueMontreal(
                  fontSize: 14.sp,
                  color: textcolor ?? AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (showStar)
                Icon(Icons.star, color: AppColors.primaryColor, size: 16.sp),
            ],
          ),
          Text(
            label,
            style: AppTextStyles.neueMontreal(
              fontSize: 14.sp,
              height: 2,
              color: AppColors.greyText,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );

    return onTap != null
        ? GestureDetector(onTap: onTap, child: content)
        : content;
  }
}
