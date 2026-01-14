// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FollowingUserModel _$FollowingUserModelFromJson(Map<String, dynamic> json) =>
    _FollowingUserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      profilePic: json['profilePic'] as String?,
      location: json['location'] as String?,
      bio: json['bio'] as String?,
      createdAt: json['createdAt'] as String?,
      followersCount: (json['followersCount'] as num?)?.toInt(),
      followingCount: (json['followingCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FollowingUserModelToJson(_FollowingUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'profilePic': instance.profilePic,
      'location': instance.location,
      'bio': instance.bio,
      'createdAt': instance.createdAt,
      'followersCount': instance.followersCount,
      'followingCount': instance.followingCount,
    };
