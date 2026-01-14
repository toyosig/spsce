import 'package:circ/core/constant/global.dart';
import 'package:circ/data/data_sources/remote/earning_rds.dart';
import 'package:circ/data/models/earning_model/auth_balance_response_model.dart';
import 'package:circ/data/models/earning_model/transaction_response_model.dart';
import 'package:circ/data/models/earning_model/withdraw_request_model.dart';
import 'package:circ/domain/repository/earning_repositry.dart';
import 'package:circ/utils/helpers/custom_http_exceptions.dart';

class BalanceRepositoryImpl implements BalanceRepository {
  final BalanceRemoteDataSource remoteDataSource = getIt
      .get<BalanceRemoteDataSource>();

  @override
  Future<AuthBalanceResponseModel> getMyBalance() {
    try {
      return remoteDataSource.getMyBalance();
    } catch (e) {
      throw Exception('$e');
    }
  }

  @override
  Future<TransactionResponseModel> getTransactions({
    required int page,
    required int limit,
    int? days,
  }) {
    return remoteDataSource.getTransactions(
      page: page,
      limit: limit,
      days: days,
    );
  }

  @override
  Future<WithdrawRequestResponseModel> requestWithdrawal(
    WithdrawRequestModel request,
  ) {
    try {
      return remoteDataSource.requestWithdrawal(request);
    } catch (e) {
      throw CustomHTTPException('$e');
    }
  }
}
