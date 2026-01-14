// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageModel _$MessageModelFromJson(Map<String, dynamic> json) =>
    _MessageModel(
      id: json['id'] as String? ?? '',
      text: json['text'] as String? ?? '',
      senderId: json['senderId'] as String? ?? '',
      conversationId: json['conversationId'] as String? ?? '',
      read: json['read'] as bool? ?? false,
      createdAt: json['createdAt'] as String? ?? '',
      sender:
          json['sender'] == null
              ? null
              : AuthUserModel.fromJson(json['sender'] as Map<String, dynamic>),
      offerId: json['offerId'] as String? ?? '',
      offer:
          json['offer'] == null
              ? null
              : InboxOffers.fromJson(json['offer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageModelToJson(_MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'senderId': instance.senderId,
      'conversationId': instance.conversationId,
      'read': instance.read,
      'createdAt': instance.createdAt,
      'sender': instance.sender,
      'offerId': instance.offerId,
      'offer': instance.offer,
    };
