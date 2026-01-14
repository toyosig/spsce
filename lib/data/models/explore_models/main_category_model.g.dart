// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MainCategoryResponse _$MainCategoryResponseFromJson(
  Map<String, dynamic> json,
) => _MainCategoryResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  data:
      (json['data'] as List<dynamic>)
          .map((e) => MainCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$MainCategoryResponseToJson(
  _MainCategoryResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_MainCategory _$MainCategoryFromJson(Map<String, dynamic> json) =>
    _MainCategory(
      id: json['id'] as String,
      logo: json['logo'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$MainCategoryToJson(_MainCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo': instance.logo,
      'name': instance.name,
    };
