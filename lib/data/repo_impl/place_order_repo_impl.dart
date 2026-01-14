import 'package:circ/data/data_sources/remote/place_order_rds.dart';
import 'package:circ/data/models/api/api_response.dart';
import 'package:circ/data/models/payment_models/retry_order_response_model.dart';
import 'package:circ/domain/repository/place_order_repository.dart';

import '../../core/constant/global.dart';

class PlaceOrderRepoImpl extends PlaceOrderRepository {
  final PlaceOrderRemoteDataSource _placeOrderRemoteDataSource = getIt
      .get<PlaceOrderRemoteDataSource>();

  @override
  Future<ApiResponse> createOrder({
    Map<String, dynamic>? products,
    String? uniqueTransRef,
  }) async {
    try {
      final response = await _placeOrderRemoteDataSource.createOrder(
        products!,
        uniqueTransRef,
      );
      return response;
    } catch (e) {
      throw Exception('Error in place order repository: $e');
    }
  }

  @override
  Future<ApiResponse> confirmOrder({String? uniqueTransRef}) async {
    try {
      final response = await _placeOrderRemoteDataSource.confirmOrder(
        uniqueTransRef!,
      );
      return response;
    } catch (e) {
      throw Exception('Error in confirm order repository: $e');
    }
  }

  @override
  Future<bool> confirmOrderFlutterWave({String? uniqueTransRef}) async {
    try {
      final response = await _placeOrderRemoteDataSource
          .confirmOrderFlutterWave(uniqueTransRef!);
      return response;
    } catch (e) {
      throw Exception('Error in confirm order flutter wave repository: $e');
    }
  }

  @override
  Future<double> getMarketplaceFee() async {
    try {
      final response = await _placeOrderRemoteDataSource.getMarketplaceFee();
      return response;
    } catch (e) {
      throw Exception('Error in get marketplace fee repository: $e');
    }
  }

  @override
  Future<RetryOrderResponseModel> reTryOrder({required String orderId}) async {
    try {
      final response = await _placeOrderRemoteDataSource.reTryOrder(
        orderId: orderId,
      );
      return response;
    } catch (e) {
      throw Exception('Error in confirm order flutter wave repository: $e');
    }
  }
}
