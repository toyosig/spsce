import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_model.freezed.dart';
part 'settings_model.g.dart';

@freezed
abstract class SettingsResponse with _$SettingsResponse {
  const factory SettingsResponse({
    required bool success,
    required String message,
    required SettingsData data,
  }) = _SettingsResponse;

  factory SettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$SettingsResponseFromJson(json);
}

@freezed
abstract class SettingsData with _$SettingsData {
  const factory SettingsData({
    required String id,
    required String flutterwaveKey,
    required String paystackKey,
    required String flutterwavePublicKey,
    required String paystackPublicKey,
    required int defaultCommissionPercentage,
    required int buyerSideCommission,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SettingsData;

  factory SettingsData.fromJson(Map<String, dynamic> json) =>
      _$SettingsDataFromJson(json);
}
