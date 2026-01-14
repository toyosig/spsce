// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductsData _$ProductsDataFromJson(
  Map<String, dynamic> json,
) => _ProductsData(
  id: json['id'] as String?,
  photos: (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
  video: json['video'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  price: (json['price'] as num?)?.toDouble(),
  condition: json['condition'] as String?,
  sizes: (json['sizes'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(
      k,
      (e as List<dynamic>)
          .map((e) => SizeValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  ),
  color: json['color'] as String?,
  quantity: (json['quantity'] as num?)?.toInt() ?? 1,
  shippingTo: json['shippingTo'] as String?,
  sellerId: json['sellerId'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  brandId: json['brandId'] as String?,
  subCategoryId: json['subCategoryId'] as String?,
  shippingFromId: json['shippingFromId'] as String?,
  seller:
      json['seller'] == null
          ? null
          : AuthUserModel.fromJson(json['seller'] as Map<String, dynamic>),
  likes:
      (json['likes'] as List<dynamic>?)
          ?.map((e) => ProductLikes.fromJson(e as Map<String, dynamic>))
          .toList(),
  likeCount: (json['likeCount'] as num?)?.toInt(),
  subCategory:
      json['subCategory'] == null
          ? null
          : CategoryData.fromJson(json['subCategory'] as Map<String, dynamic>),
  category:
      json['category'] == null
          ? null
          : CategoryData.fromJson(json['category'] as Map<String, dynamic>),
  shippingFrom:
      json['shippingFrom'] == null
          ? null
          : ShippingFromModel.fromJson(
            json['shippingFrom'] as Map<String, dynamic>,
          ),
  brand:
      json['brand'] == null
          ? null
          : BrandModel.fromJson(json['brand'] as Map<String, dynamic>),
  productId: json['productId'] as String?,
  isDraft: json['isDraft'] as bool?,
  isDelete: json['isDelete'] as bool?,
  isLiked: json['isLiked'] as bool? ?? false,
);

Map<String, dynamic> _$ProductsDataToJson(_ProductsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'photos': instance.photos,
      'video': instance.video,
      'title': instance.title,
      'description': instance.description,
      'tags': instance.tags,
      'price': instance.price,
      'condition': instance.condition,
      'sizes': instance.sizes,
      'color': instance.color,
      'quantity': instance.quantity,
      'shippingTo': instance.shippingTo,
      'sellerId': instance.sellerId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'brandId': instance.brandId,
      'subCategoryId': instance.subCategoryId,
      'shippingFromId': instance.shippingFromId,
      'seller': instance.seller,
      'likes': instance.likes,
      'likeCount': instance.likeCount,
      'subCategory': instance.subCategory,
      'category': instance.category,
      'shippingFrom': instance.shippingFrom,
      'brand': instance.brand,
      'productId': instance.productId,
      'isDraft': instance.isDraft,
      'isDelete': instance.isDelete,
      'isLiked': instance.isLiked,
    };

_ShippingFromModel _$ShippingFromModelFromJson(Map<String, dynamic> json) =>
    _ShippingFromModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ShippingFromModelToJson(_ShippingFromModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_BrandModel _$BrandModelFromJson(Map<String, dynamic> json) => _BrandModel(
  id: json['id'] as String?,
  name: json['name'] as String?,
  logo: json['logo'] as String?,
);

Map<String, dynamic> _$BrandModelToJson(_BrandModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };

_ProductCategory _$ProductCategoryFromJson(Map<String, dynamic> json) =>
    _ProductCategory(id: json['id'] as String?, name: json['name'] as String?);

Map<String, dynamic> _$ProductCategoryToJson(_ProductCategory instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_SizeValue _$SizeValueFromJson(Map<String, dynamic> json) =>
    _SizeValue(id: json['id'] as String, value: json['value'] as String);

Map<String, dynamic> _$SizeValueToJson(_SizeValue instance) =>
    <String, dynamic>{'id': instance.id, 'value': instance.value};
