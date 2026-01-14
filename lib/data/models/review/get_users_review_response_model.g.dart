// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_review_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsersReviewResponseModel _$UsersReviewResponseModelFromJson(
  Map<String, dynamic> json,
) => _UsersReviewResponseModel(
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : UsersReviewData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UsersReviewResponseModelToJson(
  _UsersReviewResponseModel instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
