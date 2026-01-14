import 'package:circ/data/models/review/review_data_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_response_model.freezed.dart';
part 'review_response_model.g.dart';

@freezed
abstract class ReviewResponseModel with _$ReviewResponseModel {
  const factory ReviewResponseModel({
    int? statusCode,
    String? message,
    ReviewDataModel? data,
    String? error,
  }) = _ReviewResponseModel;

  factory ReviewResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseModelFromJson(json);
}
