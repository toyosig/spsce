import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OrderStatusBadge extends StatelessWidget {
  final String? paymentStatus;
  final bool isDelivered;
  final bool isDispatched;
  final String? cancel;
  final bool hideSvg;

  const OrderStatusBadge({
    super.key,
    required this.isDelivered,
    required this.isDispatched,
    this.hideSvg = false,
    this.paymentStatus,
    this.cancel,
  });

  @override
  Widget build(BuildContext context) {
    final Color dispatchedColor = Colors.blueAccent;
    final Color deliveredColor = Colors.green;
    final Color pendingColor = const Color(0xFFAA5D00);
    final Color dueColor = Colors.redAccent;

    String label;
    String iconAsset;
    Color color;

    if (paymentStatus?.toLowerCase() != "paid") {
      label = "Payment is Due";
      iconAsset = 'assets/svg/alert-circle.svg'; // Use a warning or alert icon
      color = dueColor;
    } else if (cancel == "CANCELLED") {
      label = "Cancelled";
      iconAsset = 'assets/svg/package.svg';
      color = dueColor;
    } else if (isDelivered) {
      label = "Delivered";
      iconAsset = 'assets/svg/package.svg';
      color = deliveredColor;
    } else if (isDispatched) {
      label = "Dispatch";
      iconAsset = 'assets/svg/truck.svg';
      color = dispatchedColor;
    } else {
      label = "To be Shipped";
      iconAsset = 'assets/svg/package.svg';
      color = pendingColor;
    }

    return Container(
      decoration: BoxDecoration(
        color: color.withAlpha((255 * 0.2).toInt()),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 3.w,
        children: [
          if (!hideSvg)
            SvgPicture.asset(
              iconAsset,
              height: 15.sp,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
          Text(
            label,
            style: AppTextStyles.neueMontreal(
              color: color,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
