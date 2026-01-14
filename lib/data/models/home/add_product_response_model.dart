import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_product_response_model.freezed.dart';
part 'add_product_response_model.g.dart';

@freezed
abstract class AddProductResponseModel with _$AddProductResponseModel {
  const factory AddProductResponseModel({
    bool? success,
    String? message,
    String? error,
    AddedProductData? data,
  }) = _AddProductResponseModel;

  factory AddProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddProductResponseModelFromJson(json);
}

@freezed
abstract class AddedProductData with _$AddedProductData {
  const factory AddedProductData({
    String? id,
    String? video,
    String? title,
    String? description,
    int? price,
    String? condition,
    String? color,
    int? quantity,
    String? shippingTo,
    bool? isDraft,
    bool? isDelete,
    String? sellerId,
    String? brandId,
    String? shippingFromId,
    String? subCategoryId,
    String? categoryId,
  }) = _AddedProductData;

  factory AddedProductData.fromJson(Map<String, dynamic> json) =>
      _$AddedProductDataFromJson(json);
}