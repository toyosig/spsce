import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionWidget extends StatelessWidget {
  final String? title;
  final String? description;
  const DescriptionWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          if (title != null)
            Text(
              title ?? "",
              style: AppTextStyles.neueMontreal(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryBlack,
              ),
            ),
          if (description != null)
            Text(
              description!,
              style: AppTextStyles.neueMontreal(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryBlack.withValues(alpha: 0.6),
              ),
            ),
        ],
      ),
    );
  }
}
