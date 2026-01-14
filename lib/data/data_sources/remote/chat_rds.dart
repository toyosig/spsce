import 'dart:developer';

import 'package:circ/core/constant/api_endpoints.dart';
import 'package:circ/core/networks/api_client.dart';
import 'package:circ/data/models/api/api_response.dart';
import 'package:circ/data/models/chat/inbox/message_model.dart';

import '../../models/chat/chat_list.dart/chat_head_model.dart';

class ChatRDS {
  final ApiClient _apiClient = ApiClient(ApiPath.baseUrl);

  /// Get all conversations
  Future<dynamic> getbuyingConversations() async {
    try {
      log("End point: ${ApiPath.getBuyConversations}");
      final response = await _apiClient.get(ApiPath.getBuyConversations);
      log("Response: ${response.data}");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to get conversations');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> getSellerConversations() async {
    try {
      log("End point: ${ApiPath.getSellConversations}");
      final response = await _apiClient.get(ApiPath.getSellConversations);
      log("Response: ${response.data}");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to get conversations');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  /// Get Old Messages
  Future<dynamic> getChats(String conversationId) async {
    try {
      log("End point: ${ApiPath.getChats(conversationId)}");
      final response = await _apiClient.get(ApiPath.getChats(conversationId));
      log("Response: ${response.data}");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to get old messages');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  /// Send Message
  Future<dynamic> sendMessage(
    String receiverId,
    String conversationId,
    String message,
  ) async {
    try {
      log("End point: ${ApiPath.sendMessage(receiverId, conversationId)}");
      final response = await _apiClient.post(
        endpoint: ApiPath.sendMessage(receiverId, conversationId),
        data: {'text': message},
      );
      log("Response: ${response.data}");
      if (response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Failed to send message');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  /// Mark Message as Read
  Future<ApiResponse<int>> markMessageAsRead(String messageId) async {
    try {
      log("End point: ${ApiPath.markMessageAsRead}/$messageId");
      final response = await _apiClient.get(
        "${ApiPath.markMessageAsRead}/$messageId",
      );
      log("Response: ${response.data}");
      if (response.statusCode == 200) {
        return ApiResponse(
          success: response.data['success'] ?? false,
          message: response.data['message'] ?? '',
          data: response.data['data'] ?? 0,
        );
      } else {
        throw Exception('Failed to mark message as read');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ApiResponse<int>> acceptOffer(String offerId) async {
    try {
      log("End point: ${ApiPath.acceptOffer(offerId)}");
      final response = await _apiClient.post(
        endpoint: ApiPath.acceptOffer(offerId),
      );
      log("Response: ${response.data}");
      if (response.statusCode == 201) {
        return ApiResponse(
          success: response.data['success'] ?? false,
          message: response.data['message'] ?? '',
          data: response.data['data']['data'] ?? 0,
        );
      } else {
        throw Exception('Failed to accept offer');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ApiResponse<int>> rejectOffer(String offerId) async {
    try {
      log("End point: ${ApiPath.rejectOffer(offerId)}");
      final response = await _apiClient.post(
        endpoint: ApiPath.rejectOffer(offerId),
      );
      log("Response: ${response.data}");
      if (response.statusCode == 201) {
        return ApiResponse(
          success: response.data['success'] ?? false,
          message: response.data['message'] ?? '',
          data: response.data['data']['data'] ?? 0,
        );
      } else {
        throw Exception('Failed to reject offer');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> counterOffer(
    String offerId,
    double counterOffer,
    String message,
  ) async {
    try {
      log("End point: ${ApiPath.counterOffer(offerId)}");
      final response = await _apiClient.post(
        endpoint: ApiPath.counterOffer(offerId),
        data: {"counterPrice": counterOffer, "message": message},
      );
      log("Response: ${response.data}");
      if (response.statusCode == 201) {
        return true;
      } else {
        throw Exception('Failed to counter offer');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //* Direct Chat
  Future<ApiResponse<List<MessageModel>>> getDirectConversation(
    String id,
  ) async {
    try {
      log("End point: ${ApiPath.getDirectConversationById(id)}");
      final response = await _apiClient.get(
        ApiPath.getDirectConversationById(id),
      );
      log("Response: ${response.data}");
      if (response.statusCode == 200) {
        final rawData = response.data['data'];

        final rawList = rawData['messages'] as List<dynamic>?;

        final messages = rawList
            ?.map((item) => MessageModel.fromJson(item))
            .toList();

        return ApiResponse(
          success: response.data['success'] ?? false,
          message: response.data['message'] ?? '',
          data: messages,
        );
      } else {
        throw Exception('Failed to get direct conversation');
      }
    } catch (e) {
      throw Exception('Error in getDirectConversation: $e');
    }
  }

  //* Send Direct Message
  Future<ApiResponse<String>> sendDirectMessage(
    String id,
    String message,
  ) async {
    try {
      log("End point: ${ApiPath.sendDirectMessage(id)}");
      final response = await _apiClient.post(
        endpoint: ApiPath.sendDirectMessage(id),
        data: {'text': message},
      );
      log("Response: ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['data'];
        // final message = MessageModel.fromJson(data);
        final conversationId = data['conversationId'];
        return ApiResponse(
          success: response.data['success'] ?? false,
          message: response.data['message'] ?? '',
          data: conversationId,
        );
      } else {
        throw Exception('Failed to send direct message');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //* Get Conversations
  Future<ApiResponse<List<ChatHeadModel>>> getConversations() async {
    try {
      log("End point: ${ApiPath.getConversations}");
      final response = await _apiClient.get(ApiPath.getConversations);
      log("Response: ${response.data}");
      if (response.statusCode == 200) {
        final List<dynamic> rawList = response.data['data'] ?? [];

        final chatHeads = rawList
            .map((json) => ChatHeadModel.fromJson(json as Map<String, dynamic>))
            .toList();

        return ApiResponse(
          success: response.data['success'] ?? false,
          message: response.data['message'] ?? '',
          data: chatHeads,
        );
      } else {
        throw Exception('Failed to get conversations');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
