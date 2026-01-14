// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserResponseModel _$UserResponseModelFromJson(Map<String, dynamic> json) =>
    _UserResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      success: json['success'] as bool?,
      message: json['message'] as String?,
      error: json['error'] as String?,
      data:
          json['data'] == null
              ? null
              : UserModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseModelToJson(_UserResponseModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'success': instance.success,
      'message': instance.message,
      'error': instance.error,
      'data': instance.data,
    };
