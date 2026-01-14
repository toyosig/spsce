import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartSummaryBox extends StatelessWidget {
  final double subtotal;
  final double marketplaceFeeAmount;
  final double marketplaceFeePercentage;
  final double total;
  final VoidCallback onTap;
  const CartSummaryBox({
    super.key,
    required this.subtotal,
    required this.marketplaceFeeAmount,
    required this.marketplaceFeePercentage,
    required this.total,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        spacing: 4.h,
        children: [
          _buildRow('Subtotal', Formators.formatCurrency(subtotal)),
          _buildRow(
            //(${marketplaceFeePercentage.toStringAsFixed(1)}%)
            'Marketplace Fee ',
            Formators.formatCurrency(marketplaceFeeAmount),
          ),
          _buildRow(
            'Shipping',
            'Arrange with seller after purchase',
            isItalic: true,
          ),

          _buildRow('Total', Formators.formatCurrency(total), isBold: true),
          30.verticalSpace,
          CustomAppButtons.primaryButton(
            height: 50,
            text: 'Checkout',
            width: double.infinity,
            backgroundColor: AppColors.black,
            textColor: AppColors.white,
            onTap: onTap,
          ),
          10.verticalSpace,
        ],
      ),
    );
  }

  Widget _buildRow(
    String label,
    String value, {
    bool isItalic = false,
    bool isBold = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.neueMontreal(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          Text(
            value,
            style: AppTextStyles.neueMontreal(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.lightblack.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}
