// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String?,
  email: json['email'] as String?,
  username: json['username'] as String?,
  profilePic: json['profilePic'] as String?,
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  pushNotification: json['pushNotification'] as bool?,
  emailNotification: json['emailNotification'] as bool?,
  fcmToken: json['fcmToken'] as String?,
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
  seller:
      json['seller'] == null
          ? null
          : SellerModel.fromJson(json['seller'] as Map<String, dynamic>),
  totalReviews: (json['totalReviews'] as num?)?.toInt(),
  averageRating: (json['averageRating'] as num?)?.toDouble(),
  followers:
      (json['followers'] as List<dynamic>?)
          ?.map((e) => FollowingUserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  followerCount: (json['followerCount'] as num?)?.toInt(),
  following:
      (json['following'] as List<dynamic>?)
          ?.map((e) => FollowingUserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  followingCount: (json['followingCount'] as num?)?.toInt(),
  bio: json['bio'] as String?,
  location: json['location'] as String?,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'profilePic': instance.profilePic,
      'createdAt': instance.createdAt?.toIso8601String(),
      'pushNotification': instance.pushNotification,
      'emailNotification': instance.emailNotification,
      'fcmToken': instance.fcmToken,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'seller': instance.seller,
      'totalReviews': instance.totalReviews,
      'averageRating': instance.averageRating,
      'followers': instance.followers,
      'followerCount': instance.followerCount,
      'following': instance.following,
      'followingCount': instance.followingCount,
      'bio': instance.bio,
      'location': instance.location,
    };
