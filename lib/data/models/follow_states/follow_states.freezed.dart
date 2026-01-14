// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowStates {

 String? get id; String? get email; String? get username; String? get profilePic; String? get location; String? get bio; String? get createdAt;
/// Create a copy of FollowStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FollowStatesCopyWith<FollowStates> get copyWith => _$FollowStatesCopyWithImpl<FollowStates>(this as FollowStates, _$identity);

  /// Serializes this FollowStates to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FollowStates&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic)&&(identical(other.location, location) || other.location == location)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,username,profilePic,location,bio,createdAt);

@override
String toString() {
  return 'FollowStates(id: $id, email: $email, username: $username, profilePic: $profilePic, location: $location, bio: $bio, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FollowStatesCopyWith<$Res>  {
  factory $FollowStatesCopyWith(FollowStates value, $Res Function(FollowStates) _then) = _$FollowStatesCopyWithImpl;
@useResult
$Res call({
 String? id, String? email, String? username, String? profilePic, String? location, String? bio, String? createdAt
});




}
/// @nodoc
class _$FollowStatesCopyWithImpl<$Res>
    implements $FollowStatesCopyWith<$Res> {
  _$FollowStatesCopyWithImpl(this._self, this._then);

  final FollowStates _self;
  final $Res Function(FollowStates) _then;

/// Create a copy of FollowStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? email = freezed,Object? username = freezed,Object? profilePic = freezed,Object? location = freezed,Object? bio = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,profilePic: freezed == profilePic ? _self.profilePic : profilePic // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _FollowStates implements FollowStates {
  const _FollowStates({this.id, this.email, this.username, this.profilePic, this.location, this.bio, this.createdAt});
  factory _FollowStates.fromJson(Map<String, dynamic> json) => _$FollowStatesFromJson(json);

@override final  String? id;
@override final  String? email;
@override final  String? username;
@override final  String? profilePic;
@override final  String? location;
@override final  String? bio;
@override final  String? createdAt;

/// Create a copy of FollowStates
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FollowStatesCopyWith<_FollowStates> get copyWith => __$FollowStatesCopyWithImpl<_FollowStates>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FollowStatesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FollowStates&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic)&&(identical(other.location, location) || other.location == location)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,username,profilePic,location,bio,createdAt);

@override
String toString() {
  return 'FollowStates(id: $id, email: $email, username: $username, profilePic: $profilePic, location: $location, bio: $bio, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FollowStatesCopyWith<$Res> implements $FollowStatesCopyWith<$Res> {
  factory _$FollowStatesCopyWith(_FollowStates value, $Res Function(_FollowStates) _then) = __$FollowStatesCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? email, String? username, String? profilePic, String? location, String? bio, String? createdAt
});




}
/// @nodoc
class __$FollowStatesCopyWithImpl<$Res>
    implements _$FollowStatesCopyWith<$Res> {
  __$FollowStatesCopyWithImpl(this._self, this._then);

  final _FollowStates _self;
  final $Res Function(_FollowStates) _then;

/// Create a copy of FollowStates
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? email = freezed,Object? username = freezed,Object? profilePic = freezed,Object? location = freezed,Object? bio = freezed,Object? createdAt = freezed,}) {
  return _then(_FollowStates(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,profilePic: freezed == profilePic ? _self.profilePic : profilePic // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
