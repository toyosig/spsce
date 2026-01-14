import 'package:circ/data/models/chat/inbox/message_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../home/products_data.dart';

part 'old_message_model.freezed.dart';
part 'old_message_model.g.dart';

@freezed
abstract class OldMessageModel with _$OldMessageModel {
  const factory OldMessageModel({
    required OldOfferData offer,
    required List<MessageModel> messages,
    double? averageSellerRating,
  }) = _OldMessageModel;

  factory OldMessageModel.fromJson(Map<String, dynamic> json) =>
      _$OldMessageModelFromJson(json);
}

@freezed
abstract class OldOfferData with _$OldOfferData {
  const factory OldOfferData({
    required String id,
    required String createdAt,
    required String updatedAt,
    required String status,
    required int price,
    required String productId,
    String? buyerId,
    String? sellerId,
    required String senderId,
    required String receiverId,
    String? messageId,
    required String conversationId,
    required ProductsData product,
    required ChatUser sender,
    required ChatUser receiver,
  }) = _OldOfferData;

  factory OldOfferData.fromJson(Map<String, dynamic> json) =>
      _$OldOfferDataFromJson(json);
}

// @freezed
// abstract class OldMessage with _$OldMessage {
//   const factory OldMessage({
//     required String id,
//     required String text,
//     required String senderId,
//     required String conversationId,
//     required bool read,
//     required String createdAt,
//     String? offerId,
//     required ChatUser sender,
//   }) = _OldMessage;

//   factory OldMessage.fromJson(Map<String, dynamic> json) =>
//       _$OldMessageFromJson(json);
// }

@freezed
abstract class ChatUser with _$ChatUser {
  const factory ChatUser({
    @Default('') String? id,
    @Default('') String? username,
    @Default('') String? profilePic,
    @Default([]) List<dynamic> reviewsReceived,
  }) = _ChatUser;

  factory ChatUser.fromJson(Map<String, dynamic> json) =>
      _$ChatUserFromJson(json);
}
