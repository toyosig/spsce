// ignore_for_file: deprecated_member_use

import 'package:circ/data/models/review/review_data_model.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/rating_stars.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/review_card.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewsList extends StatelessWidget {
  final List<ReviewDataModel> reviews;
  const ReviewsList({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 49.sp,
          width: 343.w,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.12),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Text(
                  'Overall Ratings',
                  style: AppTextStyles.neueMontreal(
                    fontSize: 16.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),

                RatingStars(
                  rating: reviews.isNotEmpty
                      ? reviews
                                .map((r) => r.rating)
                                .reduce((a, b) => a! + b!)! /
                            reviews.length
                      : 0.0,
                  showStars: false,
                  totalReviews: reviews.isNotEmpty
                      ? reviews
                                .map((r) => r.rating)
                                .reduce((a, b) => a! + b!)! /
                            reviews.length
                      : 0.0,
                ),

                Text(
                  '(${reviews.length})',
                  style: AppTextStyles.neueMontreal(
                    fontSize: 14.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: ListView.separated(
            separatorBuilder: (context, index) => 5.verticalSpace,
            itemBuilder: (context, index) => ReviewCard(review: reviews[index]),
            itemCount: reviews.length,
          ),
        ),
      ],
    );
  }
}
