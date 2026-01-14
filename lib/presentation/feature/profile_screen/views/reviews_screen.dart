import 'package:circ/core/constant/global.dart';
import 'package:circ/core/widgets/no_results_found.dart';
import 'package:circ/data/models/review/review_data_model.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/rating_stars.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/review_card.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/custom_primary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewScreen extends StatefulWidget {
  final String userId;
  final int avgRating;
  const ReviewScreen({
    super.key,
    required this.avgRating,
    required this.userId,
  });

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  void initState() {
    super.initState();
    final ProfileViewModel profileViewModel = getIt.get<ProfileViewModel>();
    profileViewModel.getReviews(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomPrimaryAppBar(title: 'Reviews', isBackButtonVisible: true),
      backgroundColor: AppColors.white,
      body: Consumer<ProfileViewModel>(
        builder: (context, viewModel, _) {
          final List<ReviewDataModel> reviews =
              viewModel.profileReviews!.reviews ?? [];
          return reviews.isEmpty
              ? Center(child: NoResultsFound())
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    spacing: 4,
                    children: [
                      RatingStars(
                        rating: 4.7,
                        showStars: false,
                        totalReviews: reviews.length.toDouble(),
                      ),
                      SizedBox(height: 16),
                      ListView.builder(
                        itemCount: reviews.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            ReviewCard(review: reviews[index]),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
