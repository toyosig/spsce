import 'package:freezed_annotation/freezed_annotation.dart';

part 'sizes_by_category_response_model.freezed.dart';
part 'sizes_by_category_response_model.g.dart';

@freezed
abstract class SizesByCategoryResponseModel
    with _$SizesByCategoryResponseModel {
  const factory SizesByCategoryResponseModel({
    required bool success,
    required String message,
    required SizesByCategoryData data,
  }) = _SizesByCategoryResponseModel;

  factory SizesByCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SizesByCategoryResponseModelFromJson(json);
}

@freezed
abstract class SizesByCategoryData with _$SizesByCategoryData {
  const factory SizesByCategoryData({
    required String categoryId,
    required String categoryName,
    required Map<String, List<SizeValue>> sizes,
  }) = _SizesByCategoryData;

  factory SizesByCategoryData.fromJson(Map<String, dynamic> json) =>
      _$SizesByCategoryDataFromJson(json);
}

@freezed
abstract class SizeValue with _$SizeValue {
  const factory SizeValue({required String id, required String value}) =
      _SizeValue;

  factory SizeValue.fromJson(Map<String, dynamic> json) =>
      _$SizeValueFromJson(json);
}
