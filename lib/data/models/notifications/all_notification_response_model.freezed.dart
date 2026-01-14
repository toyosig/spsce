// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_notification_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationResponseModel {

 bool? get success; String? get message; String? get error; List<NotificationModel>? get data; int? get total; int? get page; int? get limit; int? get totalPages;
/// Create a copy of NotificationResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationResponseModelCopyWith<NotificationResponseModel> get copyWith => _$NotificationResponseModelCopyWithImpl<NotificationResponseModel>(this as NotificationResponseModel, _$identity);

  /// Serializes this NotificationResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,error,const DeepCollectionEquality().hash(data),total,page,limit,totalPages);

@override
String toString() {
  return 'NotificationResponseModel(success: $success, message: $message, error: $error, data: $data, total: $total, page: $page, limit: $limit, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $NotificationResponseModelCopyWith<$Res>  {
  factory $NotificationResponseModelCopyWith(NotificationResponseModel value, $Res Function(NotificationResponseModel) _then) = _$NotificationResponseModelCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, String? error, List<NotificationModel>? data, int? total, int? page, int? limit, int? totalPages
});




}
/// @nodoc
class _$NotificationResponseModelCopyWithImpl<$Res>
    implements $NotificationResponseModelCopyWith<$Res> {
  _$NotificationResponseModelCopyWithImpl(this._self, this._then);

  final NotificationResponseModel _self;
  final $Res Function(NotificationResponseModel) _then;

/// Create a copy of NotificationResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? error = freezed,Object? data = freezed,Object? total = freezed,Object? page = freezed,Object? limit = freezed,Object? totalPages = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<NotificationModel>?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _NotificationResponseModel implements NotificationResponseModel {
  const _NotificationResponseModel({this.success, this.message, this.error, final  List<NotificationModel>? data, this.total, this.page, this.limit, this.totalPages}): _data = data;
  factory _NotificationResponseModel.fromJson(Map<String, dynamic> json) => _$NotificationResponseModelFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  String? error;
 final  List<NotificationModel>? _data;
@override List<NotificationModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? total;
@override final  int? page;
@override final  int? limit;
@override final  int? totalPages;

/// Create a copy of NotificationResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationResponseModelCopyWith<_NotificationResponseModel> get copyWith => __$NotificationResponseModelCopyWithImpl<_NotificationResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,error,const DeepCollectionEquality().hash(_data),total,page,limit,totalPages);

@override
String toString() {
  return 'NotificationResponseModel(success: $success, message: $message, error: $error, data: $data, total: $total, page: $page, limit: $limit, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$NotificationResponseModelCopyWith<$Res> implements $NotificationResponseModelCopyWith<$Res> {
  factory _$NotificationResponseModelCopyWith(_NotificationResponseModel value, $Res Function(_NotificationResponseModel) _then) = __$NotificationResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, String? error, List<NotificationModel>? data, int? total, int? page, int? limit, int? totalPages
});




}
/// @nodoc
class __$NotificationResponseModelCopyWithImpl<$Res>
    implements _$NotificationResponseModelCopyWith<$Res> {
  __$NotificationResponseModelCopyWithImpl(this._self, this._then);

  final _NotificationResponseModel _self;
  final $Res Function(_NotificationResponseModel) _then;

/// Create a copy of NotificationResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? error = freezed,Object? data = freezed,Object? total = freezed,Object? page = freezed,Object? limit = freezed,Object? totalPages = freezed,}) {
  return _then(_NotificationResponseModel(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<NotificationModel>?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$NotificationModel {

 String? get id; String? get receiverId; String? get senderId; String? get title; String? get body; NotificationData? get data; bool? get isRead; DateTime? get createdAt; NotificationSender? get sender;
/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationModelCopyWith<NotificationModel> get copyWith => _$NotificationModelCopyWithImpl<NotificationModel>(this as NotificationModel, _$identity);

  /// Serializes this NotificationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.receiverId, receiverId) || other.receiverId == receiverId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.data, data) || other.data == data)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.sender, sender) || other.sender == sender));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,receiverId,senderId,title,body,data,isRead,createdAt,sender);

@override
String toString() {
  return 'NotificationModel(id: $id, receiverId: $receiverId, senderId: $senderId, title: $title, body: $body, data: $data, isRead: $isRead, createdAt: $createdAt, sender: $sender)';
}


}

/// @nodoc
abstract mixin class $NotificationModelCopyWith<$Res>  {
  factory $NotificationModelCopyWith(NotificationModel value, $Res Function(NotificationModel) _then) = _$NotificationModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? receiverId, String? senderId, String? title, String? body, NotificationData? data, bool? isRead, DateTime? createdAt, NotificationSender? sender
});


$NotificationDataCopyWith<$Res>? get data;$NotificationSenderCopyWith<$Res>? get sender;

}
/// @nodoc
class _$NotificationModelCopyWithImpl<$Res>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._self, this._then);

  final NotificationModel _self;
  final $Res Function(NotificationModel) _then;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? receiverId = freezed,Object? senderId = freezed,Object? title = freezed,Object? body = freezed,Object? data = freezed,Object? isRead = freezed,Object? createdAt = freezed,Object? sender = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,receiverId: freezed == receiverId ? _self.receiverId : receiverId // ignore: cast_nullable_to_non_nullable
