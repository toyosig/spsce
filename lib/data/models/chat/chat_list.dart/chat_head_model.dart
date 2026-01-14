import 'package:circ/data/models/auth/auth_user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_head_model.freezed.dart';
part 'chat_head_model.g.dart';

@freezed
abstract class ChatHeadModel with _$ChatHeadModel {
  const factory ChatHeadModel({
    @Default('') @JsonKey(name: 'chat_id') String chatId,
    AuthUserModel? user,
    @Default('') @JsonKey(name: 'last_message') String lastMessage,
    @JsonKey(name: 'last_message_time') DateTime? lastMessageTime,
    @Default(0) @JsonKey(name: 'unread_count') int unreadCount,
    @Default(false) @JsonKey(name: 'is_direct') bool? isDirectChat,
  }) = _ChatHeadModel;

  factory ChatHeadModel.fromJson(Map<String, dynamic> json) =>
      _$ChatHeadModelFromJson(json);
}
