import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_notification_response_model.freezed.dart';
part 'all_notification_response_model.g.dart';

@freezed
abstract class NotificationResponseModel with _$NotificationResponseModel {
  const factory NotificationResponseModel({
    bool? success,
    String? message,
    String? error,
    List<NotificationModel>? data,
    int? total,
    int? page,
    int? limit,
    int? totalPages,
  }) = _NotificationResponseModel;

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseModelFromJson(json);
}

@freezed
abstract class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    String? id,
    String? receiverId,
    String? senderId,
    String? title,
    String? body,
    NotificationData? data,
    bool? isRead,
    DateTime? createdAt,
    NotificationSender? sender,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}

@freezed
abstract class NotificationData with _$NotificationData {
  const factory NotificationData({
    String? type,
    // For "new-offer" and "message"
    String? offerId,
    String? senderId,
    String? conversationId,
    String? senderUsername,
    String? senderProfilePic,
    String? messageId,
    // For "NEW_FOLLOWER"
    String? followerId,
    String? followerUsername,
    String? followerProfilePic,
    // For "PRODUCT_LIKE"
    String? likerId,
    String? productId,
    String? productTitle,
    String? likerUsername,
    String? likerProfilePic,
    // Legacy/other fields
    String? sellerId,
  }) = _NotificationData;

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);
}

@freezed
abstract class NotificationSender with _$NotificationSender {
  const factory NotificationSender({String? id}) = _NotificationSender;

  factory NotificationSender.fromJson(Map<String, dynamic> json) =>
      _$NotificationSenderFromJson(json);
}
