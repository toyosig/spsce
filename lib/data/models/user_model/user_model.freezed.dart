// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

 String? get id; String? get email; String? get username; String? get profilePic; DateTime? get createdAt; bool? get pushNotification; bool? get emailNotification; String? get fcmToken; DateTime? get updatedAt; SellerModel? get seller; int? get totalReviews; double? get averageRating; List<FollowingUserModel>? get followers; int? get followerCount; List<FollowingUserModel>? get following; int? get followingCount; String? get bio; String? get location;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.pushNotification, pushNotification) || other.pushNotification == pushNotification)&&(identical(other.emailNotification, emailNotification) || other.emailNotification == emailNotification)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.seller, seller) || other.seller == seller)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&const DeepCollectionEquality().equals(other.followers, followers)&&(identical(other.followerCount, followerCount) || other.followerCount == followerCount)&&const DeepCollectionEquality().equals(other.following, following)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,username,profilePic,createdAt,pushNotification,emailNotification,fcmToken,updatedAt,seller,totalReviews,averageRating,const DeepCollectionEquality().hash(followers),followerCount,const DeepCollectionEquality().hash(following),followingCount,bio,location);

@override
String toString() {
  return 'UserModel(id: $id, email: $email, username: $username, profilePic: $profilePic, createdAt: $createdAt, pushNotification: $pushNotification, emailNotification: $emailNotification, fcmToken: $fcmToken, updatedAt: $updatedAt, seller: $seller, totalReviews: $totalReviews, averageRating: $averageRating, followers: $followers, followerCount: $followerCount, following: $following, followingCount: $followingCount, bio: $bio, location: $location)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? email, String? username, String? profilePic, DateTime? createdAt, bool? pushNotification, bool? emailNotification, String? fcmToken, DateTime? updatedAt, SellerModel? seller, int? totalReviews, double? averageRating, List<FollowingUserModel>? followers, int? followerCount, List<FollowingUserModel>? following, int? followingCount, String? bio, String? location
});


