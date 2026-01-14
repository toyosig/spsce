// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sizes_by_category_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SizesByCategoryResponseModel _$SizesByCategoryResponseModelFromJson(
  Map<String, dynamic> json,
) => _SizesByCategoryResponseModel(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: SizesByCategoryData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SizesByCategoryResponseModelToJson(
  _SizesByCategoryResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_SizesByCategoryData _$SizesByCategoryDataFromJson(Map<String, dynamic> json) =>
    _SizesByCategoryData(
      categoryId: json['categoryId'] as String,
      categoryName: json['categoryName'] as String,
      sizes: (json['sizes'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          k,
          (e as List<dynamic>)
              .map((e) => SizeValue.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      ),
    );

Map<String, dynamic> _$SizesByCategoryDataToJson(
  _SizesByCategoryData instance,
) => <String, dynamic>{
  'categoryId': instance.categoryId,
  'categoryName': instance.categoryName,
  'sizes': instance.sizes,
};

_SizeValue _$SizeValueFromJson(Map<String, dynamic> json) =>
    _SizeValue(id: json['id'] as String, value: json['value'] as String);

Map<String, dynamic> _$SizeValueToJson(_SizeValue instance) =>
    <String, dynamic>{'id': instance.id, 'value': instance.value};
