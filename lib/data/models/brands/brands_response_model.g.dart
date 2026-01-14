// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brands_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BrandResponseModel _$BrandResponseModelFromJson(Map<String, dynamic> json) =>
    _BrandResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => BrandModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$BrandResponseModelToJson(_BrandResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
