import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_data_model.freezed.dart';
part 'review_data_model.g.dart';

@freezed
abstract class ReviewDataModel with _$ReviewDataModel {
  const factory ReviewDataModel({
    String? id,
    double? rating,
    String? text,
    String? createdAt,
    String? updatedAt,
    ReviewUserModel? reviewer,
    ReviewUserModel? reviewedUser,
  }) = _ReviewDataModel;

  factory ReviewDataModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewDataModelFromJson(json);
}

@freezed
abstract class ReviewUserModel with _$ReviewUserModel {
  const factory ReviewUserModel({
    String? id,
    String? username,
    String? profilePic,
  }) = _ReviewUserModel;

  factory ReviewUserModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewUserModelFromJson(json);
}
