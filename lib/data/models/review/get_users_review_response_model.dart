import 'package:circ/data/models/review/user_review_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_users_review_response_model.freezed.dart';
part 'get_users_review_response_model.g.dart';

@freezed
abstract class UsersReviewResponseModel with _$UsersReviewResponseModel {
  const factory UsersReviewResponseModel({
    int? statusCode,
    String? message,
    UsersReviewData? data,
  }) = _UsersReviewResponseModel;

  factory UsersReviewResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UsersReviewResponseModelFromJson(json);
}
