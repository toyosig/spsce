// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_head_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatHeadModel _$ChatHeadModelFromJson(Map<String, dynamic> json) =>
    _ChatHeadModel(
      chatId: json['chat_id'] as String? ?? '',
      user:
          json['user'] == null
              ? null
              : AuthUserModel.fromJson(json['user'] as Map<String, dynamic>),
      lastMessage: json['last_message'] as String? ?? '',
      lastMessageTime:
          json['last_message_time'] == null
              ? null
              : DateTime.parse(json['last_message_time'] as String),
      unreadCount: (json['unread_count'] as num?)?.toInt() ?? 0,
      isDirectChat: json['is_direct'] as bool? ?? false,
    );

Map<String, dynamic> _$ChatHeadModelToJson(_ChatHeadModel instance) =>
    <String, dynamic>{
      'chat_id': instance.chatId,
      'user': instance.user,
      'last_message': instance.lastMessage,
      'last_message_time': instance.lastMessageTime?.toIso8601String(),
      'unread_count': instance.unreadCount,
      'is_direct': instance.isDirectChat,
    };
