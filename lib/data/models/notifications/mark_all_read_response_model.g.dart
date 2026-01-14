// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_all_read_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MarkAllReadResponseModel _$MarkAllReadResponseModelFromJson(
  Map<String, dynamic> json,
) => _MarkAllReadResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : MarkAllReadData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MarkAllReadResponseModelToJson(
  _MarkAllReadResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_MarkAllReadData _$MarkAllReadDataFromJson(Map<String, dynamic> json) =>
    _MarkAllReadData(count: (json['count'] as num?)?.toInt());

Map<String, dynamic> _$MarkAllReadDataToJson(_MarkAllReadData instance) =>
    <String, dynamic>{'count': instance.count};
