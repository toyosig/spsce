import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_category_model.freezed.dart';
part 'sub_category_model.g.dart';

@freezed
abstract class SubCategoryModel with _$SubCategoryModel {
  const factory SubCategoryModel({
    required String id,
    required String name,
  }) = _SubCategoryModel;

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);
}

@freezed
 abstract class SubCategoryResponse with _$SubCategoryResponse {
  const factory SubCategoryResponse({
    required bool success,
    required String message,
    required List<SubCategoryModel> data,
  }) = _SubCategoryResponse;

  factory SubCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryResponseFromJson(json);
}
