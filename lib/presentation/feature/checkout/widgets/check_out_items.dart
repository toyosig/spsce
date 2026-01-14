import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckOutSummaryBox extends StatefulWidget {
  final double subtotal;
  final double marketplaceFee;
  final double marketplaceFeePercentage;
  final double total;
  final VoidCallback onTap;
  const CheckOutSummaryBox({
    super.key,
    required this.subtotal,
    required this.marketplaceFee,
    required this.marketplaceFeePercentage,
    required this.total,
    required this.onTap,
  });

  @override
  State<CheckOutSummaryBox> createState() => _CheckOutSummaryBoxState();
}

class _CheckOutSummaryBoxState extends State<CheckOutSummaryBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: AppColors.lightgrey.withAlpha(40),
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            children: [
              _buildRow('Items(1)', widget.subtotal, isCurrency: true),
              _buildRow(
                //(${widget.marketplaceFeePercentage.toStringAsFixed(1)}%)
                'Marketplace Fee ',
                widget.marketplaceFee,

                isCurrency: true,
              ),
              _buildRow(
                'Shipping',
                'Arrange with seller  after purchase',
                color: AppColors.grey,
                isItalic: true,
              ),
              Divider(height: 24.h),
              _buildRow(
                'Total',
                widget.total,
                isCurrency: true,
                textColor: AppColors.black,
              ),

              10.verticalSpace,
            ],
          ),
        ),
        10.verticalSpace,
        CustomAppButtons.primaryButton(
          height: 50.h,
          text: 'Place Order',
          width: 340.w,
          backgroundColor: AppColors.black,
          textColor: AppColors.white,
          onTap: widget.onTap,
        ),
        20.verticalSpace,
      ],
    );
  }

  Widget _buildRow(
    String label,
    dynamic value, {
    Color? color,
    Color? textColor,
    bool isCurrency = false,
    bool isItalic = false,
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
              color: textColor ?? AppColors.grey,
            ),
          ),
          Text(
            isCurrency ? Formators.formatCurrency(value) : value,
            style: AppTextStyles.neueMontreal(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: color ?? AppColors.black,
              fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
            ),
          ),
        ],
      ),
    );
  }
}
