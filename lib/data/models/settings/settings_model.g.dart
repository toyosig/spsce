// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SettingsResponse _$SettingsResponseFromJson(Map<String, dynamic> json) =>
    _SettingsResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: SettingsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SettingsResponseToJson(_SettingsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_SettingsData _$SettingsDataFromJson(Map<String, dynamic> json) =>
    _SettingsData(
      id: json['id'] as String,
      flutterwaveKey: json['flutterwaveKey'] as String,
      paystackKey: json['paystackKey'] as String,
      flutterwavePublicKey: json['flutterwavePublicKey'] as String,
      paystackPublicKey: json['paystackPublicKey'] as String,
      defaultCommissionPercentage:
          (json['defaultCommissionPercentage'] as num).toInt(),
      buyerSideCommission: (json['buyerSideCommission'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$SettingsDataToJson(_SettingsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'flutterwaveKey': instance.flutterwaveKey,
      'paystackKey': instance.paystackKey,
      'flutterwavePublicKey': instance.flutterwavePublicKey,
      'paystackPublicKey': instance.paystackPublicKey,
      'defaultCommissionPercentage': instance.defaultCommissionPercentage,
      'buyerSideCommission': instance.buyerSideCommission,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
