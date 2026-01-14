import 'package:circ/data/models/review/review_data_model.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/rating_stars.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewCard extends StatelessWidget {
  final ReviewDataModel review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.transparent,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            Row(
              children: [
                NetworkImageHelper(
                  imagePath: review.reviewer?.profilePic ?? '',
                  height: 36.h,
                  width: 36.w,
                  fit: BoxFit.cover,
                  isCircular: true,
                ),
                10.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " ${review.reviewer?.username ?? ''}",
                      style: AppTextStyles.neueMontreal(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.black,
                      ),
                    ),
                    6.verticalSpace,
                    RatingStars(
                      rating: review.rating?.toDouble() ?? 0.0,
                      showStars: false,
                      totalReviews: review.rating?.toDouble(),
                    ),
                  ],
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 10.w),
              child: Text(
                review.text ?? '',
                style: AppTextStyles.neueMontreal(
                  fontSize: 14.sp,
                  color: AppColors.greyText,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
