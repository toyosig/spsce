import 'package:circ/data/models/sales/sales_order_model.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/sold_tab/sold_card.dart';
import 'package:flutter/material.dart';

class SoldList extends StatelessWidget {
  final List<SalesOrderModel> orders;
  const SoldList({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      shrinkWrap: true,
      primary: false,
      scrollDirection: Axis.vertical,
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return SoldCard(order: orders[index]);
      },
    );
  }
}
