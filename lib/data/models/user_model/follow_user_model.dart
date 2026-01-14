import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow_user_model.freezed.dart';
part 'follow_user_model.g.dart';

@freezed
abstract class FollowingUserModel with _$FollowingUserModel {
  const factory FollowingUserModel({
    required String id,
    required String email,
    required String username,
    String? profilePic,
    String? location,
    String? bio,
    String? createdAt,
    int? followersCount,
    int? followingCount,
  }) = _FollowingUserModel;

  factory FollowingUserModel.fromJson(Map<String, dynamic> json) =>
      _$FollowingUserModelFromJson(json);
}
