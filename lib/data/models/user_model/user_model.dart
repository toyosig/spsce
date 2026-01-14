import 'package:circ/data/models/user_model/follow_user_model.dart';
import 'package:circ/data/models/user_model/seller_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    String? id,
    String? email,
    String? username,
    String? profilePic,
    DateTime? createdAt,
    bool? pushNotification,
    bool? emailNotification,
    String? fcmToken,
    DateTime? updatedAt,
    SellerModel? seller,
    int? totalReviews,
    double? averageRating,
    List<FollowingUserModel>? followers,
    int? followerCount,
    List<FollowingUserModel>? following,
    int? followingCount,
    String? bio,
    String? location,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}