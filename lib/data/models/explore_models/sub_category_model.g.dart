// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubCategoryModel _$SubCategoryModelFromJson(Map<String, dynamic> json) =>
    _SubCategoryModel(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$SubCategoryModelToJson(_SubCategoryModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_SubCategoryResponse _$SubCategoryResponseFromJson(Map<String, dynamic> json) =>
    _SubCategoryResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data:
          (json['data'] as List<dynamic>)
              .map((e) => SubCategoryModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$SubCategoryResponseToJson(
  _SubCategoryResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
