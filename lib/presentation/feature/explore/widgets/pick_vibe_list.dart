import 'package:circ/presentation/feature/explore/view_model/explore_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PickVibeList extends StatelessWidget {
  const PickVibeList({super.key});

  final List<Map<String, String>> hardcodedBrands = const [
    {'name': 'Lagos baddie', 'logo': 'assets/images/brand1.png'},
    {'name': 'Corporate baddie', 'logo': 'assets/images/brand2.png'},
    {'name': 'Owambe', 'logo': 'assets/images/brand3.png'},
    {'name': 'Saturdays are for weddings', 'logo': 'assets/images/brand4.png'},
    {'name': 'Vintage', 'logo': 'assets/images/brand5.png'},
    {'name': 'Alte', 'logo': 'assets/images/brand6.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ExploreViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shop your style',
          style: AppTextStyles.neueMontreal(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            color: AppColors.black,
          ),
        ),
        20.verticalSpace,
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 12.h,
          crossAxisSpacing: 12.w,
          childAspectRatio: 165.w / 190.h,
          children: List.generate(hardcodedBrands.length, (index) {
            return GestureDetector(
              onTap: () async {
                final brandName = hardcodedBrands[index]['name'] ?? '';
                viewModel.searchController.text = brandName;
                await viewModel.searchProducts(
                  context,
                  brand: brandName,
                  isRefresh: true,
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    child: Container(
                      width: 165.w,
                      height: 160.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.r),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Image.asset(
                        hardcodedBrands[index]['logo'] ?? '',
                        fit: BoxFit.cover,
                        height: 150.h,
                        width: 120.w,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 150.h,
                            width: 120.w,
                            color: AppColors.primaryBlack.withValues(
                              alpha: 0.8,
                            ),
                            child: Icon(
                              Icons.broken_image,
                              size: 40.sp,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    hardcodedBrands[index]['name'] ?? "",
                    style: AppTextStyles.neueMontreal(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
