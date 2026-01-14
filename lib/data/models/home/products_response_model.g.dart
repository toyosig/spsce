// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductsResponseModel _$ProductsResponseModelFromJson(
  Map<String, dynamic> json,
) => _ProductsResponseModel(
  message: json['message'] as String?,
  success: json['success'] as bool?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => ProductsData.fromJson(e as Map<String, dynamic>))
          .toList(),
  total: (json['total'] as num?)?.toInt(),
  page: (json['page'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
  totalPages: (json['totalPages'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductsResponseModelToJson(
  _ProductsResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'success': instance.success,
  'data': instance.data,
  'total': instance.total,
  'page': instance.page,
  'limit': instance.limit,
  'totalPages': instance.totalPages,
};
