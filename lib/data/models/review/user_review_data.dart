import 'package:circ/data/models/review/review_data_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'user_review_data.freezed.dart';
part 'user_review_data.g.dart';

@freezed
abstract class UsersReviewData with _$UsersReviewData {
  const factory UsersReviewData({
    List<ReviewDataModel>? reviews,
    int? averageRating,
    int? totalReviews,
  }) = _UsersReviewData;

  factory UsersReviewData.fromJson(Map<String, dynamic> json) =>
      _$UsersReviewDataFromJson(json);
}
