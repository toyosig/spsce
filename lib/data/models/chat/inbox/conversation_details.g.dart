// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConversationDetails _$ConversationDetailsFromJson(Map<String, dynamic> json) =>
    _ConversationDetails(
      id: json['id'] as String? ?? '',
      participant1Id: json['participant1Id'] as String? ?? '',
      participant2Id: json['participant2Id'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
      productId: json['productId'] as String? ?? '',
      messages:
          (json['messages'] as List<dynamic>?)
              ?.map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
      lastMessage:
          json['lastMessage'] == null
              ? null
              : MessageModel.fromJson(
                json['lastMessage'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$ConversationDetailsToJson(
  _ConversationDetails instance,
) => <String, dynamic>{
  'id': instance.id,
  'participant1Id': instance.participant1Id,
  'participant2Id': instance.participant2Id,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'productId': instance.productId,
  'messages': instance.messages,
  'unreadCount': instance.unreadCount,
  'lastMessage': instance.lastMessage,
};