as String?,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as NotificationData?,isRead: freezed == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,sender: freezed == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as NotificationSender?,
  ));
}
/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $NotificationDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationSenderCopyWith<$Res>? get sender {
    if (_self.sender == null) {
    return null;
  }

  return $NotificationSenderCopyWith<$Res>(_self.sender!, (value) {
    return _then(_self.copyWith(sender: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _NotificationModel implements NotificationModel {
  const _NotificationModel({this.id, this.receiverId, this.senderId, this.title, this.body, this.data, this.isRead, this.createdAt, this.sender});
  factory _NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);

@override final  String? id;
@override final  String? receiverId;
@override final  String? senderId;
@override final  String? title;
@override final  String? body;
@override final  NotificationData? data;
@override final  bool? isRead;
@override final  DateTime? createdAt;
@override final  NotificationSender? sender;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationModelCopyWith<_NotificationModel> get copyWith => __$NotificationModelCopyWithImpl<_NotificationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.receiverId, receiverId) || other.receiverId == receiverId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.data, data) || other.data == data)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.sender, sender) || other.sender == sender));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,receiverId,senderId,title,body,data,isRead,createdAt,sender);

@override
String toString() {
  return 'NotificationModel(id: $id, receiverId: $receiverId, senderId: $senderId, title: $title, body: $body, data: $data, isRead: $isRead, createdAt: $createdAt, sender: $sender)';
}


}

/// @nodoc
abstract mixin class _$NotificationModelCopyWith<$Res> implements $NotificationModelCopyWith<$Res> {
  factory _$NotificationModelCopyWith(_NotificationModel value, $Res Function(_NotificationModel) _then) = __$NotificationModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? receiverId, String? senderId, String? title, String? body, NotificationData? data, bool? isRead, DateTime? createdAt, NotificationSender? sender
});


@override $NotificationDataCopyWith<$Res>? get data;@override $NotificationSenderCopyWith<$Res>? get sender;

}
/// @nodoc
class __$NotificationModelCopyWithImpl<$Res>
    implements _$NotificationModelCopyWith<$Res> {
  __$NotificationModelCopyWithImpl(this._self, this._then);

  final _NotificationModel _self;
  final $Res Function(_NotificationModel) _then;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? receiverId = freezed,Object? senderId = freezed,Object? title = freezed,Object? body = freezed,Object? data = freezed,Object? isRead = freezed,Object? createdAt = freezed,Object? sender = freezed,}) {
  return _then(_NotificationModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,receiverId: freezed == receiverId ? _self.receiverId : receiverId // ignore: cast_nullable_to_non_nullable
as String?,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as NotificationData?,isRead: freezed == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,sender: freezed == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as NotificationSender?,
  ));
}

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $NotificationDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationSenderCopyWith<$Res>? get sender {
    if (_self.sender == null) {
    return null;
  }

  return $NotificationSenderCopyWith<$Res>(_self.sender!, (value) {
    return _then(_self.copyWith(sender: value));
  });
}
}


