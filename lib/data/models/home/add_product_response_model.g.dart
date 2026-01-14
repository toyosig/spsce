// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddProductResponseModel _$AddProductResponseModelFromJson(
  Map<String, dynamic> json,
) => _AddProductResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  error: json['error'] as String?,
  data:
      json['data'] == null
          ? null
          : AddedProductData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AddProductResponseModelToJson(
  _AddProductResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'error': instance.error,
  'data': instance.data,
};

_AddedProductData _$AddedProductDataFromJson(Map<String, dynamic> json) =>
    _AddedProductData(
      id: json['id'] as String?,
      video: json['video'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toInt(),
      condition: json['condition'] as String?,
      color: json['color'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      shippingTo: json['shippingTo'] as String?,
      isDraft: json['isDraft'] as bool?,
      isDelete: json['isDelete'] as bool?,
      sellerId: json['sellerId'] as String?,
      brandId: json['brandId'] as String?,
      shippingFromId: json['shippingFromId'] as String?,
      subCategoryId: json['subCategoryId'] as String?,
      categoryId: json['categoryId'] as String?,
    );

Map<String, dynamic> _$AddedProductDataToJson(_AddedProductData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'video': instance.video,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'condition': instance.condition,
      'color': instance.color,
      'quantity': instance.quantity,
      'shippingTo': instance.shippingTo,
      'isDraft': instance.isDraft,
      'isDelete': instance.isDelete,
      'sellerId': instance.sellerId,
      'brandId': instance.brandId,
      'shippingFromId': instance.shippingFromId,
      'subCategoryId': instance.subCategoryId,
      'categoryId': instance.categoryId,
    };
