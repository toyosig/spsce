import 'package:circ/data/models/home/products_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_details.freezed.dart';
part 'product_details.g.dart';

@freezed
abstract class ProductDetails with _$ProductDetails {
  const factory ProductDetails({
    bool? success,
    String? message,
    ProductsData? data,
  }) = _ProductDetails;

  factory ProductDetails.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsFromJson(json);
}
