import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_request_model.freezed.dart';
part 'order_request_model.g.dart';

@freezed
abstract class OrderRequest with _$OrderRequest {
  const factory OrderRequest({
    required List<OrderItem> items,
    required ShippingInfo shippingInfo,
    required PaymentInfo paymentInfo,
    required double marketplaceFee,
    required double total,
  }) = _OrderRequest;

  factory OrderRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderRequestFromJson(json);
}

@freezed
abstract class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String productId,
    required int quantity,
    required double decidedPrice,
    required double actualPrice,
    String? offerId,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}

@freezed
abstract class ShippingInfo with _$ShippingInfo {
  const factory ShippingInfo({
    required String fullName,
    required String phoneNumber,
    required String address1,
    required String address2,
    required String city,
    required String state,
  }) = _ShippingInfo;

  factory ShippingInfo.fromJson(Map<String, dynamic> json) =>
      _$ShippingInfoFromJson(json);
}

@freezed
abstract class PaymentInfo with _$PaymentInfo {
  const factory PaymentInfo({required String type, required String paymentId}) =
      _PaymentInfo;

  factory PaymentInfo.fromJson(Map<String, dynamic> json) =>
      _$PaymentInfoFromJson(json);
}
