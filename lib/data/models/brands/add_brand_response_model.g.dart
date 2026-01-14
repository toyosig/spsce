// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_brand_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddBrandResponseModel _$AddBrandResponseModelFromJson(
  Map<String, dynamic> json,
) => _AddBrandResponseModel(
  success: json['success'] as bool?,
  error: json['error'] as String?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : BrandModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AddBrandResponseModelToJson(
  _AddBrandResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'error': instance.error,
  'message': instance.message,
  'data': instance.data,
};
