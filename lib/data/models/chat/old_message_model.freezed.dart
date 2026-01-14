// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'old_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OldMessageModel {

 OldOfferData get offer; List<MessageModel> get messages; double? get averageSellerRating;
/// Create a copy of OldMessageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OldMessageModelCopyWith<OldMessageModel> get copyWith => _$OldMessageModelCopyWithImpl<OldMessageModel>(this as OldMessageModel, _$identity);

  /// Serializes this OldMessageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OldMessageModel&&(identical(other.offer, offer) || other.offer == offer)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.averageSellerRating, averageSellerRating) || other.averageSellerRating == averageSellerRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,offer,const DeepCollectionEquality().hash(messages),averageSellerRating);

@override
String toString() {
  return 'OldMessageModel(offer: $offer, messages: $messages, averageSellerRating: $averageSellerRating)';
}


}

/// @nodoc
abstract mixin class $OldMessageModelCopyWith<$Res>  {
  factory $OldMessageModelCopyWith(OldMessageModel value, $Res Function(OldMessageModel) _then) = _$OldMessageModelCopyWithImpl;
@useResult
$Res call({
 OldOfferData offer, List<MessageModel> messages, double? averageSellerRating
});


$OldOfferDataCopyWith<$Res> get offer;

}
/// @nodoc
class _$OldMessageModelCopyWithImpl<$Res>
    implements $OldMessageModelCopyWith<$Res> {
  _$OldMessageModelCopyWithImpl(this._self, this._then);

  final OldMessageModel _self;
  final $Res Function(OldMessageModel) _then;

/// Create a copy of OldMessageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? offer = null,Object? messages = null,Object? averageSellerRating = freezed,}) {
  return _then(_self.copyWith(
offer: null == offer ? _self.offer : offer // ignore: cast_nullable_to_non_nullable
as OldOfferData,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageModel>,averageSellerRating: freezed == averageSellerRating ? _self.averageSellerRating : averageSellerRating // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of OldMessageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OldOfferDataCopyWith<$Res> get offer {
  
  return $OldOfferDataCopyWith<$Res>(_self.offer, (value) {
    return _then(_self.copyWith(offer: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _OldMessageModel implements OldMessageModel {
  const _OldMessageModel({required this.offer, required final  List<MessageModel> messages, this.averageSellerRating}): _messages = messages;
  factory _OldMessageModel.fromJson(Map<String, dynamic> json) => _$OldMessageModelFromJson(json);

@override final  OldOfferData offer;
 final  List<MessageModel> _messages;
@override List<MessageModel> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override final  double? averageSellerRating;

/// Create a copy of OldMessageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OldMessageModelCopyWith<_OldMessageModel> get copyWith => __$OldMessageModelCopyWithImpl<_OldMessageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OldMessageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OldMessageModel&&(identical(other.offer, offer) || other.offer == offer)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.averageSellerRating, averageSellerRating) || other.averageSellerRating == averageSellerRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,offer,const DeepCollectionEquality().hash(_messages),averageSellerRating);

@override
String toString() {
  return 'OldMessageModel(offer: $offer, messages: $messages, averageSellerRating: $averageSellerRating)';
}


}

/// @nodoc
abstract mixin class _$OldMessageModelCopyWith<$Res> implements $OldMessageModelCopyWith<$Res> {
  factory _$OldMessageModelCopyWith(_OldMessageModel value, $Res Function(_OldMessageModel) _then) = __$OldMessageModelCopyWithImpl;
@override @useResult
$Res call({
 OldOfferData offer, List<MessageModel> messages, double? averageSellerRating
});


@override $OldOfferDataCopyWith<$Res> get offer;

}
/// @nodoc
class __$OldMessageModelCopyWithImpl<$Res>
    implements _$OldMessageModelCopyWith<$Res> {
  __$OldMessageModelCopyWithImpl(this._self, this._then);

  final _OldMessageModel _self;
  final $Res Function(_OldMessageModel) _then;

/// Create a copy of OldMessageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? offer = null,Object? messages = null,Object? averageSellerRating = freezed,}) {
  return _then(_OldMessageModel(
offer: null == offer ? _self.offer : offer // ignore: cast_nullable_to_non_nullable
as OldOfferData,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageModel>,averageSellerRating: freezed == averageSellerRating ? _self.averageSellerRating : averageSellerRating // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of OldMessageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OldOfferDataCopyWith<$Res> get offer {
  
  return $OldOfferDataCopyWith<$Res>(_self.offer, (value) {
    return _then(_self.copyWith(offer: value));
  });
}
}


/// @nodoc
mixin _$OldOfferData {

 String get id; String get createdAt; String get updatedAt; String get status; int get price; String get productId; String? get buyerId; String? get sellerId; String get senderId; String get receiverId; String? get messageId; String get conversationId; ProductsData get product; ChatUser get sender; ChatUser get receiver;
/// Create a copy of OldOfferData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OldOfferDataCopyWith<OldOfferData> get copyWith => _$OldOfferDataCopyWithImpl<OldOfferData>(this as OldOfferData, _$identity);

  /// Serializes this OldOfferData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OldOfferData&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.price, price) || other.price == price)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.buyerId, buyerId) || other.buyerId == buyerId)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.receiverId, receiverId) || other.receiverId == receiverId)&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.product, product) || other.product == product)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.receiver, receiver) || other.receiver == receiver));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,status,price,productId,buyerId,sellerId,senderId,receiverId,messageId,conversationId,product,sender,receiver);

@override
String toString() {
  return 'OldOfferData(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, price: $price, productId: $productId, buyerId: $buyerId, sellerId: $sellerId, senderId: $senderId, receiverId: $receiverId, messageId: $messageId, conversationId: $conversationId, product: $product, sender: $sender, receiver: $receiver)';
}


}

/// @nodoc
abstract mixin class $OldOfferDataCopyWith<$Res>  {
  factory $OldOfferDataCopyWith(OldOfferData value, $Res Function(OldOfferData) _then) = _$OldOfferDataCopyWithImpl;
@useResult
$Res call({
 String id, String createdAt, String updatedAt, String status, int price, String productId, String? buyerId, String? sellerId, String senderId, String receiverId, String? messageId, String conversationId, ProductsData product, ChatUser sender, ChatUser receiver
});


$ProductsDataCopyWith<$Res> get product;$ChatUserCopyWith<$Res> get sender;$ChatUserCopyWith<$Res> get receiver;

}
/// @nodoc
class _$OldOfferDataCopyWithImpl<$Res>
    implements $OldOfferDataCopyWith<$Res> {
  _$OldOfferDataCopyWithImpl(this._self, this._then);

  final OldOfferData _self;
  final $Res Function(OldOfferData) _then;

/// Create a copy of OldOfferData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? status = null,Object? price = null,Object? productId = null,Object? buyerId = freezed,Object? sellerId = freezed,Object? senderId = null,Object? receiverId = null,Object? messageId = freezed,Object? conversationId = null,Object? product = null,Object? sender = null,Object? receiver = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,buyerId: freezed == buyerId ? _self.buyerId : buyerId // ignore: cast_nullable_to_non_nullable
as String?,sellerId: freezed == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String?,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,receiverId: null == receiverId ? _self.receiverId : receiverId // ignore: cast_nullable_to_non_nullable
as String,messageId: freezed == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String?,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductsData,sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as ChatUser,receiver: null == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as ChatUser,
  ));
}
/// Create a copy of OldOfferData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductsDataCopyWith<$Res> get product {
  
  return $ProductsDataCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of OldOfferData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatUserCopyWith<$Res> get sender {
  
  return $ChatUserCopyWith<$Res>(_self.sender, (value) {
    return _then(_self.copyWith(sender: value));
  });
}/// Create a copy of OldOfferData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatUserCopyWith<$Res> get receiver {
  
  return $ChatUserCopyWith<$Res>(_self.receiver, (value) {
    return _then(_self.copyWith(receiver: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _OldOfferData implements OldOfferData {
  const _OldOfferData({required this.id, required this.createdAt, required this.updatedAt, required this.status, required this.price, required this.productId, this.buyerId, this.sellerId, required this.senderId, required this.receiverId, this.messageId, required this.conversationId, required this.product, required this.sender, required this.receiver});
  factory _OldOfferData.fromJson(Map<String, dynamic> json) => _$OldOfferDataFromJson(json);

@override final  String id;
@override final  String createdAt;
@override final  String updatedAt;
@override final  String status;
@override final  int price;
@override final  String productId;
@override final  String? buyerId;
@override final  String? sellerId;
@override final  String senderId;
@override final  String receiverId;
@override final  String? messageId;
@override final  String conversationId;
@override final  ProductsData product;
@override final  ChatUser sender;
@override final  ChatUser receiver;

/// Create a copy of OldOfferData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OldOfferDataCopyWith<_OldOfferData> get copyWith => __$OldOfferDataCopyWithImpl<_OldOfferData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OldOfferDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OldOfferData&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.price, price) || other.price == price)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.buyerId, buyerId) || other.buyerId == buyerId)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.receiverId, receiverId) || other.receiverId == receiverId)&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.product, product) || other.product == product)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.receiver, receiver) || other.receiver == receiver));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,status,price,productId,buyerId,sellerId,senderId,receiverId,messageId,conversationId,product,sender,receiver);

@override
String toString() {
  return 'OldOfferData(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, price: $price, productId: $productId, buyerId: $buyerId, sellerId: $sellerId, senderId: $senderId, receiverId: $receiverId, messageId: $messageId, conversationId: $conversationId, product: $product, sender: $sender, receiver: $receiver)';
}


}

/// @nodoc
abstract mixin class _$OldOfferDataCopyWith<$Res> implements $OldOfferDataCopyWith<$Res> {
  factory _$OldOfferDataCopyWith(_OldOfferData value, $Res Function(_OldOfferData) _then) = __$OldOfferDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String createdAt, String updatedAt, String status, int price, String productId, String? buyerId, String? sellerId, String senderId, String receiverId, String? messageId, String conversationId, ProductsData product, ChatUser sender, ChatUser receiver
});


@override $ProductsDataCopyWith<$Res> get product;@override $ChatUserCopyWith<$Res> get sender;@override $ChatUserCopyWith<$Res> get receiver;

}
/// @nodoc
class __$OldOfferDataCopyWithImpl<$Res>
    implements _$OldOfferDataCopyWith<$Res> {
  __$OldOfferDataCopyWithImpl(this._self, this._then);

  final _OldOfferData _self;
  final $Res Function(_OldOfferData) _then;

/// Create a copy of OldOfferData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? status = null,Object? price = null,Object? productId = null,Object? buyerId = freezed,Object? sellerId = freezed,Object? senderId = null,Object? receiverId = null,Object? messageId = freezed,Object? conversationId = null,Object? product = null,Object? sender = null,Object? receiver = null,}) {
  return _then(_OldOfferData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,buyerId: freezed == buyerId ? _self.buyerId : buyerId // ignore: cast_nullable_to_non_nullable
as String?,sellerId: freezed == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String?,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,receiverId: null == receiverId ? _self.receiverId : receiverId // ignore: cast_nullable_to_non_nullable
as String,messageId: freezed == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String?,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductsData,sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as ChatUser,receiver: null == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as ChatUser,
  ));
}

/// Create a copy of OldOfferData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductsDataCopyWith<$Res> get product {
  
  return $ProductsDataCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of OldOfferData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatUserCopyWith<$Res> get sender {
  
  return $ChatUserCopyWith<$Res>(_self.sender, (value) {
    return _then(_self.copyWith(sender: value));
  });
}/// Create a copy of OldOfferData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatUserCopyWith<$Res> get receiver {
  
  return $ChatUserCopyWith<$Res>(_self.receiver, (value) {
    return _then(_self.copyWith(receiver: value));
  });
}
}


/// @nodoc
mixin _$ChatUser {

 String? get id; String? get username; String? get profilePic; List<dynamic> get reviewsReceived;
/// Create a copy of ChatUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatUserCopyWith<ChatUser> get copyWith => _$ChatUserCopyWithImpl<ChatUser>(this as ChatUser, _$identity);

  /// Serializes this ChatUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatUser&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic)&&const DeepCollectionEquality().equals(other.reviewsReceived, reviewsReceived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,profilePic,const DeepCollectionEquality().hash(reviewsReceived));

@override
String toString() {
  return 'ChatUser(id: $id, username: $username, profilePic: $profilePic, reviewsReceived: $reviewsReceived)';
}


}

/// @nodoc
abstract mixin class $ChatUserCopyWith<$Res>  {
  factory $ChatUserCopyWith(ChatUser value, $Res Function(ChatUser) _then) = _$ChatUserCopyWithImpl;
@useResult
$Res call({
 String? id, String? username, String? profilePic, List<dynamic> reviewsReceived
});




}
/// @nodoc
class _$ChatUserCopyWithImpl<$Res>
    implements $ChatUserCopyWith<$Res> {
  _$ChatUserCopyWithImpl(this._self, this._then);

  final ChatUser _self;
  final $Res Function(ChatUser) _then;

/// Create a copy of ChatUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? username = freezed,Object? profilePic = freezed,Object? reviewsReceived = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,profilePic: freezed == profilePic ? _self.profilePic : profilePic // ignore: cast_nullable_to_non_nullable
as String?,reviewsReceived: null == reviewsReceived ? _self.reviewsReceived : reviewsReceived // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ChatUser implements ChatUser {
  const _ChatUser({this.id = '', this.username = '', this.profilePic = '', final  List<dynamic> reviewsReceived = const []}): _reviewsReceived = reviewsReceived;
  factory _ChatUser.fromJson(Map<String, dynamic> json) => _$ChatUserFromJson(json);

@override@JsonKey() final  String? id;
@override@JsonKey() final  String? username;
@override@JsonKey() final  String? profilePic;
 final  List<dynamic> _reviewsReceived;
@override@JsonKey() List<dynamic> get reviewsReceived {
  if (_reviewsReceived is EqualUnmodifiableListView) return _reviewsReceived;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviewsReceived);
}


/// Create a copy of ChatUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatUserCopyWith<_ChatUser> get copyWith => __$ChatUserCopyWithImpl<_ChatUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatUser&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic)&&const DeepCollectionEquality().equals(other._reviewsReceived, _reviewsReceived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,profilePic,const DeepCollectionEquality().hash(_reviewsReceived));

@override
String toString() {
  return 'ChatUser(id: $id, username: $username, profilePic: $profilePic, reviewsReceived: $reviewsReceived)';
}


}

/// @nodoc
abstract mixin class _$ChatUserCopyWith<$Res> implements $ChatUserCopyWith<$Res> {
  factory _$ChatUserCopyWith(_ChatUser value, $Res Function(_ChatUser) _then) = __$ChatUserCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? username, String? profilePic, List<dynamic> reviewsReceived
});




}
/// @nodoc
class __$ChatUserCopyWithImpl<$Res>
    implements _$ChatUserCopyWith<$Res> {
  __$ChatUserCopyWithImpl(this._self, this._then);

  final _ChatUser _self;
  final $Res Function(_ChatUser) _then;

/// Create a copy of ChatUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? username = freezed,Object? profilePic = freezed,Object? reviewsReceived = null,}) {
  return _then(_ChatUser(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,profilePic: freezed == profilePic ? _self.profilePic : profilePic // ignore: cast_nullable_to_non_nullable
as String?,reviewsReceived: null == reviewsReceived ? _self._reviewsReceived : reviewsReceived // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}


}

// dart format on
