// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewDataModel {

 String? get id; double? get rating; String? get text; String? get createdAt; String? get updatedAt; ReviewUserModel? get reviewer; ReviewUserModel? get reviewedUser;
/// Create a copy of ReviewDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewDataModelCopyWith<ReviewDataModel> get copyWith => _$ReviewDataModelCopyWithImpl<ReviewDataModel>(this as ReviewDataModel, _$identity);

  /// Serializes this ReviewDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.text, text) || other.text == text)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.reviewer, reviewer) || other.reviewer == reviewer)&&(identical(other.reviewedUser, reviewedUser) || other.reviewedUser == reviewedUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rating,text,createdAt,updatedAt,reviewer,reviewedUser);

@override
String toString() {
  return 'ReviewDataModel(id: $id, rating: $rating, text: $text, createdAt: $createdAt, updatedAt: $updatedAt, reviewer: $reviewer, reviewedUser: $reviewedUser)';
}


}

/// @nodoc
abstract mixin class $ReviewDataModelCopyWith<$Res>  {
  factory $ReviewDataModelCopyWith(ReviewDataModel value, $Res Function(ReviewDataModel) _then) = _$ReviewDataModelCopyWithImpl;
@useResult
$Res call({
 String? id, double? rating, String? text, String? createdAt, String? updatedAt, ReviewUserModel? reviewer, ReviewUserModel? reviewedUser
});


$ReviewUserModelCopyWith<$Res>? get reviewer;$ReviewUserModelCopyWith<$Res>? get reviewedUser;

}
/// @nodoc
class _$ReviewDataModelCopyWithImpl<$Res>
    implements $ReviewDataModelCopyWith<$Res> {
  _$ReviewDataModelCopyWithImpl(this._self, this._then);

  final ReviewDataModel _self;
  final $Res Function(ReviewDataModel) _then;

/// Create a copy of ReviewDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? rating = freezed,Object? text = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? reviewer = freezed,Object? reviewedUser = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,reviewer: freezed == reviewer ? _self.reviewer : reviewer // ignore: cast_nullable_to_non_nullable
as ReviewUserModel?,reviewedUser: freezed == reviewedUser ? _self.reviewedUser : reviewedUser // ignore: cast_nullable_to_non_nullable
as ReviewUserModel?,
  ));
}
/// Create a copy of ReviewDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewUserModelCopyWith<$Res>? get reviewer {
    if (_self.reviewer == null) {
    return null;
  }

  return $ReviewUserModelCopyWith<$Res>(_self.reviewer!, (value) {
    return _then(_self.copyWith(reviewer: value));
  });
}/// Create a copy of ReviewDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewUserModelCopyWith<$Res>? get reviewedUser {
    if (_self.reviewedUser == null) {
    return null;
  }

  return $ReviewUserModelCopyWith<$Res>(_self.reviewedUser!, (value) {
    return _then(_self.copyWith(reviewedUser: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ReviewDataModel implements ReviewDataModel {
  const _ReviewDataModel({this.id, this.rating, this.text, this.createdAt, this.updatedAt, this.reviewer, this.reviewedUser});
  factory _ReviewDataModel.fromJson(Map<String, dynamic> json) => _$ReviewDataModelFromJson(json);

@override final  String? id;
@override final  double? rating;
@override final  String? text;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  ReviewUserModel? reviewer;
@override final  ReviewUserModel? reviewedUser;

/// Create a copy of ReviewDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewDataModelCopyWith<_ReviewDataModel> get copyWith => __$ReviewDataModelCopyWithImpl<_ReviewDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.text, text) || other.text == text)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.reviewer, reviewer) || other.reviewer == reviewer)&&(identical(other.reviewedUser, reviewedUser) || other.reviewedUser == reviewedUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rating,text,createdAt,updatedAt,reviewer,reviewedUser);

@override
String toString() {
  return 'ReviewDataModel(id: $id, rating: $rating, text: $text, createdAt: $createdAt, updatedAt: $updatedAt, reviewer: $reviewer, reviewedUser: $reviewedUser)';
}


}

/// @nodoc
abstract mixin class _$ReviewDataModelCopyWith<$Res> implements $ReviewDataModelCopyWith<$Res> {
  factory _$ReviewDataModelCopyWith(_ReviewDataModel value, $Res Function(_ReviewDataModel) _then) = __$ReviewDataModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, double? rating, String? text, String? createdAt, String? updatedAt, ReviewUserModel? reviewer, ReviewUserModel? reviewedUser
});


@override $ReviewUserModelCopyWith<$Res>? get reviewer;@override $ReviewUserModelCopyWith<$Res>? get reviewedUser;

}
/// @nodoc
class __$ReviewDataModelCopyWithImpl<$Res>
    implements _$ReviewDataModelCopyWith<$Res> {
  __$ReviewDataModelCopyWithImpl(this._self, this._then);

  final _ReviewDataModel _self;
  final $Res Function(_ReviewDataModel) _then;

/// Create a copy of ReviewDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? rating = freezed,Object? text = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? reviewer = freezed,Object? reviewedUser = freezed,}) {
  return _then(_ReviewDataModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,reviewer: freezed == reviewer ? _self.reviewer : reviewer // ignore: cast_nullable_to_non_nullable
as ReviewUserModel?,reviewedUser: freezed == reviewedUser ? _self.reviewedUser : reviewedUser // ignore: cast_nullable_to_non_nullable
as ReviewUserModel?,
  ));
}

/// Create a copy of ReviewDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewUserModelCopyWith<$Res>? get reviewer {
    if (_self.reviewer == null) {
    return null;
  }

  return $ReviewUserModelCopyWith<$Res>(_self.reviewer!, (value) {
    return _then(_self.copyWith(reviewer: value));
  });
}/// Create a copy of ReviewDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewUserModelCopyWith<$Res>? get reviewedUser {
    if (_self.reviewedUser == null) {
    return null;
  }

  return $ReviewUserModelCopyWith<$Res>(_self.reviewedUser!, (value) {
    return _then(_self.copyWith(reviewedUser: value));
  });
}
}


