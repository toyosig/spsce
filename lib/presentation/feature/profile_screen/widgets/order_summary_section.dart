import 'package:circ/data/models/sales/sales_order_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/home/products_data.dart';
import '../../../../utils/custom_widgets/product_price_display.dart';

class OrderSummarySection extends StatelessWidget {
  final SalesOrderModel order;
  final SalesOrderItemModel itemModel;
  const OrderSummarySection({
    super.key,
    required this.order,
    required this.itemModel,
  });

  @override
  Widget build(BuildContext context) {
    final double unitPrice = itemModel.decidedPrice ?? 0;
    final int quantity = itemModel.quantity ?? 1;
    final double subtotal = unitPrice * quantity;
    final double marketplaceFeePercent = order.marketplaceFee ?? 0;
    final double fee = subtotal * marketplaceFeePercent / 100;

    final double total = subtotal + fee;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order Summary",
          style: AppTextStyles.neueMontreal(
            fontSize: 18.sp,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        15.verticalSpace,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: AppColors.lightbox,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10.sp,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    "Subtotal",
                    style: AppTextStyles.neueMontreal(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                  ProductPriceDisplay(
                    product: itemModel.product ?? ProductsData(),
                    salesOrderItemModel: itemModel,
                    total: subtotal,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Marketplace Fee",
                    style: AppTextStyles.neueMontreal(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    order.marketplaceFee!= null ? Formators.formatCurrency(fee) : 'Free',
                    style: AppTextStyles.neueMontreal(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
           
              Divider(color: Colors.grey.shade300, thickness: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: AppTextStyles.neueMontreal(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  // ProductPriceDisplay(
                  //   product: itemModel.product ?? ProductsData(),
                  //   salesOrderItemModel: itemModel,
                  //   total: total,
                  // ),
                  Text(
                    Formators.formatCurrency(total),
                    style: AppTextStyles.neueMontreal(
                      fontSize: 18.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                ],
              ),
              8.verticalSpace,
              Text(
                "Order ID: ${order.id ?? ''}",
                style: AppTextStyles.neueMontreal(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.lightblack.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