/// @nodoc
mixin _$NotificationData {

 String? get type;// For "new-offer" and "message"
 String? get offerId; String? get senderId; String? get conversationId; String? get senderUsername; String? get senderProfilePic; String? get messageId;// For "NEW_FOLLOWER"
 String? get followerId; String? get followerUsername; String? get followerProfilePic;// For "PRODUCT_LIKE"
 String? get likerId; String? get productId; String? get productTitle; String? get likerUsername; String? get likerProfilePic;// Legacy/other fields
 String? get sellerId;
/// Create a copy of NotificationData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationDataCopyWith<NotificationData> get copyWith => _$NotificationDataCopyWithImpl<NotificationData>(this as NotificationData, _$identity);

  /// Serializes this NotificationData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationData&&(identical(other.type, type) || other.type == type)&&(identical(other.offerId, offerId) || other.offerId == offerId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.senderUsername, senderUsername) || other.senderUsername == senderUsername)&&(identical(other.senderProfilePic, senderProfilePic) || other.senderProfilePic == senderProfilePic)&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.followerId, followerId) || other.followerId == followerId)&&(identical(other.followerUsername, followerUsername) || other.followerUsername == followerUsername)&&(identical(other.followerProfilePic, followerProfilePic) || other.followerProfilePic == followerProfilePic)&&(identical(other.likerId, likerId) || other.likerId == likerId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productTitle, productTitle) || other.productTitle == productTitle)&&(identical(other.likerUsername, likerUsername) || other.likerUsername == likerUsername)&&(identical(other.likerProfilePic, likerProfilePic) || other.likerProfilePic == likerProfilePic)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,offerId,senderId,conversationId,senderUsername,senderProfilePic,messageId,followerId,followerUsername,followerProfilePic,likerId,productId,productTitle,likerUsername,likerProfilePic,sellerId);

@override
String toString() {
  return 'NotificationData(type: $type, offerId: $offerId, senderId: $senderId, conversationId: $conversationId, senderUsername: $senderUsername, senderProfilePic: $senderProfilePic, messageId: $messageId, followerId: $followerId, followerUsername: $followerUsername, followerProfilePic: $followerProfilePic, likerId: $likerId, productId: $productId, productTitle: $productTitle, likerUsername: $likerUsername, likerProfilePic: $likerProfilePic, sellerId: $sellerId)';
}


}

