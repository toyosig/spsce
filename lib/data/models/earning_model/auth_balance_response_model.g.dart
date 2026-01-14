// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_balance_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthBalanceResponseModel _$AuthBalanceResponseModelFromJson(
  Map<String, dynamic> json,
) => _AuthBalanceResponseModel(
  statusCode: (json['statusCode'] as num?)?.toInt(),
  success: json['success'] as bool?,
  message: json['message'] as String?,
  error: json['error'] as String?,
  data:
      json['data'] == null
          ? null
          : BalanceDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthBalanceResponseModelToJson(
  _AuthBalanceResponseModel instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'success': instance.success,
  'message': instance.message,
  'error': instance.error,
  'data': instance.data,
};
