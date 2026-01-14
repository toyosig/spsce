// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowingUserModel {

 String get id; String get email; String get username; String? get profilePic; String? get location; String? get bio; String? get createdAt; int? get followersCount; int? get followingCount;
/// Create a copy of FollowingUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FollowingUserModelCopyWith<FollowingUserModel> get copyWith => _$FollowingUserModelCopyWithImpl<FollowingUserModel>(this as FollowingUserModel, _$identity);

  /// Serializes this FollowingUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FollowingUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic)&&(identical(other.location, location) || other.location == location)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,username,profilePic,location,bio,createdAt,followersCount,followingCount);

@override
String toString() {
  return 'FollowingUserModel(id: $id, email: $email, username: $username, profilePic: $profilePic, location: $location, bio: $bio, createdAt: $createdAt, followersCount: $followersCount, followingCount: $followingCount)';
}


}

/// @nodoc
abstract mixin class $FollowingUserModelCopyWith<$Res>  {
  factory $FollowingUserModelCopyWith(FollowingUserModel value, $Res Function(FollowingUserModel) _then) = _$FollowingUserModelCopyWithImpl;
@useResult
$Res call({
 String id, String email, String username, String? profilePic, String? location, String? bio, String? createdAt, int? followersCount, int? followingCount
});




}
/// @nodoc
class _$FollowingUserModelCopyWithImpl<$Res>
    implements $FollowingUserModelCopyWith<$Res> {
  _$FollowingUserModelCopyWithImpl(this._self, this._then);

  final FollowingUserModel _self;
  final $Res Function(FollowingUserModel) _then;

/// Create a copy of FollowingUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? username = null,Object? profilePic = freezed,Object? location = freezed,Object? bio = freezed,Object? createdAt = freezed,Object? followersCount = freezed,Object? followingCount = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,profilePic: freezed == profilePic ? _self.profilePic : profilePic // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,followersCount: freezed == followersCount ? _self.followersCount : followersCount // ignore: cast_nullable_to_non_nullable
as int?,followingCount: freezed == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _FollowingUserModel implements FollowingUserModel {
  const _FollowingUserModel({required this.id, required this.email, required this.username, this.profilePic, this.location, this.bio, this.createdAt, this.followersCount, this.followingCount});
  factory _FollowingUserModel.fromJson(Map<String, dynamic> json) => _$FollowingUserModelFromJson(json);

@override final  String id;
@override final  String email;
@override final  String username;
@override final  String? profilePic;
@override final  String? location;
@override final  String? bio;
@override final  String? createdAt;
@override final  int? followersCount;
@override final  int? followingCount;

/// Create a copy of FollowingUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FollowingUserModelCopyWith<_FollowingUserModel> get copyWith => __$FollowingUserModelCopyWithImpl<_FollowingUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FollowingUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FollowingUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic)&&(identical(other.location, location) || other.location == location)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,username,profilePic,location,bio,createdAt,followersCount,followingCount);

@override
String toString() {
  return 'FollowingUserModel(id: $id, email: $email, username: $username, profilePic: $profilePic, location: $location, bio: $bio, createdAt: $createdAt, followersCount: $followersCount, followingCount: $followingCount)';
}


}

/// @nodoc
abstract mixin class _$FollowingUserModelCopyWith<$Res> implements $FollowingUserModelCopyWith<$Res> {
  factory _$FollowingUserModelCopyWith(_FollowingUserModel value, $Res Function(_FollowingUserModel) _then) = __$FollowingUserModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, String username, String? profilePic, String? location, String? bio, String? createdAt, int? followersCount, int? followingCount
});




}
/// @nodoc
class __$FollowingUserModelCopyWithImpl<$Res>
    implements _$FollowingUserModelCopyWith<$Res> {
  __$FollowingUserModelCopyWithImpl(this._self, this._then);

  final _FollowingUserModel _self;
  final $Res Function(_FollowingUserModel) _then;

/// Create a copy of FollowingUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? username = null,Object? profilePic = freezed,Object? location = freezed,Object? bio = freezed,Object? createdAt = freezed,Object? followersCount = freezed,Object? followingCount = freezed,}) {
  return _then(_FollowingUserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,profilePic: freezed == profilePic ? _self.profilePic : profilePic // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,followersCount: freezed == followersCount ? _self.followersCount : followersCount // ignore: cast_nullable_to_non_nullable
as int?,followingCount: freezed == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
