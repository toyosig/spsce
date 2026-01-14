import 'package:circ/core/constant/global.dart';
import 'package:circ/data/data_sources/remote/chat_rds.dart';
import 'package:circ/data/models/api/api_response.dart';
import 'package:circ/data/models/chat/chat_list.dart/chat_head_model.dart';
import 'package:circ/data/models/chat/inbox/chat_details_data.dart';
import 'package:circ/data/models/chat/inbox/received_offers_model.dart';
import 'package:circ/data/models/chat/inbox/sent_offer_response_model.dart';
import 'package:circ/domain/repository/chat_repository.dart';
import '../models/chat/inbox/message_model.dart';

class ChatRepoImpl implements ChatRepository {
  final ChatRDS _chatRDS = getIt.get<ChatRDS>();

  @override
  Future<SentOffersResponseModel> getbuyingConversations() async {
    try {
      final response = await _chatRDS.getbuyingConversations();
      return SentOffersResponseModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ReceivedOffersResponse> getSellerConversations() async {
    try {
      final response = await _chatRDS.getSellerConversations();
      return ReceivedOffersResponse.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ApiResponse<ChatDetailData>> getChats(String conversationId) async {
    try {
      final response = await _chatRDS.getChats(conversationId);
      return ApiResponse(
        success: response['success'] ?? false,
        message: response['message'] ?? '',
        data: ChatDetailData.fromJson(response['data']),
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> sendMessage(
    String receiverId,
    String conversationId,
    String message,
  ) async {
    try {
      final response = await _chatRDS.sendMessage(
        receiverId,
        conversationId,
        message,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ApiResponse<int>> markMessageAsRead(String messageId) async {
    try {
      final response = await _chatRDS.markMessageAsRead(messageId);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ApiResponse<int>> acceptOffer(String offerId) async {
    try {
      final response = await _chatRDS.acceptOffer(offerId);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ApiResponse<int>> rejectOffer(String offerId) async {
    try {
      final response = await _chatRDS.rejectOffer(offerId);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> counterOffer(
    String offerId,
    double counterOffer,
    String message,
  ) async {
    try {
      final response = await _chatRDS.counterOffer(
        offerId,
        counterOffer,
        message,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ApiResponse<List<MessageModel>>> getDirectConversation(
    String sellerId,
  ) async {
    try {
      final response = await _chatRDS.getDirectConversation(sellerId);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ApiResponse<String>> sendDirectMessage(
    String sellerId,
    String message,
  ) async {
    try {
      final response = await _chatRDS.sendDirectMessage(sellerId, message);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ApiResponse<List<ChatHeadModel>>> getConversations() async {
    try {
      final response = await _chatRDS.getConversations();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