$SellerModelCopyWith<$Res>? get seller;

}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? email = freezed,Object? username = freezed,Object? profilePic = freezed,Object? createdAt = freezed,Object? pushNotification = freezed,Object? emailNotification = freezed,Object? fcmToken = freezed,Object? updatedAt = freezed,Object? seller = freezed,Object? totalReviews = freezed,Object? averageRating = freezed,Object? followers = freezed,Object? followerCount = freezed,Object? following = freezed,Object? followingCount = freezed,Object? bio = freezed,Object? location = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,profilePic: freezed == profilePic ? _self.profilePic : profilePic // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,pushNotification: freezed == pushNotification ? _self.pushNotification : pushNotification // ignore: cast_nullable_to_non_nullable
as bool?,emailNotification: freezed == emailNotification ? _self.emailNotification : emailNotification // ignore: cast_nullable_to_non_nullable
as bool?,fcmToken: freezed == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,seller: freezed == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as SellerModel?,totalReviews: freezed == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int?,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double?,followers: freezed == followers ? _self.followers : followers // ignore: cast_nullable_to_non_nullable
as List<FollowingUserModel>?,followerCount: freezed == followerCount ? _self.followerCount : followerCount // ignore: cast_nullable_to_non_nullable
as int?,following: freezed == following ? _self.following : following // ignore: cast_nullable_to_non_nullable
as List<FollowingUserModel>?,followingCount: freezed == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellerModelCopyWith<$Res>? get seller {
    if (_self.seller == null) {
    return null;
  }

  return $SellerModelCopyWith<$Res>(_self.seller!, (value) {
    return _then(_self.copyWith(seller: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _UserModel implements UserModel {
  const _UserModel({this.id, this.email, this.username, this.profilePic, this.createdAt, this.pushNotification, this.emailNotification, this.fcmToken, this.updatedAt, this.seller, this.totalReviews, this.averageRating, final  List<FollowingUserModel>? followers, this.followerCount, final  List<FollowingUserModel>? following, this.followingCount, this.bio, this.location}): _followers = followers,_following = following;
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  String? id;
@override final  String? email;
@override final  String? username;
@override final  String? profilePic;
@override final  DateTime? createdAt;
@override final  bool? pushNotification;
@override final  bool? emailNotification;
@override final  String? fcmToken;
@override final  DateTime? updatedAt;
@override final  SellerModel? seller;
@override final  int? totalReviews;
@override final  double? averageRating;
 final  List<FollowingUserModel>? _followers;
@override List<FollowingUserModel>? get followers {
  final value = _followers;
  if (value == null) return null;
  if (_followers is EqualUnmodifiableListView) return _followers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? followerCount;
 final  List<FollowingUserModel>? _following;
@override List<FollowingUserModel>? get following {
  final value = _following;
  if (value == null) return null;
  if (_following is EqualUnmodifiableListView) return _following;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? followingCount;
@override final  String? bio;
@override final  String? location;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.pushNotification, pushNotification) || other.pushNotification == pushNotification)&&(identical(other.emailNotification, emailNotification) || other.emailNotification == emailNotification)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.seller, seller) || other.seller == seller)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&const DeepCollectionEquality().equals(other._followers, _followers)&&(identical(other.followerCount, followerCount) || other.followerCount == followerCount)&&const DeepCollectionEquality().equals(other._following, _following)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,username,profilePic,createdAt,pushNotification,emailNotification,fcmToken,updatedAt,seller,totalReviews,averageRating,const DeepCollectionEquality().hash(_followers),followerCount,const DeepCollectionEquality().hash(_following),followingCount,bio,location);

@override
String toString() {
  return 'UserModel(id: $id, email: $email, username: $username, profilePic: $profilePic, createdAt: $createdAt, pushNotification: $pushNotification, emailNotification: $emailNotification, fcmToken: $fcmToken, updatedAt: $updatedAt, seller: $seller, totalReviews: $totalReviews, averageRating: $averageRating, followers: $followers, followerCount: $followerCount, following: $following, followingCount: $followingCount, bio: $bio, location: $location)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? email, String? username, String? profilePic, DateTime? createdAt, bool? pushNotification, bool? emailNotification, String? fcmToken, DateTime? updatedAt, SellerModel? seller, int? totalReviews, double? averageRating, List<FollowingUserModel>? followers, int? followerCount, List<FollowingUserModel>? following, int? followingCount, String? bio, String? location
});


@override $SellerModelCopyWith<$Res>? get seller;

}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? email = freezed,Object? username = freezed,Object? profilePic = freezed,Object? createdAt = freezed,Object? pushNotification = freezed,Object? emailNotification = freezed,Object? fcmToken = freezed,Object? updatedAt = freezed,Object? seller = freezed,Object? totalReviews = freezed,Object? averageRating = freezed,Object? followers = freezed,Object? followerCount = freezed,Object? following = freezed,Object? followingCount = freezed,Object? bio = freezed,Object? location = freezed,}) {
  return _then(_UserModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,profilePic: freezed == profilePic ? _self.profilePic : profilePic // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,pushNotification: freezed == pushNotification ? _self.pushNotification : pushNotification // ignore: cast_nullable_to_non_nullable
as bool?,emailNotification: freezed == emailNotification ? _self.emailNotification : emailNotification // ignore: cast_nullable_to_non_nullable
as bool?,fcmToken: freezed == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,seller: freezed == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as SellerModel?,totalReviews: freezed == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int?,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double?,followers: freezed == followers ? _self._followers : followers // ignore: cast_nullable_to_non_nullable
as List<FollowingUserModel>?,followerCount: freezed == followerCount ? _self.followerCount : followerCount // ignore: cast_nullable_to_non_nullable
as int?,following: freezed == following ? _self._following : following // ignore: cast_nullable_to_non_nullable
as List<FollowingUserModel>?,followingCount: freezed == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellerModelCopyWith<$Res>? get seller {
    if (_self.seller == null) {
    return null;
  }

  return $SellerModelCopyWith<$Res>(_self.seller!, (value) {
    return _then(_self.copyWith(seller: value));
  });
}
}

// dart format on
