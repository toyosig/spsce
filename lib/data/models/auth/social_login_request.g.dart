// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SocialLoginRequest _$SocialLoginRequestFromJson(Map<String, dynamic> json) =>
    _SocialLoginRequest(
      provider: json['provider'] as String,
      providerId: json['providerId'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String?,
      username: json['username'] as String?,
      profilePic: json['profilePic'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      fcmToken: json['fcmToken'] as String,
    );

Map<String, dynamic> _$SocialLoginRequestToJson(_SocialLoginRequest instance) =>
    <String, dynamic>{
      'provider': instance.provider,
      'providerId': instance.providerId,
      'email': instance.email,
      'fullName': instance.fullName,
      'username': instance.username,
      'profilePic': instance.profilePic,
      'dateOfBirth': instance.dateOfBirth,
      'fcmToken': instance.fcmToken,
    };
