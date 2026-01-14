// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RefreshTokenResponseModel _$RefreshTokenResponseModelFromJson(
  Map<String, dynamic> json,
) => _RefreshTokenResponseModel(
  statusCode: (json['statusCode'] as num?)?.toInt(),
  success: json['success'] as bool?,
  message: json['message'] as String?,
  accessToken: json['access_token'] as String?,
  refreshToken: json['refresh_token'] as String?,
  expiresIn: (json['expires_in'] as num?)?.toInt(),
  error: json['error'] as String?,
);

Map<String, dynamic> _$RefreshTokenResponseModelToJson(
  _RefreshTokenResponseModel instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'success': instance.success,
  'message': instance.message,
  'access_token': instance.accessToken,
  'refresh_token': instance.refreshToken,
  'expires_in': instance.expiresIn,
  'error': instance.error,
};
