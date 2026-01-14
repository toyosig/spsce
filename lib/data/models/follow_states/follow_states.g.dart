// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_states.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FollowStates _$FollowStatesFromJson(Map<String, dynamic> json) =>
    _FollowStates(
      id: json['id'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      profilePic: json['profilePic'] as String?,
      location: json['location'] as String?,
      bio: json['bio'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$FollowStatesToJson(_FollowStates instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'profilePic': instance.profilePic,
      'location': instance.location,
      'bio': instance.bio,
      'createdAt': instance.createdAt,
    };
