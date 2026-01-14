// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_toggle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FollowToggleModel _$FollowToggleModelFromJson(Map<String, dynamic> json) =>
    _FollowToggleModel(
      statusCode: (json['statusCode'] as num).toInt(),
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$FollowToggleModelToJson(_FollowToggleModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'success': instance.success,
      'message': instance.message,
    };
