import 'package:circ/data/models/chat/inbox/message_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_details.freezed.dart'; 
part 'conversation_details.g.dart';

@freezed
abstract class ConversationDetails with _$ConversationDetails {
  const factory ConversationDetails({
    @Default('') String? id,
    @Default('') String? participant1Id,
    @Default('') String? participant2Id,
    @Default('') String? createdAt,
    @Default('') String? updatedAt,
    @Default('') String? productId,
    @Default([]) List<MessageModel>? messages,
    @Default(0) int? unreadCount,
    MessageModel? lastMessage,
  }) = _ConversationDetails;

  factory ConversationDetails.fromJson(Map<String, dynamic> json) =>
      _$ConversationDetailsFromJson(json);
}
