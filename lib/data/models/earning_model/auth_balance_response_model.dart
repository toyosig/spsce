import 'package:circ/data/models/earning_model/balance_data_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_balance_response_model.freezed.dart';
part 'auth_balance_response_model.g.dart';

@freezed
abstract class AuthBalanceResponseModel with _$AuthBalanceResponseModel {
  const factory AuthBalanceResponseModel({
    int? statusCode,
    bool? success,
    String? message,
    String? error,
    BalanceDataModel? data,
  }) = _AuthBalanceResponseModel;

  factory AuthBalanceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthBalanceResponseModelFromJson(json);
}
