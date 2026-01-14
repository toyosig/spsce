import 'package:circ/data/models/sales/sales_order_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShippingInformationSection extends StatelessWidget {
  final SalesOrderModel order;
  final VoidCallback onTap;
  const ShippingInformationSection({super.key, required this.order,  required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Shipping Information",
          style: AppTextStyles.neueMontreal(
            fontSize: 18.sp,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        15.verticalSpace,
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(12.sp),
          decoration: BoxDecoration(
            color: AppColors.lightbox,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 10.sp,
            children: [
              GestureDetector(
                onTap: () {
                 onTap();
                },
                child: NetworkImageHelper(
                  imagePath: order.buyer?.profilePic ?? 'assets/images/user.png',
                  height: 30.h,
                  width: 30.w,
                  isCircular: true,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12.sp,
                children: [
                  Text(
                    order.fullName ?? '',
                    style: AppTextStyles.neueMontreal(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                 
                  if ((order.address1 ?? '').isNotEmpty)
                    Text(
                      order.address1 ?? '',
                      style: AppTextStyles.neueMontreal(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightblack.withValues(alpha: 0.7),
                      ),
                    ),
                  if ((order.address2 ?? '').isNotEmpty)
                    Text(
                      order.address2 ?? '',
                      style: AppTextStyles.neueMontreal(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightblack.withValues(alpha: 0.7),
                      ),
                    ),
                  if ((order.city ?? '').isNotEmpty ||
                      (order.state ?? '').isNotEmpty)
                    Text(
                      [
                        order.city,
                        order.state,
                      ].where((e) => (e ?? '').isNotEmpty).join(', '),
                      style: AppTextStyles.neueMontreal(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightblack.withValues(alpha: 0.7),
                      ),
                    ),
                  if ((order.phoneNumber ?? '').isNotEmpty)
                    Text(
                      order.phoneNumber ?? '',
                      style: AppTextStyles.neueMontreal(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightblack.withValues(alpha: 0.7),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
