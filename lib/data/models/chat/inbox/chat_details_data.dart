import 'package:circ/data/models/chat/inbox/message_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_details_data.freezed.dart';
part 'chat_details_data.g.dart';

@freezed
abstract class ChatDetailData with _$ChatDetailData {
  const factory ChatDetailData({
    List<MessageModel>? messages,
    double? averageSellerRating,
  }) = _ChatDetailData;

  factory ChatDetailData.fromJson(Map<String, dynamic> json) =>
      _$ChatDetailDataFromJson(json);
}
