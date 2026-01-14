import 'package:freezed_annotation/freezed_annotation.dart';
import 'products_data.dart';

part 'toggle_like_response_model.freezed.dart';
part 'toggle_like_response_model.g.dart';

@freezed
abstract class ToggleLikeData with _$ToggleLikeData {
  const factory ToggleLikeData({
    required bool liked,
    required ProductsData product,
  }) = _ToggleLikeData;

  factory ToggleLikeData.fromJson(Map<String, dynamic> json) =>
      _$ToggleLikeDataFromJson(json);
}

@freezed
abstract class ToggleLikeResponseModel with _$ToggleLikeResponseModel {
  const factory ToggleLikeResponseModel({
    bool? success,
    String? message,
    ToggleLikeData? data,
  }) = _ToggleLikeResponseModel;

  factory ToggleLikeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ToggleLikeResponseModelFromJson(json);
}