/// @nodoc
mixin _$ReviewUserModel {

 String? get id; String? get username; String? get profilePic;
/// Create a copy of ReviewUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewUserModelCopyWith<ReviewUserModel> get copyWith => _$ReviewUserModelCopyWithImpl<ReviewUserModel>(this as ReviewUserModel, _$identity);

  /// Serializes this ReviewUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,profilePic);

@override
String toString() {
  return 'ReviewUserModel(id: $id, username: $username, profilePic: $profilePic)';
}


}

/// @nodoc
abstract mixin class $ReviewUserModelCopyWith<$Res>  {
  factory $ReviewUserModelCopyWith(ReviewUserModel value, $Res Function(ReviewUserModel) _then) = _$ReviewUserModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? username, String? profilePic
});




}
/// @nodoc
class _$ReviewUserModelCopyWithImpl<$Res>
    implements $ReviewUserModelCopyWith<$Res> {
  _$ReviewUserModelCopyWithImpl(this._self, this._then);

  final ReviewUserModel _self;
  final $Res Function(ReviewUserModel) _then;

/// Create a copy of ReviewUserModel
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

class _ReviewUserModel implements ReviewUserModel {
  const _ReviewUserModel({this.id, this.username, this.profilePic});
  factory _ReviewUserModel.fromJson(Map<String, dynamic> json) => _$ReviewUserModelFromJson(json);

@override final  String? id;
@override final  String? username;
@override final  String? profilePic;

/// Create a copy of ReviewUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewUserModelCopyWith<_ReviewUserModel> get copyWith => __$ReviewUserModelCopyWithImpl<_ReviewUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,profilePic);

@override
String toString() {
  return 'ReviewUserModel(id: $id, username: $username, profilePic: $profilePic)';
}


}

/// @nodoc
abstract mixin class _$ReviewUserModelCopyWith<$Res> implements $ReviewUserModelCopyWith<$Res> {
  factory _$ReviewUserModelCopyWith(_ReviewUserModel value, $Res Function(_ReviewUserModel) _then) = __$ReviewUserModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? username, String? profilePic
});




}
/// @nodoc
class __$ReviewUserModelCopyWithImpl<$Res>
    implements _$ReviewUserModelCopyWith<$Res> {
  __$ReviewUserModelCopyWithImpl(this._self, this._then);

  final _ReviewUserModel _self;
  final $Res Function(_ReviewUserModel) _then;

/// Create a copy of ReviewUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? username = freezed,Object? profilePic = freezed,}) {
  return _then(_ReviewUserModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,profilePic: freezed == profilePic ? _self.profilePic : profilePic // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
