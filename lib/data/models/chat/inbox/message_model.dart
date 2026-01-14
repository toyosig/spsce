import 'package:circ/data/models/chat/inbox/inbox_offers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/auth_user_model.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
abstract class MessageModel with _$MessageModel {
  const factory MessageModel({
    @Default('') String? id,
    @Default('') String? text,
    @Default('') String? senderId,
    @Default('') String? conversationId,
    @Default(false) bool? read,
    @Default('') String? createdAt,
    AuthUserModel? sender,
    @Default('') String? offerId,
    InboxOffers? offer, // ✅ NEW FIELD
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}
