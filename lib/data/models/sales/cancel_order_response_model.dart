import 'package:freezed_annotation/freezed_annotation.dart';

part 'cancel_order_response_model.freezed.dart';
part 'cancel_order_response_model.g.dart';

@freezed
abstract class CancelOrderResponseModel with _$CancelOrderResponseModel {
  const factory CancelOrderResponseModel({
    String? message,
    bool? success,
    String? error,
  }) = _CancelOrderResponseModel;

  factory CancelOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CancelOrderResponseModelFromJson(json);
}
