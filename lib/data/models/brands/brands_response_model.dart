import 'package:circ/data/models/home/products_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'brands_response_model.freezed.dart';
part 'brands_response_model.g.dart';

@freezed
abstract class BrandResponseModel with _$BrandResponseModel {
  const factory BrandResponseModel({
    bool? success,
    String? message,
    List<BrandModel>? data,
  }) = _BrandResponseModel;

  factory BrandResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BrandResponseModelFromJson(json);
}
