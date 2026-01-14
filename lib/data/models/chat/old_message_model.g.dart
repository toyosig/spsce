// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'old_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OldMessageModel _$OldMessageModelFromJson(Map<String, dynamic> json) =>
    _OldMessageModel(
      offer: OldOfferData.fromJson(json['offer'] as Map<String, dynamic>),
      messages:
          (json['messages'] as List<dynamic>)
              .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      averageSellerRating: (json['averageSellerRating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OldMessageModelToJson(_OldMessageModel instance) =>
    <String, dynamic>{
      'offer': instance.offer,
      'messages': instance.messages,
      'averageSellerRating': instance.averageSellerRating,
    };

_OldOfferData _$OldOfferDataFromJson(Map<String, dynamic> json) =>
    _OldOfferData(
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      status: json['status'] as String,
      price: (json['price'] as num).toInt(),
      productId: json['productId'] as String,
      buyerId: json['buyerId'] as String?,
      sellerId: json['sellerId'] as String?,
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      messageId: json['messageId'] as String?,
      conversationId: json['conversationId'] as String,
      product: ProductsData.fromJson(json['product'] as Map<String, dynamic>),
      sender: ChatUser.fromJson(json['sender'] as Map<String, dynamic>),
      receiver: ChatUser.fromJson(json['receiver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OldOfferDataToJson(_OldOfferData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'status': instance.status,
      'price': instance.price,
      'productId': instance.productId,
      'buyerId': instance.buyerId,
      'sellerId': instance.sellerId,
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'messageId': instance.messageId,
      'conversationId': instance.conversationId,
      'product': instance.product,
      'sender': instance.sender,
      'receiver': instance.receiver,
    };

_ChatUser _$ChatUserFromJson(Map<String, dynamic> json) => _ChatUser(
  id: json['id'] as String? ?? '',
  username: json['username'] as String? ?? '',
  profilePic: json['profilePic'] as String? ?? '',
  reviewsReceived: json['reviewsReceived'] as List<dynamic>? ?? const [],
);

Map<String, dynamic> _$ChatUserToJson(_ChatUser instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'profilePic': instance.profilePic,
  'reviewsReceived': instance.reviewsReceived,
};
