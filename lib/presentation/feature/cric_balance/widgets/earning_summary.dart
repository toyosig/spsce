import 'package:circ/presentation/feature/cric_balance/cric_balance_vm.dart/circ_balance_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EarningsSummary extends StatelessWidget {
  const EarningsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CirBalanceViewModel>(
      builder: (context, vm, _) {
        return Column(
          spacing: 10.w,
          children: [
            _SummaryCard(
              title: 'Current Balance',
              subtitle: 'Total earning after fees',
              value: vm.balanceData?.pendingBalance ?? 0.0,
            ),
            _SummaryCard(
              title: 'Available for withdrawal',
              subtitle: 'Total earning after fees',
              value: vm.balanceData?.availableBalance ?? 0.0,
            ),
            _SummaryCard(
              title: 'Total Earnings',
              subtitle: 'All time earning',
              value: vm.balanceData?.totalBalance ?? 0.0,
              valueColor: Colors.green,
              bgColor: AppColors.green,
            ),
          ],
        );
      },
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double value;
  final Color? valueColor;
  final Color? bgColor;

  const _SummaryCard({
    required this.title,
    required this.subtitle,
    required this.value,
    this.valueColor,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.chatgrey,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.neueMontreal(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: AppColors.black,
                ),
              ),
              10.verticalSpace,
              Text(
                subtitle,
                style: AppTextStyles.neueMontreal(
                  color: AppColors.primaryBlack.withValues(alpha: 0.6),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              Formators.formatCurrency(value),
              style: AppTextStyles.neueMontreal(
                color: AppColors.primaryBlack,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
