import 'package:circ/presentation/feature/cric_balance/cric_balance_vm.dart/circ_balance_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TransactionsFilter extends StatelessWidget {
  const TransactionsFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CirBalanceViewModel>(
      builder: (context, vm, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filter Transactions',
              style: AppTextStyles.neueMontreal(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 22.sp,
              ),
            ),
            10.verticalSpace,
            Wrap(
              spacing: 10.w,
              runSpacing: 8.h,
              children: [
                if (vm.selectedFilter != EarningsFilterType.lifeTime)
                  _FilterButton(
                    label: 'Lifetime',
                    isActive: vm.selectedFilter == EarningsFilterType.lifeTime,
                    onTap: () async {
                      vm.setSelectedFilter(EarningsFilterType.lifeTime);
                      await vm.filterTransactionsByDays(
                        context,
                        days: null,
                        page: 1,
                      );
                    },
                  ),
                _FilterButton(
                  label: 'Last week',
                  isActive: vm.selectedFilter == EarningsFilterType.weekly,
                  onTap: () async {
                    vm.setSelectedFilter(EarningsFilterType.weekly);
                    await vm.filterTransactionsByDays(
                      context,
                      days: 7,
                      page: 1,
                    );
                  },
                ),
                _FilterButton(
                  label: 'Last Month',
                  isActive: vm.selectedFilter == EarningsFilterType.monthly,
                  onTap: () async {
                    vm.setSelectedFilter(EarningsFilterType.monthly);
                    await vm.filterTransactionsByDays(
                      context,
                      days: 30,
                      page: 1,
                    );
                  },
                ),
                _FilterButton(
                  label: 'Last Year',
                  isActive: vm.selectedFilter == EarningsFilterType.yearly,
                  onTap: () async {
                    vm.setSelectedFilter(EarningsFilterType.yearly);
                    await vm.filterTransactionsByDays(
                      context,
                      days: 365,
                      page: 1,
                    );
                  },
                ),
              ],
            ),
            20.verticalSpace, 
          ],
        );
      },
    );
  }
}

class _FilterButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _FilterButton({
    required this.label,
    this.isActive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryColor : Colors.transparent,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          label,
          style: AppTextStyles.neueMontreal(
            color: isActive ? Colors.white : Colors.black54,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
