import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_category_model.freezed.dart';
part 'main_category_model.g.dart';

@freezed
abstract class MainCategoryResponse with _$MainCategoryResponse {
  const factory MainCategoryResponse({
    required bool success,
    required String message,
    required List<MainCategory> data,
  }) = _MainCategoryResponse;

  factory MainCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$MainCategoryResponseFromJson(json);
}

@freezed
abstract class MainCategory with _$MainCategory {
  const factory MainCategory({
    required String id,
    required String logo,
    required String name,
  }) = _MainCategory;

  factory MainCategory.fromJson(Map<String, dynamic> json) =>
      _$MainCategoryFromJson(json);
}
