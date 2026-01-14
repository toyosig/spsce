import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/data/models/sales/sales_order_model.dart';

class ProductDetails extends StatelessWidget {
  final SalesOrderModel? order;
  final int index;
  final num price;
  const ProductDetails({
    super.key,
    this.order,
    required this.index,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final product = order?.items?[index].product;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product?.title ?? '',
          style: AppTextStyles.neueMontreal(
            color: Colors.black,
            height: 1.2,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          '${product?.sizes?.entries.map((e) => '${e.key}-${e.value.map((v) => v.value).join(', ')}').join(', ')}',
          style: AppTextStyles.neueMontreal(
            color: Colors.black54,
            height: 1.2,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        2.verticalSpace,

        Text(
          'Sold by ${order?.fullName ?? ''}',
          style: AppTextStyles.neueMontreal(
            fontWeight: FontWeight.w500,
            height: 1.3,
            fontSize: 14.sp,
            color: Colors.black54,
          ),
        ),
        Text(
          Formators.timeAgoSinceDate(DateTime.parse(product?.createdAt ?? '')),
          style: AppTextStyles.neueMontreal(
            fontWeight: FontWeight.w500,
            height: 1.3,
            fontSize: 14.sp,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
