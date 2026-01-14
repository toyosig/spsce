import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:circ/presentation/feature/cric_balance/cric_balance_vm.dart/circ_balance_view_model.dart';
import 'package:intl/intl.dart';

import 'earning_filter.dart';

class TransactionTable extends StatelessWidget {
  const TransactionTable({super.key});

  // Helper method to get days value for the current filter
  int? _getDaysForFilter(EarningsFilterType filter) {
    switch (filter) {
      case EarningsFilterType.weekly:
        return 7;
      case EarningsFilterType.monthly:
        return 30;
      case EarningsFilterType.yearly:
        return 365;
      case EarningsFilterType.lifeTime:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CirBalanceViewModel>(
      builder: (context, viewModel, _) {
        final transactions = viewModel.transactions;
        final currentPage = viewModel.currentPage;
        final totalPages = viewModel.totalPages;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TransactionsFilter(),
            const _TransactionHistoryTitle(),
            // SizedBox(
            //   width: double.infinity,
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: DataTable(
            //       border: TableBorder.all(color: Colors.grey.shade300),
            //       headingRowColor: WidgetStateProperty.all(AppColors.greyshade),
            //       columns: [
            //         _buildColumn('Date'),
            //         _buildColumn('Type'),
            //         _buildColumn('Amount'),
            //         _buildColumn('Status'),
            //       ],
            //       rows: transactions.map((txn) {
            //         final statusColor = _getStatusColor(txn.status);
            //         final priceColor = _getPriceColor(
            //           txn.amount,
            //           txn.status,
            //           txn.type,
            //         );
            //
            //         return DataRow(
            //           cells: [
            //             _buildCell(
            //               DateFormat.yMMMd().format(
            //                 txn.createdAt ?? DateTime.now(),
            //               ),
            //             ),
            //             _buildCell(txn.type ?? ""),
            //             DataCell(
            //               Text(
            //                 _formatAmount(txn.amount ?? 0, txn.type),
            //                 style: AppTextStyles.neueMontreal(
            //                   color: priceColor,
            //                   fontSize: 13.sp,
            //                   fontWeight: FontWeight.w500,
            //                 ),
            //               ),
            //             ),
            //             DataCell(
            //               Text(
            //                 _status(txn.status ?? ""),
            //                 style: AppTextStyles.neueMontreal(
            //                   color: statusColor,
            //                   fontSize: 13.sp,
            //                   fontWeight: FontWeight.w500,
            //                 ),
            //               ),
            //             ),
            //           ],
            //         );
            //       }).toList(),
            //     ),
            //   ),
            // ),
            if (viewModel.isLoading && transactions.isEmpty)
              const Center(child: CircularProgressIndicator())
            else if (transactions.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('No transactions found for this period.'),
                ),
              )
            else
              SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    border: TableBorder.all(color: Colors.grey.shade300),
                    headingRowColor: WidgetStateProperty.all(AppColors.greyshade),
                    columns: [
                      _buildColumn('Date'),
                      _buildColumn('Type'),
                      _buildColumn('Amount'),
                      _buildColumn('Status'),
                    ],
                    rows: transactions.map((txn) {
                      final statusColor = _getStatusColor(txn.status);
                      final priceColor = _getPriceColor(
                        txn.amount,
                        txn.status,
                        txn.type,
                      );

                      return DataRow(
                        cells: [
                          _buildCell(
                            DateFormat.yMMMd().format(
                              txn.createdAt ?? DateTime.now(),
                            ),
                          ),
                          _buildCell(txn.type ?? ""),
                          DataCell(
                            Text(
                              _formatAmount(txn.amount ?? 0, txn.type),
                              style: AppTextStyles.neueMontreal(
                                color: priceColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              _status(txn.status ?? "", txn.type),
                              style: AppTextStyles.neueMontreal(
                                color: statusColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            8.verticalSpace,
            if (transactions.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.chevron_left),
                          onPressed: currentPage > 1
                              ? () async {
                                  int? days = _getDaysForFilter(
                                    viewModel.selectedFilter,
                                  );
                                  await viewModel.filterTransactionsByDays(
                                    context,
                                    days: days,
                                    page: currentPage - 1,
                                  );
                                }
                              : null,
                        ),
                        Text(
                          'Page $currentPage of $totalPages',
                          style: AppTextStyles.neueMontreal(
                            color: AppColors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.chevron_right),
                          onPressed: currentPage < totalPages
                              ? () async {
                                  int? days = _getDaysForFilter(
                                    viewModel.selectedFilter,
                                  );
                                  await viewModel.filterTransactionsByDays(
                                    context,
                                    days: days,
                                    page: currentPage + 1,
                                  );
                                }
                              : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }

  DataColumn _buildColumn(String label) {
    return DataColumn(
      label: Text(
        label,
        style: AppTextStyles.neueMontreal(
          fontWeight: FontWeight.w500,
          color: AppColors.black,
          fontSize: 14.sp,
        ),
      ),
    );
  }

  DataCell _buildCell(String value) {
    return DataCell(
      Text(
        value,
        style: AppTextStyles.neueMontreal(
          color: AppColors.black,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Color _getStatusColor(String? status) {
    final lowerStatus = status?.toLowerCase() ?? '';
    if (lowerStatus == 'completed') return Colors.green;
    if (lowerStatus == 'pending') return Color(0xFFAA5D00);
    if (lowerStatus == 'failed' || lowerStatus == 'cancelled') {
      return Colors.red;
    }
    return AppColors.black;
  }

  Color _getPriceColor(int? price, String? status, String? type) {
    final lowerStatus = status?.toLowerCase() ?? '';
    if (price == null) return AppColors.black;
    if (price < 0) return Colors.red; // Red if price starts with "-"
    if (lowerStatus == 'failed' || lowerStatus == 'cancelled') {
      return Colors.red;
    }
    if (lowerStatus == 'pending') return AppColors.black;
    if (type == "PURCHASE" || type == "MARKETPLACE_FEE") return Colors.red;
    return Colors.green;
  }

  String _formatAmount(int amount, String? type) {
    final lowerStatus = type?.toLowerCase() ?? '';
    if (lowerStatus == 'sold') {
      return '+${Formators.formatCurrency(amount)}';
    } else if (lowerStatus == 'purchase' ||
        type == 'PURCHASE' ||
        lowerStatus == 'marketplace_fee' ||
        type == 'MARKETPLACE_FEE' ||
        lowerStatus == 'withdrawal' ||
        type == 'WITHDRAWAL') {
      return '-${Formators.formatCurrency(amount)}';
    } else {
      return Formators.formatCurrency(amount);
    }
  }

  // String _status(String status) {
  //   final upperStatus = status?.toUpperCase() ?? '';
  //
  //   switch (upperStatus) {
  //     case 'COMPLETED':
  //       return 'PAYMENT COMPLETED';
  //     case 'SUCCESS':
  //       return 'PAYMENT SUCCESSFUL';
  //     case 'PAID':
  //       return 'PAID';
  //     case 'FAILED':
  //       return 'PAYMENT FAILED';
  //     case 'CANCELLED':
  //       return 'ORDER CANCELLED';
  //     case 'PENDING':
  //       return 'PAYMENT PENDING';
  //     default:
  //       return status;
  //   }
  // }
  // String _status(String status) {
  //   final upperStatus = status.toUpperCase();
  //   switch (upperStatus) {
  //     case 'COMPLETED':
  //     case 'SUCCESS':
  //     case 'PAID':
  //     case 'SOLD': // <-- ADDED THIS FOR SOLD ITEMS
  //       return 'PAYMENT SUCCESSFUL';
  //     case 'FAILED':
  //       return 'PAYMENT FAILED';
  //     case 'CANCELLED':
  //       return 'ORDER CANCELLED';
  //     case 'PENDING':
  //       return 'PAYMENT PENDING';
  //     default:
  //       return status;
  //   }
  // }
  String _status(String status, String? type) {
    final upperStatus = status.toUpperCase();
    final upperType = type?.toUpperCase() ?? '';

    // For SOLD transactions, check the actual status
    if (upperType == 'SOLD') {
      if (upperStatus == 'COMPLETED' || upperStatus == 'SUCCESS') {
        return 'PAYMENT SUCCESSFUL';
      } else if (upperStatus == 'PENDING') {
        return 'PAYMENT PENDING';
      } else if (upperStatus == 'FAILED') {
        return 'PAYMENT FAILED';
      }
    }

    switch (upperStatus) {
      case 'COMPLETED':
      case 'SUCCESS':
      case 'PAID':
        return 'PAYMENT SUCCESSFUL';
      case 'FAILED':
        return 'PAYMENT FAILED';
      case 'CANCELLED':
        return 'ORDER CANCELLED';
      case 'PENDING':
        return 'PAYMENT PENDING';
      default:
        return status;
    }
  }
}

class _TransactionHistoryTitle extends StatelessWidget {
  const _TransactionHistoryTitle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Text(
        'Transaction History',
        style: AppTextStyles.neueMontreal(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
