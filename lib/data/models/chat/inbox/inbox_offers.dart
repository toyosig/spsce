import 'package:circ/data/models/chat/inbox/conversation_details.dart';
import 'package:circ/data/models/home/products_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/auth_user_model.dart';

part 'inbox_offers.freezed.dart';
part 'inbox_offers.g.dart';

@freezed
abstract class InboxOffers with _$InboxOffers {
  const factory InboxOffers({
    String? id,
    String? createdAt,
    String? updatedAt,
    String? status,
    int? price,
    String? productId,
    String? buyerId,
    String? sellerId,
    String? senderId,
    String? receiverId,
    String? messageId,
    String? conversationId,
    ConversationDetails? conversation,
    ProductsData? product,
    AuthUserModel? sender,
    AuthUserModel? receiver,
  }) = _InboxOffers;

  factory InboxOffers.fromJson(Map<String, dynamic> json) =>
      _$InboxOffersFromJson(json);
}
