import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingStars extends StatelessWidget {
  final double? totalReviews;
  final double rating;
  final bool showStars;

  const RatingStars({
    super.key,
    required this.rating,
    this.showStars = true,
    this.totalReviews,
  });

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();
    bool halfStar = (rating - fullStars) >= 0.5;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!showStars) ...[
          // Text(
          //   rating.toStringAsFixed(1),
          //   style: AppTextStyles.neueMontreal(
          //     fontSize: 40.sp,
          //     fontWeight: FontWeight.bold,
          //     color: AppColors.black,
          //   ),
          // ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              if (index < fullStars) {
                return Icon(
                  Icons.star,
                  color: AppColors.primaryColor,
                  size: 16.sp,
                );
              }
              if (index == fullStars && halfStar) {
                return Icon(
                  Icons.star_half,
                  color: AppColors.primaryColor,
                  size: 16.sp,
                );
              }
              return Icon(
                Icons.star_border,
                color: AppColors.primaryColor,
                size: 16.sp,
              );
            }),
          ),
          SizedBox(width: 4),
          Text(
            "$totalReviews ",
            style: AppTextStyles.neueMontreal(
              fontSize: 14.sp,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
        if (showStars) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              if (index < fullStars) {
                return Icon(
                  Icons.star,
                  color: AppColors.primaryColor,
                  size: 16.sp,
                );
              }
              if (index == fullStars && halfStar) {
                return Icon(
                  Icons.star_half,
                  color: AppColors.primaryColor,
                  size: 16.sp,
                );
              }
              return Icon(
                Icons.star_border,
                color: AppColors.primaryColor,
                size: 16.sp,
              );
            }),
          ),
        ],
      ],
    );
  }
}
