import 'package:circ/data/models/earning_model/auth_balance_response_model.dart';
import 'package:circ/data/models/earning_model/transaction_response_model.dart';
import 'package:circ/data/models/earning_model/withdraw_request_model.dart';

abstract class BalanceRepository {
  Future<AuthBalanceResponseModel> getMyBalance();
  Future<TransactionResponseModel> getTransactions({required int page, required int limit, int? days});
  Future<WithdrawRequestResponseModel> requestWithdrawal(WithdrawRequestModel request);
}
