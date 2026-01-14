// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_likes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductLikes {

 String? get id; ProductUser? get user;
/// Create a copy of ProductLikes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductLikesCopyWith<ProductLikes> get copyWith => _$ProductLikesCopyWithImpl<ProductLikes>(this as ProductLikes, _$identity);

  /// Serializes this ProductLikes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductLikes&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user);

@override
String toString() {
  return 'ProductLikes(id: $id, user: $user)';
}


}

/// @nodoc
abstract mixin class $ProductLikesCopyWith<$Res>  {
  factory $ProductLikesCopyWith(ProductLikes value, $Res Function(ProductLikes) _then) = _$ProductLikesCopyWithImpl;
@useResult
$Res call({
 String? id, ProductUser? user
});


$ProductUserCopyWith<$Res>? get user;

}
/// @nodoc
class _$ProductLikesCopyWithImpl<$Res>
    implements $ProductLikesCopyWith<$Res> {
  _$ProductLikesCopyWithImpl(this._self, this._then);

  final ProductLikes _self;
  final $Res Function(ProductLikes) _then;

/// Create a copy of ProductLikes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ProductUser?,
  ));
}
/// Create a copy of ProductLikes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $ProductUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ProductLikes implements ProductLikes {
  const _ProductLikes({this.id, this.user});
  factory _ProductLikes.fromJson(Map<String, dynamic> json) => _$ProductLikesFromJson(json);

@override final  String? id;
@override final  ProductUser? user;

/// Create a copy of ProductLikes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductLikesCopyWith<_ProductLikes> get copyWith => __$ProductLikesCopyWithImpl<_ProductLikes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductLikesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductLikes&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user);

@override
String toString() {
  return 'ProductLikes(id: $id, user: $user)';
}


}

/// @nodoc
abstract mixin class _$ProductLikesCopyWith<$Res> implements $ProductLikesCopyWith<$Res> {
  factory _$ProductLikesCopyWith(_ProductLikes value, $Res Function(_ProductLikes) _then) = __$ProductLikesCopyWithImpl;
@override @useResult
$Res call({
 String? id, ProductUser? user
});


@override $ProductUserCopyWith<$Res>? get user;

}
/// @nodoc
class __$ProductLikesCopyWithImpl<$Res>
    implements _$ProductLikesCopyWith<$Res> {
  __$ProductLikesCopyWithImpl(this._self, this._then);

  final _ProductLikes _self;
  final $Res Function(_ProductLikes) _then;

/// Create a copy of ProductLikes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? user = freezed,}) {
  return _then(_ProductLikes(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ProductUser?,
  ));
}

/// Create a copy of ProductLikes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $ProductUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
