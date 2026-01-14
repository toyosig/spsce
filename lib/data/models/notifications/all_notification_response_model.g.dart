// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_notification_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationResponseModel _$NotificationResponseModelFromJson(
  Map<String, dynamic> json,
) => _NotificationResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  error: json['error'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  total: (json['total'] as num?)?.toInt(),
  page: (json['page'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
  totalPages: (json['totalPages'] as num?)?.toInt(),
);

Map<String, dynamic> _$NotificationResponseModelToJson(
  _NotificationResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'error': instance.error,
  'data': instance.data,
  'total': instance.total,
  'page': instance.page,
  'limit': instance.limit,
  'totalPages': instance.totalPages,
};

_NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    _NotificationModel(
      id: json['id'] as String?,
      receiverId: json['receiverId'] as String?,
      senderId: json['senderId'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      data:
          json['data'] == null
              ? null
              : NotificationData.fromJson(json['data'] as Map<String, dynamic>),
      isRead: json['isRead'] as bool?,
      createdAt:
          json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String),
      sender:
          json['sender'] == null
              ? null
              : NotificationSender.fromJson(
                json['sender'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$NotificationModelToJson(_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'receiverId': instance.receiverId,
      'senderId': instance.senderId,
      'title': instance.title,
      'body': instance.body,
      'data': instance.data,
      'isRead': instance.isRead,
      'createdAt': instance.createdAt?.toIso8601String(),
      'sender': instance.sender,
    };

_NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) =>
    _NotificationData(
      type: json['type'] as String?,
      offerId: json['offerId'] as String?,
      senderId: json['senderId'] as String?,
      conversationId: json['conversationId'] as String?,
      senderUsername: json['senderUsername'] as String?,
      senderProfilePic: json['senderProfilePic'] as String?,
      messageId: json['messageId'] as String?,
      followerId: json['followerId'] as String?,
      followerUsername: json['followerUsername'] as String?,
      followerProfilePic: json['followerProfilePic'] as String?,
      likerId: json['likerId'] as String?,
      productId: json['productId'] as String?,
      productTitle: json['productTitle'] as String?,
      likerUsername: json['likerUsername'] as String?,
      likerProfilePic: json['likerProfilePic'] as String?,
      sellerId: json['sellerId'] as String?,
    );

Map<String, dynamic> _$NotificationDataToJson(_NotificationData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'offerId': instance.offerId,
      'senderId': instance.senderId,
      'conversationId': instance.conversationId,
      'senderUsername': instance.senderUsername,
      'senderProfilePic': instance.senderProfilePic,
      'messageId': instance.messageId,
      'followerId': instance.followerId,
      'followerUsername': instance.followerUsername,
      'followerProfilePic': instance.followerProfilePic,
      'likerId': instance.likerId,
      'productId': instance.productId,
      'productTitle': instance.productTitle,
      'likerUsername': instance.likerUsername,
      'likerProfilePic': instance.likerProfilePic,
      'sellerId': instance.sellerId,
    };

_NotificationSender _$NotificationSenderFromJson(Map<String, dynamic> json) =>
    _NotificationSender(id: json['id'] as String?);

Map<String, dynamic> _$NotificationSenderToJson(_NotificationSender instance) =>
    <String, dynamic>{'id': instance.id};
