import 'package:circ/core/constant/api_endpoints.dart';
import 'package:circ/core/networks/api_client.dart';
import 'package:circ/data/models/earning_model/auth_balance_response_model.dart';
import 'package:circ/data/models/earning_model/transaction_response_model.dart';
import 'package:circ/data/models/earning_model/withdraw_request_model.dart';
import 'package:circ/utils/helpers/custom_http_exceptions.dart';

class BalanceRemoteDataSource {
  final ApiClient apiClient = ApiClient(ApiPath.baseUrl);

  Future<AuthBalanceResponseModel> getMyBalance() async {
    try {
      final endpoint = ApiPath.authBalance;

      final response = await apiClient.get(endpoint);
      return AuthBalanceResponseModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Error fetching Balance: $e');
    }
  }

  Future<TransactionResponseModel> getTransactions({
    required int page,
    required int limit,
    int? days,
  }) async {
    try {
      final queryParams = {'page': page, 'limit': limit};

      // Add days parameter if provided
      if (days != null) {
        queryParams['days'] = days;
      }

      final response = await apiClient.get(
        ApiPath.authTransactions,
        queryParameters: queryParams,
      );

      return TransactionResponseModel.fromJson(response.data);
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<WithdrawRequestResponseModel> requestWithdrawal(
    WithdrawRequestModel request,
  ) async {
    try {
      final response = await apiClient.post(
        endpoint: ApiPath.withdrawRequest,
        data: request.toJson(),
      );
      final data = WithdrawRequestResponseModel.fromJson(response.data);
      if (data.success != true) {
        throw CustomHTTPException(data.message ?? 'Bad Request');
      }
      return data;
    } catch (e) {
      throw CustomHTTPException(e.toString());
    }
  }
}
