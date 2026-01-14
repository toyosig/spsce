import 'package:freezed_annotation/freezed_annotation.dart';

import '../home/products_data.dart';
import 'order_request_model.dart';

part 'confirm_order_request_model.freezed.dart';
part 'confirm_order_request_model.g.dart';

@freezed
abstract class ConfirmOrderRequestModel with _$ConfirmOrderRequestModel {
  const factory ConfirmOrderRequestModel({
    required String paymentType,
    required String paymentId,
    required String paymentStatus,
    required double marketplaceFee,
    required double decidedPrice,
    required double total,
    required List<ProductsData> items,
    required ShippingInfo shippingInfo,
  }) = _ConfirmOrderRequestModel;

  factory ConfirmOrderRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ConfirmOrderRequestModelFromJson(json);
}
