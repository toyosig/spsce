// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inbox_offers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InboxOffers {

 String? get id; String? get createdAt; String? get updatedAt; String? get status; int? get price; String? get productId; String? get buyerId; String? get sellerId; String? get senderId; String? get receiverId; String? get messageId; String? get conversationId; ConversationDetails? get conversation; ProductsData? get product; AuthUserModel? get sender; AuthUserModel? get receiver;
/// Create a copy of InboxOffers
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxOffersCopyWith<InboxOffers> get copyWith => _$InboxOffersCopyWithImpl<InboxOffers>(this as InboxOffers, _$identity);

  /// Serializes this InboxOffers to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxOffers&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.price, price) || other.price == price)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.buyerId, buyerId) || other.buyerId == buyerId)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.receiverId, receiverId) || other.receiverId == receiverId)&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.conversation, conversation) || other.conversation == conversation)&&(identical(other.product, product) || other.product == product)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.receiver, receiver) || other.receiver == receiver));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,status,price,productId,buyerId,sellerId,senderId,receiverId,messageId,conversationId,conversation,product,sender,receiver);

@override
String toString() {
  return 'InboxOffers(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, price: $price, productId: $productId, buyerId: $buyerId, sellerId: $sellerId, senderId: $senderId, receiverId: $receiverId, messageId: $messageId, conversationId: $conversationId, conversation: $conversation, product: $product, sender: $sender, receiver: $receiver)';
}


}

/// @nodoc
abstract mixin class $InboxOffersCopyWith<$Res>  {
  factory $InboxOffersCopyWith(InboxOffers value, $Res Function(InboxOffers) _then) = _$InboxOffersCopyWithImpl;
@useResult
$Res call({
 String? id, String? createdAt, String? updatedAt, String? status, int? price, String? productId, String? buyerId, String? sellerId, String? senderId, String? receiverId, String? messageId, String? conversationId, ConversationDetails? conversation, ProductsData? product, AuthUserModel? sender, AuthUserModel? receiver
});


$ConversationDetailsCopyWith<$Res>? get conversation;$ProductsDataCopyWith<$Res>? get product;$AuthUserModelCopyWith<$Res>? get sender;$AuthUserModelCopyWith<$Res>? get receiver;

}
/// @nodoc
class _$InboxOffersCopyWithImpl<$Res>
    implements $InboxOffersCopyWith<$Res> {
  _$InboxOffersCopyWithImpl(this._self, this._then);

  final InboxOffers _self;
  final $Res Function(InboxOffers) _then;

/// Create a copy of InboxOffers
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? status = freezed,Object? price = freezed,Object? productId = freezed,Object? buyerId = freezed,Object? sellerId = freezed,Object? senderId = freezed,Object? receiverId = freezed,Object? messageId = freezed,Object? conversationId = freezed,Object? conversation = freezed,Object? product = freezed,Object? sender = freezed,Object? receiver = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,buyerId: freezed == buyerId ? _self.buyerId : buyerId // ignore: cast_nullable_to_non_nullable
as String?,sellerId: freezed == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String?,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String?,receiverId: freezed == receiverId ? _self.receiverId : receiverId // ignore: cast_nullable_to_non_nullable
as String?,messageId: freezed == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String?,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String?,conversation: freezed == conversation ? _self.conversation : conversation // ignore: cast_nullable_to_non_nullable
as ConversationDetails?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductsData?,sender: freezed == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as AuthUserModel?,receiver: freezed == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as AuthUserModel?,
  ));
}
/// Create a copy of InboxOffers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConversationDetailsCopyWith<$Res>? get conversation {
    if (_self.conversation == null) {
    return null;
  }

  return $ConversationDetailsCopyWith<$Res>(_self.conversation!, (value) {
    return _then(_self.copyWith(conversation: value));
  });
}/// Create a copy of InboxOffers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductsDataCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductsDataCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of InboxOffers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserModelCopyWith<$Res>? get sender {
    if (_self.sender == null) {
    return null;
  }

  return $AuthUserModelCopyWith<$Res>(_self.sender!, (value) {
    return _then(_self.copyWith(sender: value));
  });
}/// Create a copy of InboxOffers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserModelCopyWith<$Res>? get receiver {
    if (_self.receiver == null) {
    return null;
  }

  return $AuthUserModelCopyWith<$Res>(_self.receiver!, (value) {
    return _then(_self.copyWith(receiver: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _InboxOffers implements InboxOffers {
  const _InboxOffers({this.id, this.createdAt, this.updatedAt, this.status, this.price, this.productId, this.buyerId, this.sellerId, this.senderId, this.receiverId, this.messageId, this.conversationId, this.conversation, this.product, this.sender, this.receiver});
  factory _InboxOffers.fromJson(Map<String, dynamic> json) => _$InboxOffersFromJson(json);

@override final  String? id;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  String? status;
@override final  int? price;
@override final  String? productId;
@override final  String? buyerId;
@override final  String? sellerId;
@override final  String? senderId;
@override final  String? receiverId;
@override final  String? messageId;
@override final  String? conversationId;
@override final  ConversationDetails? conversation;
@override final  ProductsData? product;
@override final  AuthUserModel? sender;
@override final  AuthUserModel? receiver;

/// Create a copy of InboxOffers
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InboxOffersCopyWith<_InboxOffers> get copyWith => __$InboxOffersCopyWithImpl<_InboxOffers>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InboxOffersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InboxOffers&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.price, price) || other.price == price)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.buyerId, buyerId) || other.buyerId == buyerId)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.receiverId, receiverId) || other.receiverId == receiverId)&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.conversation, conversation) || other.conversation == conversation)&&(identical(other.product, product) || other.product == product)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.receiver, receiver) || other.receiver == receiver));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,status,price,productId,buyerId,sellerId,senderId,receiverId,messageId,conversationId,conversation,product,sender,receiver);

