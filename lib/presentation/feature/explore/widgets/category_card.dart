// ignore_for_file: use_build_context_synchronously
import 'package:circ/data/models/categories/category_data_model.dart';
import 'package:circ/presentation/feature/explore/view_model/explore_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class GenderCategorySection extends StatelessWidget {
  final String title;
  final String? image;
  final List<CategoryData> categories;

  const GenderCategorySection({
    super.key,
    required this.title,
    this.image,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ExploreViewModel>(
      builder: (context, viewModel, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.neueMontreal(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                color: Colors.black,
              ),
            ),
            10.verticalSpace,
            ClipRRect(
              borderRadius: BorderRadius.circular(2.r),
              child: SizedBox(
                height: 160.h,
                width: double.infinity,
                child: NetworkImageHelper(
                  imagePath: image ?? 'assets/images/product_image.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            5.verticalSpace,
            Wrap(
              spacing: 5.w,
              runSpacing: -3.h,
              children: categories.map((cat) {
                return OutlinedButton(
                  onPressed: () async {
                    viewModel.setExploreCatId(id: cat.id!, name: cat.name);
                    await viewModel.getProductsByCategory(
                      context,
                      isRefresh: true,
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 16.w,
                    ),
                    side: BorderSide(color: AppColors.primaryBlack),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                  child: Text(
                    cat.name ?? '',
                    style: AppTextStyles.neueMontreal(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
