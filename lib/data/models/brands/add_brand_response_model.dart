import 'package:circ/data/models/home/products_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_brand_response_model.freezed.dart';
part 'add_brand_response_model.g.dart';

@freezed
abstract class AddBrandResponseModel with _$AddBrandResponseModel {
  const factory AddBrandResponseModel({
    bool? success,
    String? error,
    String? message,
    BrandModel? data,
  }) = _AddBrandResponseModel;

  factory AddBrandResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddBrandResponseModelFromJson(json);
}
