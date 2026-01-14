import 'dart:developer';

import 'package:circ/core/constant/api_endpoints.dart';
import 'package:circ/core/networks/api_client.dart';
import 'package:circ/data/models/api/api_response.dart';
import 'package:circ/data/models/payment_models/retry_order_response_model.dart';

class PlaceOrderRemoteDataSource {
  final ApiClient apiClient = ApiClient(ApiPath.baseUrl);
  Future<ApiResponse> createOrder(
    Map<String, dynamic> product,
    String? uniqueTransRef,
  ) async {
    try {
      final response = await apiClient.post(
        endpoint: ApiPath.createOrder,
        data: product,
      );
      if (response.statusCode == 201) {
        return ApiResponse(
          success: true,
          message: response.data['message'],
          data: response.data,
        );
      } else {
        return ApiResponse(success: false, message: response.data['message']);
      }
    } catch (e) {
      throw Exception('Error in remote data source during place order: $e');
    }
  }

  Future<ApiResponse> confirmOrder(String uniqueTransRef) async {
    try {
      final response = await apiClient.get(
        ApiPath.confirmOrder(uniqueTransRef),
      );
      log("response: ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse(success: true, message: response.data['message']);
      } else {
        return ApiResponse(success: false, message: response.data['message']);
      }
    } catch (e) {
      throw Exception('Error in remote data source during confirm order: $e');
    }
  }

  Future<bool> confirmOrderFlutterWave(String uniqueTransRef) async {
    try {
      final response = await apiClient.get(
        ApiPath.confirmOrderFlutterWave(uniqueTransRef),
      );
      log("response: ${response.data}");
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(
        'Error in remote data source during confirm order flutter wave: $e',
      );
    }
  }

  Future<double> getMarketplaceFee() async {
    try {
      final response = await apiClient.get(ApiPath.getMarketplaceFee);
      return response.data['data']['buyerCommissionPercentage'].toDouble();
    } catch (e) {
      throw Exception(
        'Error in remote data source during get marketplace fee: $e',
      );
    }
  }

  Future<RetryOrderResponseModel> reTryOrder({required String orderId}) async {
    try {
      final response = await apiClient.get(ApiPath.reTryOrder(orderId));
      return RetryOrderResponseModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
