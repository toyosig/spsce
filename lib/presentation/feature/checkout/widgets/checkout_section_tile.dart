import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';

class CheckoutSectionTitle extends StatelessWidget {
  final String title;
  final double topPadding;

  const CheckoutSectionTitle({
    super.key,
    required this.title,
    this.topPadding = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.neueMontreal(
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );
  }
}
