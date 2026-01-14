// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthUserModel _$AuthUserModelFromJson(Map<String, dynamic> json) =>
    _AuthUserModel(
      id: json['id'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      createdAt: json['createdAt'] as String?,
      isVerified: json['isVerified'] as bool?,
      password: json['password'] as String?,
      profilePic: json['profilePic'] as String?,
      pushNotification: json['pushNotification'] as bool?,
      emailNotification: json['emailNotification'] as bool?,
      fcmToken: json['fcmToken'] as String?,
      updatedAt:
          json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String),
      averageReview: (json['averageReview'] as num?)?.toDouble(),
      reviewCount: (json['reviewCount'] as num?)?.toInt(),
      avatarUrl: json['avatar_url'] as String? ?? '',
      reviewsReceived: json['reviewsReceived'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$AuthUserModelToJson(_AuthUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'createdAt': instance.createdAt,
      'isVerified': instance.isVerified,
      'password': instance.password,
      'profilePic': instance.profilePic,
      'pushNotification': instance.pushNotification,
      'emailNotification': instance.emailNotification,
      'fcmToken': instance.fcmToken,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'averageReview': instance.averageReview,
      'reviewCount': instance.reviewCount,
      'avatar_url': instance.avatarUrl,
      'reviewsReceived': instance.reviewsReceived,
    };
