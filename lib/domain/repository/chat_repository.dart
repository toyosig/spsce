import 'package:circ/data/models/api/api_response.dart';
import 'package:circ/data/models/chat/chat_list.dart/chat_head_model.dart';
import 'package:circ/data/models/chat/inbox/chat_details_data.dart';
import 'package:circ/data/models/chat/inbox/message_model.dart';
import 'package:circ/data/models/chat/inbox/received_offers_model.dart';
import 'package:circ/data/models/chat/inbox/sent_offer_response_model.dart';

abstract class ChatRepository {
  Future<SentOffersResponseModel> getbuyingConversations();
  Future<ReceivedOffersResponse> getSellerConversations();
  Future<ApiResponse<ChatDetailData>> getChats(String conversationId);
  Future<void> sendMessage(
    String receiverId,
    String conversationId,
    String message,
  );
  Future<ApiResponse<int>> markMessageAsRead(String messageId);
  Future<ApiResponse<int>> acceptOffer(String offerId);
  Future<ApiResponse<int>> rejectOffer(String offerId);
  Future<bool> counterOffer(
    String offerId,
    double counterOffer,
    String message,
  );
  Future<ApiResponse<List<MessageModel>>> getDirectConversation(
    String sellerId,
  );
  Future<ApiResponse<String>> sendDirectMessage(
    String sellerId,
    String message,
  );
  Future<ApiResponse<List<ChatHeadModel>>> getConversations();
}
