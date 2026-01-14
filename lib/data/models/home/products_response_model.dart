import 'package:circ/data/models/home/products_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_response_model.freezed.dart';
part 'products_response_model.g.dart';

@freezed
abstract class ProductsResponseModel with _$ProductsResponseModel {
  const factory ProductsResponseModel({
    String? message,
    bool? success,
    List<ProductsData>? data,
    int? total,
    int? page,
    int? limit,
    int? totalPages,
  }) = _ProductsResponseModel;

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseModelFromJson(json);
}
