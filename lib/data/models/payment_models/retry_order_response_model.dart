import 'package:freezed_annotation/freezed_annotation.dart';

part 'retry_order_response_model.freezed.dart';
part 'retry_order_response_model.g.dart';

@freezed
abstract class RetryOrderResponseModel with _$RetryOrderResponseModel {
  const factory RetryOrderResponseModel({
    String? message,
    String? error,
    bool? success,
    String? reference,
    double? amount,
  }) = _RetryOrderResponseModel;

  factory RetryOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RetryOrderResponseModelFromJson(json);
}
