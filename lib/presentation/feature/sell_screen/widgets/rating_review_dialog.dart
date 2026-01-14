import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/custom_text_field.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RatingAndReviewDialogContent extends StatefulWidget {
  final String sellerId;
  const RatingAndReviewDialogContent({super.key, required this.sellerId});

  @override
  State<RatingAndReviewDialogContent> createState() =>
      _RatingAndReviewDialogContentState();
}

class _RatingAndReviewDialogContentState
    extends State<RatingAndReviewDialogContent> {
  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<ProfileViewModel>();
    return Padding(
      padding: EdgeInsets.all(20.sp),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Leave a review",
                  style: AppTextStyles.neueMontreal(
                    fontSize: 18.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                10.verticalSpace,

                Text(
                  "Your ratings and review helps us grow our product quality",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.neueMontreal(
                    fontSize: 14.sp,
                    color: AppColors.lightblack.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w400,
                  ),
                ),

                30.verticalSpace,
                RatingBar.builder(
                  initialRating: viewModel.rating.toDouble(),
                  minRating: 1,
                  allowHalfRating: false,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemSize: 32.sp,
                  itemBuilder: (context, _) =>
                      const Icon(Icons.star, color: AppColors.primaryColor),
                  onRatingUpdate: (rating) {
                    viewModel.setRating(rating);
                  },
                ),
                30.verticalSpace,
                LabeledTextField(
                  label: 'Review',
                  hintText: 'Write review',
                  controller: viewModel.reviewController,
                  maxLines: 8,
                  isTitleVisible: true,
                ),
                20.verticalSpace,
                CustomAppButtons.primaryButton(
                  text: 'Submit',
                  onTap: () {
                    if (viewModel.isLoading == false) {
                      viewModel
                          .submitReview(
                            sellerId: widget.sellerId,
                            context: context,
                          )
                          .then(
                            (value) => {
                              if (value && context.mounted) {context.pop()},
                            },
                          );
                    }
                  },
                  width: double.infinity,
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.close, color: Colors.grey, size: 17.sp),
            ),
          ),
        ],
      ),
    );
  }
}
