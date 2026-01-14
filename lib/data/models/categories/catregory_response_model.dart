import 'package:circ/data/models/categories/category_data_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'catregory_response_model.freezed.dart';
part 'catregory_response_model.g.dart';

@freezed
abstract class CategoriesResponseModel with _$CategoriesResponseModel {
  const factory CategoriesResponseModel({
    bool? success,
    String? message,
    List<CategoryData>? data,
  }) = _CategoriesResponseModel;

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseModelFromJson(json);
}
