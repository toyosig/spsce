// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewResponseModel _$ReviewResponseModelFromJson(Map<String, dynamic> json) =>
    _ReviewResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data:
          json['data'] == null
              ? null
              : ReviewDataModel.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$ReviewResponseModelToJson(
  _ReviewResponseModel instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
  'error': instance.error,
};
