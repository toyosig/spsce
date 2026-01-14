import 'package:circ/data/models/categories/category_data_model.dart';
import 'package:circ/data/models/home/product_likes.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../auth/auth_user_model.dart';

part 'products_data.freezed.dart';
part 'products_data.g.dart';

@freezed
abstract class ProductsData with _$ProductsData {
  const factory ProductsData({
    String? id,
    List<String>? photos,
    String? video,
    String? title,
    String? description,
    List<String>? tags,
    double? price,
    String? condition,
    Map<String, List<SizeValue>>? sizes,
    String? color,
    @Default(1) int quantity,
    String? shippingTo,
    String? sellerId,
    String? createdAt,
    String? updatedAt,
    String? brandId,
    String? subCategoryId,
    String? shippingFromId,
    AuthUserModel? seller,
    List<ProductLikes>? likes,
    int? likeCount,
    CategoryData? subCategory,
    CategoryData? category,
    ShippingFromModel? shippingFrom,
    BrandModel? brand,
    String? productId,
    bool? isDraft,
    bool? isDelete,
    @Default(false) bool isLiked,
  }) = _ProductsData;

  factory ProductsData.fromJson(Map<String, dynamic> json) =>
      _$ProductsDataFromJson(json);
}

@freezed
abstract class ShippingFromModel with _$ShippingFromModel {
  const factory ShippingFromModel({String? id, String? name}) =
      _ShippingFromModel;

  factory ShippingFromModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingFromModelFromJson(json);
}

@freezed
abstract class BrandModel with _$BrandModel {
  const factory BrandModel({String? id, String? name, String? logo}) =
      _BrandModel;

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);
}

@freezed
abstract class ProductCategory with _$ProductCategory {
  const factory ProductCategory({String? id, String? name}) = _ProductCategory;

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);
}

@freezed
abstract class SizeValue with _$SizeValue {
  const factory SizeValue({required String id, required String value}) =
      _SizeValue;

  factory SizeValue.fromJson(Map<String, dynamic> json) =>
      _$SizeValueFromJson(json);
}
