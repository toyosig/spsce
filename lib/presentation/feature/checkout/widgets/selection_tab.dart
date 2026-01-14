import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/checkout/widgets/checkout_section_tile.dart';
import 'package:circ/presentation/feature/sell_screen/view_model/sell_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SelectPayment extends StatefulWidget {
  const SelectPayment({super.key});

  @override
  State<SelectPayment> createState() => _SelectPaymentState();
}

class _SelectPaymentState extends State<SelectPayment> {
  final List<ConditionOptions> conditions = [
    // ConditionOptions(
    //   title: "Flutterwave",
    //   subtitle: "Pay with Flutterwave",
    //   enumValue: "Flutterwave",
    // ),
    ConditionOptions(
      title: "Paystack",
      subtitle: "Pay with Paystack",
      enumValue: "Paystack",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final sellVm = context.watch<SellViewModel>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CheckoutSectionTitle(title: "Payment Type"),
          15.verticalSpace,
          Column(
            children: conditions.map((condition) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          condition.title ?? '',
                          style: AppTextStyles.neueMontreal(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                        Radio<String>(
                          value: condition.title ?? '',
                          groupValue: sellVm.selectedPayment,
                          onChanged: (value) {
                            if (value != null) {
                              sellVm.setSelectedpayment(value);
                            }
                          },
                          activeColor: AppColors.primaryColor,
                        ),
                      ],
                    ),
                    Divider(color: AppColors.lightgrey, thickness: 1),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class PaymentOptions {
  final String title;

  PaymentOptions(this.title);
}
