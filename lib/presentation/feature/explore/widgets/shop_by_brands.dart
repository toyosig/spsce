import 'package:circ/presentation/feature/explore/view_model/explore_view_model.dart';
import 'package:circ/presentation/feature/explore/widgets/brand_card.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ShopByBrands extends StatefulWidget {
  const ShopByBrands({super.key});

  @override
  State<ShopByBrands> createState() => _ShopByBrandsState();
}

class _ShopByBrandsState extends State<ShopByBrands> {
  int _displayedItemsCount = 10; // Initially show 6 items
  // static const int _itemsPerLoad = 6; // Load 6 more items each time

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ExploreViewModel>();
    final totalBrands = viewModel.brands.length;
    final brandsToShow = viewModel.brands.take(_displayedItemsCount).toList();
    final hasMoreItems = _displayedItemsCount < totalBrands;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shop by Brands',
          style: AppTextStyles.neueMontreal(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            color: AppColors.black,
          ),
        ),
        10.verticalSpace,
        if (brandsToShow.isNotEmpty)
          Wrap(
            spacing: 5.h,
            runSpacing: -3.h,
            children: [
              // Generate brand cards
              ...List.generate(brandsToShow.length, (index) {
                final brand = brandsToShow[index];
                return BrandCard(categories: [brand]);
              }),
              // Add "See More" button as the next item in the wrap
              if (hasMoreItems)
                Padding(
                  padding: const EdgeInsets.only(top: 3.8),
                  child: GestureDetector(
                    onTap: _loadRemainingAllBrands,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 11.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.black, width: 1),
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                      child: Text(
                        'See More',
                        style: AppTextStyles.neueMontreal(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: AppColors.red,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }

  void _loadRemainingAllBrands() {
    final viewModel = context.read<ExploreViewModel>();
    final totalBrands = viewModel.brands.length;

    setState(() {
      _displayedItemsCount = (_displayedItemsCount + totalBrands).clamp(
        0,
        totalBrands,
      );
    });
  }
}
