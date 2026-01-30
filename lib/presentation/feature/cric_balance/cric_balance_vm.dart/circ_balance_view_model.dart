// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:circ/core/constant/global.dart';
import 'package:circ/data/models/earning_model/balance_data_model.dart';
import 'package:circ/data/models/earning_model/transaction_response_model.dart';
import 'package:circ/data/models/earning_model/withdraw_request_model.dart';
import 'package:circ/domain/repository/earning_repositry.dart';
import 'package:circ/presentation/routes/routes.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/order_action_dialog_box.dart';
import 'package:circ/utils/helpers/custom_http_exceptions.dart';
import 'package:circ/utils/helpers/loading_helpers.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../profile_screen/view_model/profile_view_model.dart';

enum EarningsFilterType { lifeTime, weekly, monthly, yearly }

class CirBalanceViewModel extends ChangeNotifier {
  final BalanceRepository repository = getIt.get<BalanceRepository>();

  // Balance related state
  EarningsFilterType _selectedFilter = EarningsFilterType.lifeTime;
  BalanceDataModel? balanceData;

  // Transaction related state
  List<TransactionDataModel> transactions = [];
  int _currentPage = 1;
  int _totalPages = 1;
  final int _limit = 4;

  // UI state
  bool _isLoading = false;

  // Getters
  bool get isLoading => _isLoading;
  EarningsFilterType get selectedFilter => _selectedFilter;
  bool get canLoadMore => _currentPage < _totalPages;
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;

  // Set loading state
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Set selected filter
  void setSelectedFilter(EarningsFilterType filter) {
    _selectedFilter = filter;
    notifyListeners();
  }

  void setBalanceData(BalanceDataModel data) {
    balanceData = data;
    notifyListeners();
  }

  void setTransactions(
    List<TransactionDataModel> list,
    int page,
    int totalPages,
  ) {
    // Filter out MARKETPLACE_FEE transactions - sellers don't pay marketplace fees
    final filteredList = list.where((txn) {
      final type = txn.type?.toUpperCase() ?? '';
      return type != 'MARKETPLACE_FEE';
    }).toList();
    
    if (page == 1) {
      transactions = filteredList;
    } else {
      transactions = filteredList;
    }
    _currentPage = page;
    _totalPages = totalPages;
    notifyListeners();
  }

  // Initialize with balance and first page of transactions
  Future<void> init(BuildContext context) async {
    try {
      LoadingHelper.showLoading(context);
      await fetchTransactions(page: 1);
      if (getIt.get<ProfileViewModel>().user?.seller != null) {
        await getMyBalance();
      }
    } catch (e) {
      CustomHTTPException(e.toString());
    } finally {
      if (context.mounted) LoadingHelper.hideLoading(context);
    }
  }

  /// Get Balance
  Future<void> getMyBalance() async {
    try {
      final response = await repository.getMyBalance();
      if (response.success == true && response.data != null) {
        setBalanceData(response.data!);
      } else {
        throw Exception(response.message);
      }
    } catch (e) {
      CustomHTTPException(e.toString());
    }
  }

  // Fetch paginated transactions
  Future<void> fetchTransactions({int page = 1}) async {
    if (_isLoading || page > _totalPages) return;

    setLoading(true);

    try {
      final response = await repository.getTransactions(
        page: page,
        limit: _limit,
      );
      if (response.success != null &&
          response.success == true &&
          response.data != null) {
        setTransactions(
          response.data!,
          response.page ?? 1,
          response.totalPages ?? 1,
        );
      } else {
        throw CustomHTTPException(response.message ?? "");
      }
    } catch (e) {
      throw CustomHTTPException(e.toString());
    } finally {
      setLoading(false);
    }
  }

  Future<bool> requestWithdrawal({
    required String bankName,
    required String accountHolder,
    required String accountNumber,
    required double amount,
    required BuildContext context,
  }) async {
    setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      final request = WithdrawRequestModel(
        bankName: bankName,
        accountHolderName: accountHolder,
        accountNumber: accountNumber,
        amount: amount,
      );
      final response = await repository.requestWithdrawal(request);
      if (response.success == true) {
        if (context.mounted) {
          await showDialog(
            context: context,
            useRootNavigator: true,
            barrierDismissible: false,
            builder: (_) => Dialog(
              backgroundColor: Colors.white,
              insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
              shape: RoundedRectangleBorder(),
              child: OrderActionDialogBox(
                onSubmitText: "Continue",
                amountText: Formators.formatCurrency(amount),
                onCancelTap: () {
                  Navigator.of(context).pop();
                  context.pushNamed(Routes.navbar.name, extra: 0);
                },
                onCancelText: 'Go to home',
                title: "Your money is on its way to you",
                subTitle: 'It should reach you within the next 48 hours',
                isSuccess: true,
                showButtons: true,
                buttonText: '',
                onSubmitTap: () {
                  if (context.mounted) {
                    Navigator.of(context).pop();
                    context.pop();
                  }
                },
              ),
            ),
          );
        }

        return true;
      } else {
        throw CustomHTTPException(response.message ?? "");
      }
    } catch (e) {
      MessageHelper.showErrorMessage(context, e.toString());
      return false;
    } finally {
      setLoading(false);
      if (context.mounted) LoadingHelper.hideLoading(context);
    }
  }

  /// Filter transactions based on days
  Future<void> filterTransactionsByDays(
    BuildContext context, {
    int? days,
    int page = 1,
  }) async {
    if (_isLoading) return;

    setLoading(true);
    LoadingHelper.showLoading(context);

    try {
      final response = await repository.getTransactions(
        page: page,
        limit: _limit,
        days: days,
      );

      if (response.success != null &&
          response.success == true &&
          response.data != null) {
        // Use setTransactions method to properly handle the list
        setTransactions(
          response.data!,
          response.page ?? 1,
          response.totalPages ?? 1,
        );
      } else {
        throw Exception(response.message);
      }
    } catch (e) {
      log("error filterTransactionsByDays: $e");
    } finally {
      setLoading(false);
      if (context.mounted) LoadingHelper.hideLoading(context);
    }
  }
}