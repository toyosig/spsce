// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductDetails _$ProductDetailsFromJson(Map<String, dynamic> json) =>
    _ProductDetails(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data:
          json['data'] == null
              ? null
              : ProductsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailsToJson(_ProductDetails instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
