// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catregory_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoriesResponseModel _$CategoriesResponseModelFromJson(
  Map<String, dynamic> json,
) => _CategoriesResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$CategoriesResponseModelToJson(
  _CategoriesResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
