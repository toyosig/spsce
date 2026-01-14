// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StatusResponseModel _$StatusResponseModelFromJson(Map<String, dynamic> json) =>
    _StatusResponseModel(
      message: json['message'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$StatusResponseModelToJson(
  _StatusResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'success': instance.success,
};