/// @nodoc
abstract mixin class $NotificationDataCopyWith<$Res>  {
  factory $NotificationDataCopyWith(NotificationData value, $Res Function(NotificationData) _then) = _$NotificationDataCopyWithImpl;
@useResult
$Res call({
 String? type, String? offerId, String? senderId, String? conversationId, String? senderUsername, String? senderProfilePic, String? messageId, String? followerId, String? followerUsername, String? followerProfilePic, String? likerId, String? productId, String? productTitle, String? likerUsername, String? likerProfilePic, String? sellerId
});




}
/// @nodoc
class _$NotificationDataCopyWithImpl<$Res>
    implements $NotificationDataCopyWith<$Res> {
  _$NotificationDataCopyWithImpl(this._self, this._then);

  final NotificationData _self;
  final $Res Function(NotificationData) _then;

/// Create a copy of NotificationData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? offerId = freezed,Object? senderId = freezed,Object? conversationId = freezed,Object? senderUsername = freezed,Object? senderProfilePic = freezed,Object? messageId = freezed,Object? followerId = freezed,Object? followerUsername = freezed,Object? followerProfilePic = freezed,Object? likerId = freezed,Object? productId = freezed,Object? productTitle = freezed,Object? likerUsername = freezed,Object? likerProfilePic = freezed,Object? sellerId = freezed,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,offerId: freezed == offerId ? _self.offerId : offerId // ignore: cast_nullable_to_non_nullable
as String?,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String?,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String?,senderUsername: freezed == senderUsername ? _self.senderUsername : senderUsername // ignore: cast_nullable_to_non_nullable
as String?,senderProfilePic: freezed == senderProfilePic ? _self.senderProfilePic : senderProfilePic // ignore: cast_nullable_to_non_nullable
as String?,messageId: freezed == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String?,followerId: freezed == followerId ? _self.followerId : followerId // ignore: cast_nullable_to_non_nullable
as String?,followerUsername: freezed == followerUsername ? _self.followerUsername : followerUsername // ignore: cast_nullable_to_non_nullable
as String?,followerProfilePic: freezed == followerProfilePic ? _self.followerProfilePic : followerProfilePic // ignore: cast_nullable_to_non_nullable
as String?,likerId: freezed == likerId ? _self.likerId : likerId // ignore: cast_nullable_to_non_nullable
as String?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,productTitle: freezed == productTitle ? _self.productTitle : productTitle // ignore: cast_nullable_to_non_nullable
as String?,likerUsername: freezed == likerUsername ? _self.likerUsername : likerUsername // ignore: cast_nullable_to_non_nullable
as String?,likerProfilePic: freezed == likerProfilePic ? _self.likerProfilePic : likerProfilePic // ignore: cast_nullable_to_non_nullable
as String?,sellerId: freezed == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _NotificationData implements NotificationData {
  const _NotificationData({this.type, this.offerId, this.senderId, this.conversationId, this.senderUsername, this.senderProfilePic, this.messageId, this.followerId, this.followerUsername, this.followerProfilePic, this.likerId, this.productId, this.productTitle, this.likerUsername, this.likerProfilePic, this.sellerId});
  factory _NotificationData.fromJson(Map<String, dynamic> json) => _$NotificationDataFromJson(json);

@override final  String? type;
// For "new-offer" and "message"
@override final  String? offerId;
@override final  String? senderId;
@override final  String? conversationId;
@override final  String? senderUsername;
@override final  String? senderProfilePic;
@override final  String? messageId;
// For "NEW_FOLLOWER"
@override final  String? followerId;
@override final  String? followerUsername;
@override final  String? followerProfilePic;
// For "PRODUCT_LIKE"
@override final  String? likerId;
@override final  String? productId;
@override final  String? productTitle;
@override final  String? likerUsername;
@override final  String? likerProfilePic;
// Legacy/other fields
@override final  String? sellerId;

/// Create a copy of NotificationData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationDataCopyWith<_NotificationData> get copyWith => __$NotificationDataCopyWithImpl<_NotificationData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationData&&(identical(other.type, type) || other.type == type)&&(identical(other.offerId, offerId) || other.offerId == offerId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.senderUsername, senderUsername) || other.senderUsername == senderUsername)&&(identical(other.senderProfilePic, senderProfilePic) || other.senderProfilePic == senderProfilePic)&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.followerId, followerId) || other.followerId == followerId)&&(identical(other.followerUsername, followerUsername) || other.followerUsername == followerUsername)&&(identical(other.followerProfilePic, followerProfilePic) || other.followerProfilePic == followerProfilePic)&&(identical(other.likerId, likerId) || other.likerId == likerId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productTitle, productTitle) || other.productTitle == productTitle)&&(identical(other.likerUsername, likerUsername) || other.likerUsername == likerUsername)&&(identical(other.likerProfilePic, likerProfilePic) || other.likerProfilePic == likerProfilePic)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,offerId,senderId,conversationId,senderUsername,senderProfilePic,messageId,followerId,followerUsername,followerProfilePic,likerId,productId,productTitle,likerUsername,likerProfilePic,sellerId);

@override
String toString() {
  return 'NotificationData(type: $type, offerId: $offerId, senderId: $senderId, conversationId: $conversationId, senderUsername: $senderUsername, senderProfilePic: $senderProfilePic, messageId: $messageId, followerId: $followerId, followerUsername: $followerUsername, followerProfilePic: $followerProfilePic, likerId: $likerId, productId: $productId, productTitle: $productTitle, likerUsername: $likerUsername, likerProfilePic: $likerProfilePic, sellerId: $sellerId)';
}


}

/// @nodoc
abstract mixin class _$NotificationDataCopyWith<$Res> implements $NotificationDataCopyWith<$Res> {
  factory _$NotificationDataCopyWith(_NotificationData value, $Res Function(_NotificationData) _then) = __$NotificationDataCopyWithImpl;
@override @useResult
$Res call({
 String? type, String? offerId, String? senderId, String? conversationId, String? senderUsername, String? senderProfilePic, String? messageId, String? followerId, String? followerUsername, String? followerProfilePic, String? likerId, String? productId, String? productTitle, String? likerUsername, String? likerProfilePic, String? sellerId
});




}
/// @nodoc
class __$NotificationDataCopyWithImpl<$Res>
    implements _$NotificationDataCopyWith<$Res> {
  __$NotificationDataCopyWithImpl(this._self, this._then);

  final _NotificationData _self;
  final $Res Function(_NotificationData) _then;

/// Create a copy of NotificationData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? offerId = freezed,Object? senderId = freezed,Object? conversationId = freezed,Object? senderUsername = freezed,Object? senderProfilePic = freezed,Object? messageId = freezed,Object? followerId = freezed,Object? followerUsername = freezed,Object? followerProfilePic = freezed,Object? likerId = freezed,Object? productId = freezed,Object? productTitle = freezed,Object? likerUsername = freezed,Object? likerProfilePic = freezed,Object? sellerId = freezed,}) {
  return _then(_NotificationData(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,offerId: freezed == offerId ? _self.offerId : offerId // ignore: cast_nullable_to_non_nullable
as String?,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String?,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String?,senderUsername: freezed == senderUsername ? _self.senderUsername : senderUsername // ignore: cast_nullable_to_non_nullable
as String?,senderProfilePic: freezed == senderProfilePic ? _self.senderProfilePic : senderProfilePic // ignore: cast_nullable_to_non_nullable
as String?,messageId: freezed == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String?,followerId: freezed == followerId ? _self.followerId : followerId // ignore: cast_nullable_to_non_nullable
as String?,followerUsername: freezed == followerUsername ? _self.followerUsername : followerUsername // ignore: cast_nullable_to_non_nullable
as String?,followerProfilePic: freezed == followerProfilePic ? _self.followerProfilePic : followerProfilePic // ignore: cast_nullable_to_non_nullable
as String?,likerId: freezed == likerId ? _self.likerId : likerId // ignore: cast_nullable_to_non_nullable
as String?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,productTitle: freezed == productTitle ? _self.productTitle : productTitle // ignore: cast_nullable_to_non_nullable
as String?,likerUsername: freezed == likerUsername ? _self.likerUsername : likerUsername // ignore: cast_nullable_to_non_nullable
as String?,likerProfilePic: freezed == likerProfilePic ? _self.likerProfilePic : likerProfilePic // ignore: cast_nullable_to_non_nullable
as String?,sellerId: freezed == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$NotificationSender {

 String? get id;
/// Create a copy of NotificationSender
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationSenderCopyWith<NotificationSender> get copyWith => _$NotificationSenderCopyWithImpl<NotificationSender>(this as NotificationSender, _$identity);

  /// Serializes this NotificationSender to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationSender&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'NotificationSender(id: $id)';
}


}

/// @nodoc
abstract mixin class $NotificationSenderCopyWith<$Res>  {
  factory $NotificationSenderCopyWith(NotificationSender value, $Res Function(NotificationSender) _then) = _$NotificationSenderCopyWithImpl;
@useResult
$Res call({
 String? id
});




}
/// @nodoc
class _$NotificationSenderCopyWithImpl<$Res>
    implements $NotificationSenderCopyWith<$Res> {
  _$NotificationSenderCopyWithImpl(this._self, this._then);

  final NotificationSender _self;
  final $Res Function(NotificationSender) _then;

/// Create a copy of NotificationSender
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _NotificationSender implements NotificationSender {
  const _NotificationSender({this.id});
  factory _NotificationSender.fromJson(Map<String, dynamic> json) => _$NotificationSenderFromJson(json);

@override final  String? id;

/// Create a copy of NotificationSender
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationSenderCopyWith<_NotificationSender> get copyWith => __$NotificationSenderCopyWithImpl<_NotificationSender>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationSenderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationSender&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'NotificationSender(id: $id)';
}


}

/// @nodoc
abstract mixin class _$NotificationSenderCopyWith<$Res> implements $NotificationSenderCopyWith<$Res> {
  factory _$NotificationSenderCopyWith(_NotificationSender value, $Res Function(_NotificationSender) _then) = __$NotificationSenderCopyWithImpl;
@override @useResult
$Res call({
 String? id
});




}
/// @nodoc
class __$NotificationSenderCopyWithImpl<$Res>
    implements _$NotificationSenderCopyWith<$Res> {
  __$NotificationSenderCopyWithImpl(this._self, this._then);

  final _NotificationSender _self;
  final $Res Function(_NotificationSender) _then;

/// Create a copy of NotificationSender
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,}) {
  return _then(_NotificationSender(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
