// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_login_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocialLoginRequest {

 String get provider;// 'google', 'apple', etc.
 String get providerId; String get email; String? get fullName; String? get username; String? get profilePic; String? get dateOfBirth;// String? idToken, // optional for backend
 String get fcmToken;
/// Create a copy of SocialLoginRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SocialLoginRequestCopyWith<SocialLoginRequest> get copyWith => _$SocialLoginRequestCopyWithImpl<SocialLoginRequest>(this as SocialLoginRequest, _$identity);

  /// Serializes this SocialLoginRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SocialLoginRequest&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.username, username) || other.username == username)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,provider,providerId,email,fullName,username,profilePic,dateOfBirth,fcmToken);

@override
String toString() {
  return 'SocialLoginRequest(provider: $provider, providerId: $providerId, email: $email, fullName: $fullName, username: $username, profilePic: $profilePic, dateOfBirth: $dateOfBirth, fcmToken: $fcmToken)';
}


}

/// @nodoc
abstract mixin class $SocialLoginRequestCopyWith<$Res>  {
  factory $SocialLoginRequestCopyWith(SocialLoginRequest value, $Res Function(SocialLoginRequest) _then) = _$SocialLoginRequestCopyWithImpl;
@useResult
$Res call({
 String provider, String providerId, String email, String? fullName, String? username, String? profilePic, String? dateOfBirth, String fcmToken
});




}
/// @nodoc
class _$SocialLoginRequestCopyWithImpl<$Res>
    implements $SocialLoginRequestCopyWith<$Res> {
  _$SocialLoginRequestCopyWithImpl(this._self, this._then);

  final SocialLoginRequest _self;
  final $Res Function(SocialLoginRequest) _then;

/// Create a copy of SocialLoginRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? provider = null,Object? providerId = null,Object? email = null,Object? fullName = freezed,Object? username = freezed,Object? profilePic = freezed,Object? dateOfBirth = freezed,Object? fcmToken = null,}) {
  return _then(_self.copyWith(
provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,profilePic: freezed == profilePic ? _self.profilePic : profilePic // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SocialLoginRequest implements SocialLoginRequest {
  const _SocialLoginRequest({required this.provider, required this.providerId, required this.email, this.fullName, this.username, this.profilePic, this.dateOfBirth, required this.fcmToken});
  factory _SocialLoginRequest.fromJson(Map<String, dynamic> json) => _$SocialLoginRequestFromJson(json);

@override final  String provider;
// 'google', 'apple', etc.
@override final  String providerId;
@override final  String email;
@override final  String? fullName;
@override final  String? username;
@override final  String? profilePic;
@override final  String? dateOfBirth;
// String? idToken, // optional for backend
@override final  String fcmToken;

/// Create a copy of SocialLoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocialLoginRequestCopyWith<_SocialLoginRequest> get copyWith => __$SocialLoginRequestCopyWithImpl<_SocialLoginRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SocialLoginRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocialLoginRequest&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.username, username) || other.username == username)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,provider,providerId,email,fullName,username,profilePic,dateOfBirth,fcmToken);

@override
String toString() {
  return 'SocialLoginRequest(provider: $provider, providerId: $providerId, email: $email, fullName: $fullName, username: $username, profilePic: $profilePic, dateOfBirth: $dateOfBirth, fcmToken: $fcmToken)';
}


}

/// @nodoc
abstract mixin class _$SocialLoginRequestCopyWith<$Res> implements $SocialLoginRequestCopyWith<$Res> {
  factory _$SocialLoginRequestCopyWith(_SocialLoginRequest value, $Res Function(_SocialLoginRequest) _then) = __$SocialLoginRequestCopyWithImpl;
@override @useResult
$Res call({
 String provider, String providerId, String email, String? fullName, String? username, String? profilePic, String? dateOfBirth, String fcmToken
});




}
/// @nodoc
class __$SocialLoginRequestCopyWithImpl<$Res>
    implements _$SocialLoginRequestCopyWith<$Res> {
  __$SocialLoginRequestCopyWithImpl(this._self, this._then);

  final _SocialLoginRequest _self;
  final $Res Function(_SocialLoginRequest) _then;

/// Create a copy of SocialLoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? provider = null,Object? providerId = null,Object? email = null,Object? fullName = freezed,Object? username = freezed,Object? profilePic = freezed,Object? dateOfBirth = freezed,Object? fcmToken = null,}) {
  return _then(_SocialLoginRequest(
provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,profilePic: freezed == profilePic ? _self.profilePic : profilePic // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
