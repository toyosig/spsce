import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:circ/data/models/sales/sales_order_model.dart';

class ShippingInfo extends StatelessWidget {
  final SalesOrderModel? order;
  const ShippingInfo({super.key, this.order});

  @override
  Widget build(BuildContext context) {
    final address =
        '${order?.address1 ?? ''}\n${order?.city ?? ''}, ${order?.state ?? ''}';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shipping Address:',
          style: AppTextStyles.dmSons(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        5.verticalSpace,
        Text(
          address,
          style: AppTextStyles.dmSons(
            fontWeight: FontWeight.w500,
            height: 1.3,
            fontSize: 14.sp,
            color: Colors.black,
          ),
        ),
        5.verticalSpace,
        Text(
          'Phone: ${order?.phoneNumber ?? ''}',
          style: AppTextStyles.dmSons(
            fontWeight: FontWeight.w500,
            height: 1.3,
            fontSize: 14.sp,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
