// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'help_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HelpRequestModel _$HelpRequestModelFromJson(Map<String, dynamic> json) =>
    _HelpRequestModel(
      reasons:
          (json['reasons'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String,
      orderId: json['orderId'] as String,
    );

Map<String, dynamic> _$HelpRequestModelToJson(_HelpRequestModel instance) =>
    <String, dynamic>{
      'reasons': instance.reasons,
      'description': instance.description,
      'orderId': instance.orderId,
    };
