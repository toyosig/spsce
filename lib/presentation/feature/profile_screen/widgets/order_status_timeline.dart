import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatusTimeline extends StatelessWidget {
  final DateTime? createdAt;
  final bool? dispatched;
  final bool? delivered;
  final bool? paymentCompleted;

  const OrderStatusTimeline({
    super.key,
    required this.createdAt,
    required this.dispatched,
    required this.delivered,
    required this.paymentCompleted,
  });

  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      'assets/images/order_placed.png',
      (paymentCompleted ?? false) ||
              (dispatched ?? false) ||
              (delivered ?? false)
          ? 'assets/images/order_placed.png'
          : 'assets/images/hand.png',
      (dispatched ?? false) || (delivered ?? false)
          ? 'assets/images/order_placed.png'
          : 'assets/images/shipped_icon.png',
      (delivered ?? false)
          ? 'assets/images/order_placed.png'
          : 'assets/images/delivered.png',
    ];

    final steps = [
      {
        'title': 'Order Placed',
        'desc': 'Your order has been confirmed',
        'date': createdAt,
      },
      {
        'title': 'Payment',
        'desc': paymentCompleted == true
            ? 'Payment completed successfully'
            : "Payment is not completed yet.",
        'date': paymentCompleted == true ? DateTime.now() : null,
      },
      {
        'title': 'Dispatch',
        'desc': 'Your order is on its way',
        'date': dispatched == true ? DateTime.now() : null,
      },
      {
        'title': 'Delivered',
        'desc': 'Order delivered',
        'date': delivered == true ? DateTime.now() : null,
      },
    ];

    Color getIconColor(int index) {
      if (delivered == true) {
        if (index == 3) return Colors.green;
        if (index == 2) return Colors.green;
        if (index == 1) return Colors.green;
        return Colors.green; // index == 0
      } else if (dispatched == true) {
        if (index == 2) return Colors.green;
        if (index == 1) return Colors.green;
        if (index == 0) return Colors.green;
        return Colors.black38; // index == 3
      } else if (paymentCompleted == true) {
        if (index == 1) return Colors.green;
        if (index == 0) return Colors.green;
        return Colors.black38; // index == 2, 3
      } else {
        // Only placed
        if (index == 0) return Colors.green;
        return Colors.black38;
      }
    }

    Color getTextColor(int index) {
      if (delivered == true) {
        if (index == 3) return Colors.black;
        if (index == 2) return Colors.black;
        if (index == 1) return Colors.black;
        return Colors.black; // index == 0
      } else if (dispatched == true) {
        if (index == 2) return Colors.black;
        if (index == 1) return Colors.black;
        if (index == 0) return Colors.black;
        return Colors.black38; // index == 3
      } else if (paymentCompleted == true) {
        if (index == 1) return Colors.black;
        if (index == 0) return Colors.black;
        return Colors.black38; // index == 2, 3
      } else {
        // Only placed
        if (index == 0) return Colors.black;
        return Colors.black38;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(steps.length, (i) {
          final step = steps[i];
          final iconColor = getIconColor(i);
          final textColor = getTextColor(i);

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Image.asset(
                    icons[i],
                    width: (i == 1 && paymentCompleted == false) ? 24.r : 18.r,
                    height: (i == 1 && paymentCompleted == false) ? 24.r : 18.r,
                    color: iconColor,
                  ),
                ],
              ),
              SizedBox(width: 15),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        step['title'] as String,
                        style: AppTextStyles.neueMontreal(
                          fontSize: 14.sp,
                          color: textColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        step['desc'] as String,
                        style: AppTextStyles.neueMontreal(
                          fontSize: 12.sp,
                          color: textColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (step['date'] != null && step['date'] is DateTime)
                        SizedBox(height: 4),
                      if (step['date'] != null && step['date'] is DateTime)
                        Text(
                          (step['date'] as DateTime).toLocal().toString().split(
                            ' ',
                          )[0],
                          style: AppTextStyles.neueMontreal(
                            fontSize: 11.sp,
                            color: Colors.black38,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      5.verticalSpace,
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
