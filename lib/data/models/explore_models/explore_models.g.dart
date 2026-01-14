// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExploreResponse _$ExploreResponseFromJson(Map<String, dynamic> json) =>
    _ExploreResponse(
      categories:
          (json['categories'] as List<dynamic>)
              .map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList(),
      brands:
          (json['brands'] as List<dynamic>)
              .map((e) => Brand.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ExploreResponseToJson(_ExploreResponse instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'brands': instance.brands,
    };

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
  id: json['id'] as String,
  name: json['name'] as String,
  image: json['image'] as String,
  subcategories:
      (json['subcategories'] as List<dynamic>)
          .map((e) => Subcategory.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'subcategories': instance.subcategories,
};

_Subcategory _$SubcategoryFromJson(Map<String, dynamic> json) =>
    _Subcategory(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$SubcategoryToJson(_Subcategory instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_Brand _$BrandFromJson(Map<String, dynamic> json) =>
    _Brand(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$BrandToJson(_Brand instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};
