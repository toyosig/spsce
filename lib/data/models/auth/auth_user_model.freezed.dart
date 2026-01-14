// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthUserModel {

 String? get id; String? get email; String? get username; String? get createdAt; bool? get isVerified; String? get password; String? get profilePic; bool? get pushNotification; bool? get emailNotification; String? get fcmToken; DateTime? get updatedAt; double? get averageReview; int? get reviewCount;@JsonKey(name: 'avatar_url') String? get avatarUrl; List<dynamic>? get reviewsReceived;
/// Create a copy of AuthUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUserModelCopyWith<AuthUserModel> get copyWith => _$AuthUserModelCopyWithImpl<AuthUserModel>(this as AuthUserModel, _$identity);

  /// Serializes this AuthUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.password, password) || other.password == password)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic)&&(identical(other.pushNotification, pushNotification) || other.pushNotification == pushNotification)&&(identical(other.emailNotification, emailNotification) || other.emailNotification == emailNotification)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.averageReview, averageReview) || other.averageReview == averageReview)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&const DeepCollectionEquality().equals(other.reviewsReceived, reviewsReceived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,username,createdAt,isVerified,password,profilePic,pushNotification,emailNotification,fcmToken,updatedAt,averageReview,reviewCount,avatarUrl,const DeepCollectionEquality().hash(reviewsReceived));

@override
String toString() {
  return 'AuthUserModel(id: $id, email: $email, username: $username, createdAt: $createdAt, isVerified: $isVerified, password: $password, profilePic: $profilePic, pushNotification: $pushNotification, emailNotification: $emailNotification, fcmToken: $fcmToken, updatedAt: $updatedAt, averageReview: $averageReview, reviewCount: $reviewCount, avatarUrl: $avatarUrl, reviewsReceived: $reviewsReceived)';
}


}

/// @nodoc
abstract mixin class $AuthUserModelCopyWith<$Res>  {
  factory $AuthUserModelCopyWith(AuthUserModel value, $Res Function(AuthUserModel) _then) = _$AuthUserModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? email, String? username, String? createdAt, bool? isVerified, String? password, String? profilePic, bool? pushNotification, bool? emailNotification, String? fcmToken, DateTime? updatedAt, double? averageReview, int? reviewCount,@JsonKey(name: 'avatar_url') String? avatarUrl, List<dynamic>? reviewsReceived
});




}
/// @nodoc
class _$AuthUserModelCopyWithImpl<$Res>
    implements $AuthUserModelCopyWith<$Res> {
  _$AuthUserModelCopyWithImpl(this._self, this._then);

  final AuthUserModel _self;
  final $Res Function(AuthUserModel) _then;

/// Create a copy of AuthUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? email = freezed,Object? username = freezed,Object? createdAt = freezed,Object? isVerified = freezed,Object? password = freezed,Object? profilePic = freezed,Object? pushNotification = freezed,Object? emailNotification = freezed,Object? fcmToken = freezed,Object? updatedAt = freezed,Object? averageReview = freezed,Object? reviewCount = freezed,Object? avatarUrl = freezed,Object? reviewsReceived = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,isVerified: freezed == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,profilePic: freezed == profilePic ? _self.profilePic : profilePic // ignore: cast_nullable_to_non_nullable
as String?,pushNotification: freezed == pushNotification ? _self.pushNotification : pushNotification // ignore: cast_nullable_to_non_nullable
as bool?,emailNotification: freezed == emailNotification ? _self.emailNotification : emailNotification // ignore: cast_nullable_to_non_nullable
as bool?,fcmToken: freezed == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,averageReview: freezed == averageReview ? _self.averageReview : averageReview // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: freezed == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,reviewsReceived: freezed == reviewsReceived ? _self.reviewsReceived : reviewsReceived // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AuthUserModel implements AuthUserModel {
  const _AuthUserModel({this.id, this.email, this.username, this.createdAt, this.isVerified, this.password, this.profilePic, this.pushNotification, this.emailNotification, this.fcmToken, this.updatedAt, this.averageReview, this.reviewCount, @JsonKey(name: 'avatar_url') this.avatarUrl = '', final  List<dynamic>? reviewsReceived = const []}): _reviewsReceived = reviewsReceived;
  factory _AuthUserModel.fromJson(Map<String, dynamic> json) => _$AuthUserModelFromJson(json);

@override final  String? id;
@override final  String? email;
@override final  String? username;
@override final  String? createdAt;
@override final  bool? isVerified;
@override final  String? password;
@override final  String? profilePic;
@override final  bool? pushNotification;
@override final  bool? emailNotification;
@override final  String? fcmToken;
@override final  DateTime? updatedAt;
@override final  double? averageReview;
@override final  int? reviewCount;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
 final  List<dynamic>? _reviewsReceived;
@override@JsonKey() List<dynamic>? get reviewsReceived {
  final value = _reviewsReceived;
  if (value == null) return null;
  if (_reviewsReceived is EqualUnmodifiableListView) return _reviewsReceived;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AuthUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthUserModelCopyWith<_AuthUserModel> get copyWith => __$AuthUserModelCopyWithImpl<_AuthUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.password, password) || other.password == password)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic)&&(identical(other.pushNotification, pushNotification) || other.pushNotification == pushNotification)&&(identical(other.emailNotification, emailNotification) || other.emailNotification == emailNotification)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.averageReview, averageReview) || other.averageReview == averageReview)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&const DeepCollectionEquality().equals(other._reviewsReceived, _reviewsReceived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,username,createdAt,isVerified,password,profilePic,pushNotification,emailNotification,fcmToken,updatedAt,averageReview,reviewCount,avatarUrl,const DeepCollectionEquality().hash(_reviewsReceived));

