// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policy_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PolicyResponse _$PolicyResponseFromJson(Map<String, dynamic> json) =>
    _PolicyResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data:
          (json['data'] as List<dynamic>)
              .map((e) => PolicyData.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$PolicyResponseToJson(_PolicyResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_PolicyData _$PolicyDataFromJson(Map<String, dynamic> json) => _PolicyData(
  id: json['id'] as String,
  content: json['content'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$PolicyDataToJson(_PolicyData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
