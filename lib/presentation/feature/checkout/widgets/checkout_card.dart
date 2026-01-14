import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String brand;
  final double price;
  final double? decidedPrice;

  const CheckoutCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.brand,
    required this.price,
    this.decidedPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        SlideEffect(begin: Offset(0, 0.3), duration: 600.ms),
        FadeEffect(duration: 600.ms),
      ],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(
          spacing: 10.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.lightgreen,
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: NetworkImageHelper(
                          imagePath: imagePath,
                          height: 64.h,
                          width: 64.w,
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: Column(
                          spacing: 8.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: AppTextStyles.neueMontreal(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                            ),
                            // Display brand and size information with proper formatting
                            if (brand.isNotEmpty)
                              Text(
                                brand,
                                style: AppTextStyles.neueMontreal(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey,
                                ),
                              ),
                            decidedPrice != null
                                ? Row(
                                    children: [
                                      Text(
                                        Formators.formatCurrency(price),
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.red,
                                          decoration:
                                              TextDecoration.lineThrough,

                                          decorationColor: Colors.red,
                                          decorationThickness: 1.9.r,
                                        ),
                                      ),
                                      5.horizontalSpace,
                                      Text(
                                        Formators.formatCurrency(decidedPrice!),
                                        style: AppTextStyles.neueMontreal(
                                          fontSize: 19.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ],
                                  )
                                : Text(
                                    "Selling price : ${Formators.formatCurrency(price)}",
                                    style: AppTextStyles.neueMontreal(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greenPrice,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // 10.verticalSpace,
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10),
            //   child: Text(
            //     'Shipping : Arrange with Seller after purchase',
            //     style: AppTextStyles.leagueSpartan(
            //       fontSize: 16.sp,
            //       fontWeight: FontWeight.w500,
            //       color: Colors.black,
            //     ),
            //   ),
            // ),
            // 10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
