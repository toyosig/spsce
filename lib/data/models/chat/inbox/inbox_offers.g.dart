// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inbox_offers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InboxOffers _$InboxOffersFromJson(Map<String, dynamic> json) => _InboxOffers(
  id: json['id'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  status: json['status'] as String?,
  price: (json['price'] as num?)?.toInt(),
  productId: json['productId'] as String?,
  buyerId: json['buyerId'] as String?,
  sellerId: json['sellerId'] as String?,
  senderId: json['senderId'] as String?,
  receiverId: json['receiverId'] as String?,
  messageId: json['messageId'] as String?,
  conversationId: json['conversationId'] as String?,
  conversation:
      json['conversation'] == null
          ? null
          : ConversationDetails.fromJson(
            json['conversation'] as Map<String, dynamic>,
          ),
  product:
      json['product'] == null
          ? null
          : ProductsData.fromJson(json['product'] as Map<String, dynamic>),
  sender:
      json['sender'] == null
          ? null
          : AuthUserModel.fromJson(json['sender'] as Map<String, dynamic>),
  receiver:
      json['receiver'] == null
          ? null
          : AuthUserModel.fromJson(json['receiver'] as Map<String, dynamic>),
);

Map<String, dynamic> _$InboxOffersToJson(_InboxOffers instance) =>
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
      'conversation': instance.conversation,
      'product': instance.product,
      'sender': instance.sender,
      'receiver': instance.receiver,
    };