@override
String toString() {
  return 'AuthUserModel(id: $id, email: $email, username: $username, createdAt: $createdAt, isVerified: $isVerified, password: $password, profilePic: $profilePic, pushNotification: $pushNotification, emailNotification: $emailNotification, fcmToken: $fcmToken, updatedAt: $updatedAt, averageReview: $averageReview, reviewCount: $reviewCount, avatarUrl: $avatarUrl, reviewsReceived: $reviewsReceived)';
}


}

/// @nodoc
abstract mixin class _$AuthUserModelCopyWith<$Res> implements $AuthUserModelCopyWith<$Res> {
  factory _$AuthUserModelCopyWith(_AuthUserModel value, $Res Function(_AuthUserModel) _then) = __$AuthUserModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? email, String? username, String? createdAt, bool? isVerified, String? password, String? profilePic, bool? pushNotification, bool? emailNotification, String? fcmToken, DateTime? updatedAt, double? averageReview, int? reviewCount,@JsonKey(name: 'avatar_url') String? avatarUrl, List<dynamic>? reviewsReceived
});




}
/// @nodoc
class __$AuthUserModelCopyWithImpl<$Res>
    implements _$AuthUserModelCopyWith<$Res> {
  __$AuthUserModelCopyWithImpl(this._self, this._then);

  final _AuthUserModel _self;
  final $Res Function(_AuthUserModel) _then;

/// Create a copy of AuthUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? email = freezed,Object? username = freezed,Object? createdAt = freezed,Object? isVerified = freezed,Object? password = freezed,Object? profilePic = freezed,Object? pushNotification = freezed,Object? emailNotification = freezed,Object? fcmToken = freezed,Object? updatedAt = freezed,Object? averageReview = freezed,Object? reviewCount = freezed,Object? avatarUrl = freezed,Object? reviewsReceived = freezed,}) {
  return _then(_AuthUserModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,isVerified: freezed == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,profilePic: freezed == profilePic ? _self.profilePic : profilePic // ignore: cast_nullable_to_non_nullable
as String?,pushNotification: freezed == pushNotification ? _self.pushNotification : pushNotification // ignore: cast_nullable_to_non_nullable
as bool?,emailNotification: freezed == emailNotification ? _self.emailNotification : emailNotification // ignore: cast_nullable_to_non_nullable
as bool?,fcmToken: freezed == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,averageReview: freezed == averageReview ? _self.averageReview : averageReview // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: freezed == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,reviewsReceived: freezed == reviewsReceived ? _self._reviewsReceived : reviewsReceived // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}


}

// dart format on