@override
String toString() {
  return 'InboxOffers(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, price: $price, productId: $productId, buyerId: $buyerId, sellerId: $sellerId, senderId: $senderId, receiverId: $receiverId, messageId: $messageId, conversationId: $conversationId, conversation: $conversation, product: $product, sender: $sender, receiver: $receiver)';
}


}

/// @nodoc
abstract mixin class _$InboxOffersCopyWith<$Res> implements $InboxOffersCopyWith<$Res> {
  factory _$InboxOffersCopyWith(_InboxOffers value, $Res Function(_InboxOffers) _then) = __$InboxOffersCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? createdAt, String? updatedAt, String? status, int? price, String? productId, String? buyerId, String? sellerId, String? senderId, String? receiverId, String? messageId, String? conversationId, ConversationDetails? conversation, ProductsData? product, AuthUserModel? sender, AuthUserModel? receiver
});


@override $ConversationDetailsCopyWith<$Res>? get conversation;@override $ProductsDataCopyWith<$Res>? get product;@override $AuthUserModelCopyWith<$Res>? get sender;@override $AuthUserModelCopyWith<$Res>? get receiver;

}
/// @nodoc
class __$InboxOffersCopyWithImpl<$Res>
    implements _$InboxOffersCopyWith<$Res> {
  __$InboxOffersCopyWithImpl(this._self, this._then);

  final _InboxOffers _self;
  final $Res Function(_InboxOffers) _then;

/// Create a copy of InboxOffers
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? status = freezed,Object? price = freezed,Object? productId = freezed,Object? buyerId = freezed,Object? sellerId = freezed,Object? senderId = freezed,Object? receiverId = freezed,Object? messageId = freezed,Object? conversationId = freezed,Object? conversation = freezed,Object? product = freezed,Object? sender = freezed,Object? receiver = freezed,}) {
  return _then(_InboxOffers(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,buyerId: freezed == buyerId ? _self.buyerId : buyerId // ignore: cast_nullable_to_non_nullable
as String?,sellerId: freezed == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String?,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String?,receiverId: freezed == receiverId ? _self.receiverId : receiverId // ignore: cast_nullable_to_non_nullable
as String?,messageId: freezed == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String?,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String?,conversation: freezed == conversation ? _self.conversation : conversation // ignore: cast_nullable_to_non_nullable
as ConversationDetails?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductsData?,sender: freezed == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as AuthUserModel?,receiver: freezed == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as AuthUserModel?,
  ));
}

/// Create a copy of InboxOffers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConversationDetailsCopyWith<$Res>? get conversation {
    if (_self.conversation == null) {
    return null;
  }

  return $ConversationDetailsCopyWith<$Res>(_self.conversation!, (value) {
    return _then(_self.copyWith(conversation: value));
  });
}/// Create a copy of InboxOffers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductsDataCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductsDataCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of InboxOffers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserModelCopyWith<$Res>? get sender {
    if (_self.sender == null) {
    return null;
  }

  return $AuthUserModelCopyWith<$Res>(_self.sender!, (value) {
    return _then(_self.copyWith(sender: value));
  });
}/// Create a copy of InboxOffers
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserModelCopyWith<$Res>? get receiver {
    if (_self.receiver == null) {
    return null;
  }

  return $AuthUserModelCopyWith<$Res>(_self.receiver!, (value) {
    return _then(_self.copyWith(receiver: value));
  });
}
}

// dart format on
