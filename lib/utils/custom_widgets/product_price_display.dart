import 'package:circ/data/models/home/products_data.dart';
import 'package:circ/data/models/sales/sales_order_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductPriceDisplay extends StatelessWidget {
  const ProductPriceDisplay({
    super.key,
    required this.product,
    required this.salesOrderItemModel,
   this.total,
  });

  final ProductsData product;
  final SalesOrderItemModel salesOrderItemModel;
  final double? total;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        salesOrderItemModel.decidedPrice != product.price
            ? Row(
                children: [
                  Text(
                    Formators.formatCurrency(product.price ?? 0),
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                      decoration: TextDecoration.lineThrough,

                      decorationColor: Colors.red,
                      decorationThickness: 1.9.r,
                    ),
                  ),
                  5.horizontalSpace,
                  Text(
                    Formators.formatCurrency(
                      salesOrderItemModel.decidedPrice ?? 0,
                    ),
                    style: AppTextStyles.neueMontreal(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                ],
              )
            : Text(
                Formators.formatCurrency(total ?? 0),
                style: AppTextStyles.neueMontreal(
                  fontSize: 18.sp,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ],
    );
  }
}
