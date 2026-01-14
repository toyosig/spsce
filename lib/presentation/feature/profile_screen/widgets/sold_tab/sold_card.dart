import 'package:circ/data/models/sales/sales_order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'sold_card_item.dart';

class SoldCard extends StatelessWidget {
  final SalesOrderModel order;
  const SoldCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10.sp),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: order.items?.length ?? 0,
      itemBuilder: (context, index) {
        return SoldCardItem(order: order, index: index);
      },
    );
  }
}
