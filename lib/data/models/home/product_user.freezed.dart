// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductUser {

 String? get id; String? get username; String? get profilePic;
/// Create a copy of ProductUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductUserCopyWith<ProductUser> get copyWith => _$ProductUserCopyWithImpl<ProductUser>(this as ProductUser, _$identity);

  /// Serializes this ProductUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductUser&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,profilePic);

@override
String toString() {
  return 'ProductUser(id: $id, username: $username, profilePic: $profilePic)';
}


}

/// @nodoc
abstract mixin class $ProductUserCopyWith<$Res>  {
  factory $ProductUserCopyWith(ProductUser value, $Res Function(ProductUser) _then) = _$ProductUserCopyWithImpl;
@useResult
$Res call({
 String? id, String? username, String? profilePic
});




}
/// @nodoc
class _$ProductUserCopyWithImpl<$Res>
    implements $ProductUserCopyWith<$Res> {
  _$ProductUserCopyWithImpl(this._self, this._then);

  final ProductUser _self;
  final $Res Function(ProductUser) _then;

/// Create a copy of ProductUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? username = freezed,Object? profilePic = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,profilePic: freezed == profilePic ? _self.profilePic : profilePic // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ProductUser implements ProductUser {
  const _ProductUser({this.id, this.username, this.profilePic});
  factory _ProductUser.fromJson(Map<String, dynamic> json) => _$ProductUserFromJson(json);

@override final  String? id;
@override final  String? username;
@override final  String? profilePic;

/// Create a copy of ProductUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductUserCopyWith<_ProductUser> get copyWith => __$ProductUserCopyWithImpl<_ProductUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductUser&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,profilePic);

@override
String toString() {
  return 'ProductUser(id: $id, username: $username, profilePic: $profilePic)';
}


}

/// @nodoc
abstract mixin class _$ProductUserCopyWith<$Res> implements $ProductUserCopyWith<$Res> {
  factory _$ProductUserCopyWith(_ProductUser value, $Res Function(_ProductUser) _then) = __$ProductUserCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? username, String? profilePic
});




}
/// @nodoc
class __$ProductUserCopyWithImpl<$Res>
    implements _$ProductUserCopyWith<$Res> {
  __$ProductUserCopyWithImpl(this._self, this._then);

  final _ProductUser _self;
  final $Res Function(_ProductUser) _then;

/// Create a copy of ProductUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? username = freezed,Object? profilePic = freezed,}) {
  return _then(_ProductUser(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,profilePic: freezed == profilePic ? _self.profilePic : profilePic // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
