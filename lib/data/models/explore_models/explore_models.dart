import 'package:freezed_annotation/freezed_annotation.dart';

part 'explore_models.freezed.dart';
part 'explore_models.g.dart';

@freezed
abstract class ExploreResponse with _$ExploreResponse {
  const factory ExploreResponse({
    required List<Category> categories,
    required List<Brand> brands,
  }) = _ExploreResponse;

  factory ExploreResponse.fromJson(Map<String, dynamic> json) => _$ExploreResponseFromJson(json);
}

@freezed
abstract class Category with _$Category {
  const factory Category({
    required String id,
    required String name,
    required String image,
    required List<Subcategory> subcategories,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}

@freezed
abstract class Subcategory with _$Subcategory {
  const factory Subcategory({
    required String id,
    required String name,
  }) = _Subcategory;

  factory Subcategory.fromJson(Map<String, dynamic> json) => _$SubcategoryFromJson(json);
}

@freezed
abstract class Brand with _$Brand {
  const factory Brand({
    required String id,
    required String name,
  }) = _Brand;

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
}
