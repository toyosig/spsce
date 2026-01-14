import 'package:circ/data/models/api/api_response.dart';
import 'package:circ/data/models/payment_models/retry_order_response_model.dart';

abstract class PlaceOrderRepository {
  Future<ApiResponse> createOrder({
    Map<String, dynamic>? products,
    String? uniqueTransRef,
  });
  Future<ApiResponse> confirmOrder({String? uniqueTransRef});
  Future<bool> confirmOrderFlutterWave({String? uniqueTransRef});
  Future<double> getMarketplaceFee();
  Future<RetryOrderResponseModel> reTryOrder({required String orderId});
}
