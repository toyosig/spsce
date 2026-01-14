import 'package:freezed_annotation/freezed_annotation.dart';

part 'balance_data_model.freezed.dart';
part 'balance_data_model.g.dart';

@freezed
abstract class BalanceDataModel with _$BalanceDataModel {
  const factory BalanceDataModel({
    double? availableBalance,
    double? pendingBalance,
    double? totalBalance,
  }) = _BalanceDataModel;

  factory BalanceDataModel.fromJson(Map<String, dynamic> json) =>
      _$BalanceDataModelFromJson(json);
}
