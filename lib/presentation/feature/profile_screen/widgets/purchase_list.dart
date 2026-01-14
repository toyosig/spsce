import 'package:circ/data/models/sales/sales_order_model.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/prchase_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PurchasesList extends StatefulWidget {
  final List<SalesOrderModel> orders;
  const PurchasesList({super.key, required this.orders});

  @override
  State<PurchasesList> createState() => _PurchasesListState();
}

class _PurchasesListState extends State<PurchasesList> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.separated(
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(top: 5.h),
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) =>
            PurchaseCard(order: widget.orders[index]),
        itemCount: widget.orders.length,
      ),
    );
  }
}
