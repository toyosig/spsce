import 'package:circ/data/models/home/products_data.dart';
import 'package:circ/presentation/feature/explore/view_model/explore_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BrandCard extends StatelessWidget {
  final List<BrandModel> categories;

  const BrandCard({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExploreViewModel>(
      builder: (context, viewModel, _) {
        return Wrap(
          spacing: 5.w,
          runSpacing: 0.h,
          children: categories
              .map(
                (brand) => OutlinedButton(
                  onPressed: () async {
                    viewModel.setExploreBrandId(
                      id: brand.id!,
                      name: brand.name,
                    );
                    await viewModel.getProductsByBrand(
                      context,
                      isRefresh: true,
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 16.w,
                    ),
                    side: const BorderSide(color: AppColors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                  child: Text(
                    brand.name ?? '',
                    style: AppTextStyles.neueMontreal(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
