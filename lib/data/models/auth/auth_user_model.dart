// lib/data/models/auth/user_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user_model.freezed.dart';
part 'auth_user_model.g.dart';

@freezed
abstract class AuthUserModel with _$AuthUserModel {
  const factory AuthUserModel({
    String? id,
    String? email,
    String? username,
    String? createdAt,
    bool? isVerified,
    String? password,
    String? profilePic,
    bool? pushNotification,
    bool? emailNotification,
    String? fcmToken,
    DateTime? updatedAt,
    double? averageReview,
    int? reviewCount,
    @Default('') @JsonKey(name: 'avatar_url') String? avatarUrl,
    @Default([]) List<dynamic>? reviewsReceived,
  }) = _AuthUserModel;

  factory AuthUserModel.fromJson(Map<String, dynamic> json) =>
      _$AuthUserModelFromJson(json);
}
