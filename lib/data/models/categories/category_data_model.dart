import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_data_model.freezed.dart';
part 'category_data_model.g.dart';

@freezed
abstract class CategoryData with _$CategoryData {
  const factory CategoryData({String? id, String? logo, String? name}) =
      _CategoryData;

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
}
