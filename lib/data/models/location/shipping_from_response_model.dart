import 'package:circ/data/models/home/products_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipping_from_response_model.freezed.dart';
part 'shipping_from_response_model.g.dart';

@freezed
abstract class ShippingFromResponseModel with _$ShippingFromResponseModel {
  const factory ShippingFromResponseModel({
    bool? success,
    String? message,
    List<ShippingFromModel>? data,
  }) = _ShippingFromResponseModel;

  factory ShippingFromResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingFromResponseModelFromJson(json);
}