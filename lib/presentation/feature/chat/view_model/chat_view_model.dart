import 'dart:convert';
import 'dart:developer';

import 'package:circ/core/constant/global.dart';
import 'package:circ/data/models/auth/auth_user_model.dart';
import 'package:circ/data/models/chat/inbox/inbox_offers.dart';
import 'package:circ/data/models/chat/inbox/message_model.dart';
import 'package:circ/domain/repository/chat_repository.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/utils/helpers/loading_helpers.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../data/models/chat/chat_list.dart/chat_head_model.dart';
import '../../../../presentation/feature/chat/widgets/counter_offer_dialog.dart';

class ChatViewModel extends ChangeNotifier {
  final ChatRepository _repository = getIt.get<ChatRepository>();
  final TextEditingController messageController = TextEditingController();
  final TextEditingController counterOfferController = TextEditingController();

  // Static flag to track payment completion
  static bool _shouldRefreshAfterPayment = false;

  // State variables
  bool _isLoading = true;
  bool _isMessageLoading = false;
  bool _isSending = false;
  final List<InboxOffers> _buyerConversations = [];
  final List<int> _buyingUnreadCount = [];
  final List<int> _sellerUnreadCount = [];
  final List<InboxOffers> _sellerConversations = [];
  List<ChatHeadModel> _combinedConversations = [];
  final List<AuthUserModel> _combinedUsers = [];
  List<InboxOffers> _offers = [];
  List<MessageModel> _messages = [];
  String? _otherUserId;
  String? _communicationId;
  bool? _isDirectChat;
  String? _sellerId;
  final bool _isScrollListenerAttached = false;

  //******************* Getters ******************* //
  bool get isLoading => _isLoading;
  bool get isMessageLoading => _isMessageLoading;
  bool get isSending => _isSending;
  List<InboxOffers> get buyerConversations => _buyerConversations;
  List<ChatHeadModel> get combinedConversations => _combinedConversations;
  List<AuthUserModel> get combinedUsers => _combinedUsers;
  List<InboxOffers> get sellerConversations => _sellerConversations;
  List<MessageModel> get messages => _messages;
  List<InboxOffers> get offers => _offers;
  List<int> get buyingUnreadCount => _buyingUnreadCount;
  List<int> get sellerUnreadCount => _sellerUnreadCount;
  String? get otherUserId => _otherUserId;
  String? get communicationId => _communicationId;
  bool? get isDirectChat => _isDirectChat;
  String? get sellerId => _sellerId;
  bool get isScrollListenerAttached => _isScrollListenerAttached;

  // Static getter for payment refresh flag
  static bool get shouldRefreshAfterPayment => _shouldRefreshAfterPayment;

  // Static method to set payment completion flag
  static void setPaymentCompleted() {
    _shouldRefreshAfterPayment = true;
  }

  // Method to check and refresh after payment
  Future<void> checkAndRefreshAfterPayment(BuildContext context) async {
    if (_shouldRefreshAfterPayment) {
      _shouldRefreshAfterPayment = false;
      if (_otherUserId != null) {
        await getChats(_otherUserId!, context);
      }
    }
  }

  //******************* Initialization ******************* //
  Future<void> init(
    BuildContext context, {
    String? otherUserId,
    bool? isDirectChat,
    String? sellerId,
  }) async {
    _setLoading(true);
    try {
      _isDirectChat = isDirectChat;
      _otherUserId = otherUserId;
      _sellerId = sellerId;

      if (isDirectChat == true) {
        _messages = [];
        _offers = [];
        await getDirectConversation(sellerId ?? '', context);
      } else {
        if (context.mounted) {
          await getChats(otherUserId ?? '', context);
          if (_communicationId != null) {
            await markMessageAsRead(_communicationId ?? '');
          }
        }
      }
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //******************* Start of Message Operations ******************* //

  Future<void> getChats(String otherUserId, BuildContext context) async {
    LoadingHelper.showLoading(context);
    try {
      _messages.clear();
      _offers.clear();
      final response = await _repository.getChats(otherUserId);
      _messages.addAll(List<MessageModel>.from(response.data?.messages ?? []));
      _communicationId = response.data?.messages?.isNotEmpty == true
          ? response.data?.messages?.first.conversationId
          : '';
      notifyListeners();
    } catch (e) {
      log("error getChats: $e");
    } finally {
      if (context.mounted) LoadingHelper.hideLoading(context);
    }
  }

  Future<void> getChatsAfterOfferPayment(String otherUserId) async {
    try {
      _messages.clear();
      _offers.clear();
      final response = await _repository.getChats(otherUserId);
      _messages.addAll(List<MessageModel>.from(response.data?.messages ?? []));
      _communicationId = response.data?.messages?.isNotEmpty == true
          ? response.data?.messages?.first.conversationId
          : '';
      notifyListeners();
    } catch (e) {
      log("error getChats: $e");
    } finally {}
  }

  /// Get Conversations List
  Future<void> getConversations(BuildContext context) async {
    _setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      final response = await _repository.getConversations();
      if (response.success == true) {
        _combinedConversations = response.data ?? [];
        _combinedConversations.sort(
          (a, b) =>
              b.lastMessageTime?.compareTo(
                a.lastMessageTime ?? DateTime.now(),
              ) ??
              0,
        );
      } else {
        throw Exception(response.message);
      }
    } catch (e) {
      log("error getConversations: $e");
    } finally {
      _setLoading(false);
      if (context.mounted) LoadingHelper.hideLoading(context);
      notifyListeners();
    }
  }

  void _updateConversationLocally(String communicationId, String lastMessage) {
    try {
      final index = _combinedConversations.indexWhere(
        (element) => element.chatId == communicationId,
      );

      if (index != -1) {
        final updatedConversation = _combinedConversations[index].copyWith(
          lastMessage: lastMessage,
          lastMessageTime: DateTime.now(),
          unreadCount: 0,
        );

        _combinedConversations[index] = updatedConversation;

        // Sort conversations by last message time
        _combinedConversations.sort(
          (a, b) =>
              b.lastMessageTime?.compareTo(
                a.lastMessageTime ?? DateTime.now(),
              ) ??
              0,
        );
      }
    } catch (e) {
      log("Error updating conversation locally: $e");
    }
  }

  Future<void> addOffer(InboxOffers offer) async {
    _offers.add(offer);

    notifyListeners();
  }

  Future<void> markMessageAsRead(String messageId) async {
    try {
      await _repository.markMessageAsRead(messageId);
    } catch (e) {
      log("Error marking message as read: $e");
    }
  }

  //******************* End of Message Operations ******************* //

  //******************* Offer Operations ******************* //
  Future<void> acceptOffer(String offerId, BuildContext context) async {
    LoadingHelper.showLoading(context);
    try {
      await _repository.acceptOffer(offerId);
      if (context.mounted) {
        MessageHelper.showSuccessMessage(
          context,
          "Offer accepted successfully",
        );
      }
      if (context.mounted) {
        await getChats(_otherUserId ?? '', context);
      }
      _updateConversationLocally(_communicationId ?? '', 'Offer accepted');
    } catch (e) {
      log("error acceptOffer: $e");
    } finally {
      if (context.mounted) LoadingHelper.hideLoading(context);
      notifyListeners();
    }
  }

  Future<void> rejectOffer(String offerId, BuildContext context) async {
    LoadingHelper.showLoading(context);
    try {
      await _repository.rejectOffer(offerId);
      if (context.mounted) {
        MessageHelper.showSuccessMessage(
          context,
          "Offer rejected successfully",
        );
      }
      if (context.mounted) {
        await getChats(_otherUserId ?? '', context);
      }
    } catch (e) {
      log("error rejectOffer: $e");
    } finally {
      if (context.mounted) LoadingHelper.hideLoading(context);
    }
  }

  Future<void> counterOffer(
    String offerId,
    int oldOfferPrice,
    BuildContext context,
  ) async {
    final screenContext = context;

    showDialog(
      context: context,
      builder: (context) => CounterOfferDialog(
        oldOfferPrice: oldOfferPrice,
        counterOfferController: counterOfferController,
        onCancel: () => Navigator.of(context).pop(),
        onSubmit: (counterOffer) async {
          Navigator.of(context).pop();
          if (counterOffer.isEmpty) {
            MessageHelper.showErrorMessage(
              context,
              'Please enter counter offer',
            );
            return;
          }
          final ProfileViewModel profileVm = getIt.get<ProfileViewModel>();
          final seller = profileVm.user?.username;

          await _repository.counterOffer(
            offerId,
            double.tryParse(counterOffer) ?? 0,
            '$seller make an Counter Offer: ₦$counterOffer',
          );
          // clear controller
          counterOfferController.clear();
          if (screenContext.mounted) {
            await getChats(_otherUserId ?? '', screenContext);
          }
          notifyListeners();
          if (screenContext.mounted) {
            MessageHelper.showSuccessMessage(
              screenContext,
              'Counter offer sent successfully',
            );
          }
        },
      ),
    );
  }

  //******************* Direct Chat Operations ******************* //
  Future<void> getDirectConversation(
    String sellerId,
    BuildContext context,
  ) async {
    LoadingHelper.showLoading(context);
    _isMessageLoading = true;
    notifyListeners();
    _setLoading(true);
    try {
      final response = await _repository.getDirectConversation(sellerId);
      _messages.addAll(List<MessageModel>.from(response.data ?? []));
    } catch (e) {
      log("error getDirectConversation: $e");
    } finally {
      _setLoading(false);
      _isMessageLoading = false;
      notifyListeners();
      if (context.mounted) LoadingHelper.hideLoading(context);
    }
  }

  Future<void> sendDirectMessage({
    required String sellerOrReceiverId,
    required String message,
  }) async {
    _isSending = true;
    notifyListeners();
    final profileVm = getIt.get<ProfileViewModel>();
    _setLoading(true);
    try {
      await _repository.sendDirectMessage(sellerOrReceiverId, message);
      if (message.trim().isEmpty) return;
      final newMessage = MessageModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: message,
        senderId: profileVm.user?.id ?? '',
        conversationId: _otherUserId ?? '',
        read: false,
        createdAt: DateTime.now().toString(),
        sender: AuthUserModel(id: profileVm.user?.id ?? ''),
      );
      _messages.add(newMessage);
      messageController.clear();
      _updateConversationLocally(_communicationId ?? '', message);
    } catch (e) {
      throw Exception(e);
    } finally {
      _isSending = false;
      _setLoading(false);
      notifyListeners();
    }
  }

  //******************* Utility Methods ******************* //
  String formatTime(String timestamp) {
    try {
      final date = DateTime.parse(timestamp);
      return "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";
    } catch (e) {
      return "";
    }
  }

  String getLastMessage(InboxOffers conversation) {
    return conversation.conversation?.lastMessage?.text ?? '';
  }

  String getLastMessage1(ChatHeadModel conversation) {
    return conversation.lastMessage;
  }

  void navigateToChat(BuildContext context, dynamic receiver) {
    context.push(
      '/chatInbox',
      extra: {
        "other_user_id": receiver?.id,
        "name": receiver?.username,
        "imagePath": receiver?.profilePic,
      },
    );
  }

  /// dispose
  Future<void> clear(BuildContext context) async {
    _messages.clear();
    _offers.clear();
    _combinedUsers.clear();
    _buyerConversations.clear();
    _sellerConversations.clear();
    _buyingUnreadCount.clear();
    _sellerUnreadCount.clear();
    _isDirectChat = null;
    _sellerId = null;
    final response = await _repository.getConversations();
    if (response.success == true) {
      _combinedConversations = response.data ?? [];
      if (_communicationId != null) {
        await markMessageAsRead(_communicationId ?? '');
      }
    }
    // await getConversations(context);
  }

  /// Update conversation head from socket event
  void updateConversationFromSocket(Map<String, dynamic> data) {
    try {
      final chatId = data['conversation_id'] ?? data['chatId'];
      if (chatId == null) return;
      final index = _combinedConversations.indexWhere(
        (c) => c.chatId == chatId,
      );
      if (index != -1) {
        final updatedConversation = _combinedConversations[index].copyWith(
          lastMessage:
              data['last_message'] ?? _combinedConversations[index].lastMessage,
          lastMessageTime: data['last_message_time'] != null
              ? DateTime.tryParse(data['last_message_time'].toString()) ??
                    _combinedConversations[index].lastMessageTime
              : _combinedConversations[index].lastMessageTime,
          unreadCount:
              data['unread_count'] ?? _combinedConversations[index].unreadCount,
        );
        log("data is: ${data.toString()}");
        _combinedConversations[index] = updatedConversation;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error updating conversation from socket: $e');
    }
  }

  /// Add new conversation from socket event
  void addNewConversationFromSocket(Map<String, dynamic> data) {
    try {
      debugPrint('Adding new conversation from socket: $data');

      // Create a new ChatHeadModel from the received data
      final newConversation = ChatHeadModel(
        chatId: data['chat_id'] ?? data['chatId'] ?? '',
        user: data['user'] != null
            ? AuthUserModel.fromJson(data['user'])
            : null,
        lastMessage: data['last_message'] ?? '',
        lastMessageTime: data['last_message_time'] != null
            ? DateTime.tryParse(data['last_message_time'].toString())
            : DateTime.now(),
        unreadCount: data['unread_count'] ?? 0,
        isDirectChat: data['is_direct'] ?? false,
      );

      // Check if conversation already exists
      final existingIndex = _combinedConversations.indexWhere(
        (c) => c.chatId == newConversation.chatId,
      );

      if (existingIndex == -1) {
        // Add the new conversation to the list
        _combinedConversations.add(newConversation);

        // Sort conversations by last message time
        _combinedConversations.sort(
          (a, b) =>
              b.lastMessageTime?.compareTo(
                a.lastMessageTime ?? DateTime.now(),
              ) ??
              0,
        );

        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error adding new conversation from socket: $e');
    }
  }

  /// Add a new message from socket event (with offer and message)
  void addMessageFromSocket(Map<String, dynamic> data) {
    try {
      final offerMap = data['data']['offer'] as Map<String, dynamic>?;
      final messageMap = data['data']['message'] == null
          ? null
          : data['data']['message'] as Map<String, dynamic>?;
      final conversationId = data['data']['conversationId'] as String?;

      // Only add if this is the currently open conversation
      // if (conversationId != _conversationId) {
      //   // This message/offer is not for the currently open chat
      //   return;
      // }

      dynamic message;
      if (messageMap == null) return;

      message = MessageModel(
        id: messageMap['id'] ?? '',
        text: messageMap['text'] ?? '',
        senderId: messageMap['sender']?['id'] ?? '',
        conversationId: conversationId ?? '',
        createdAt: messageMap['createdAt'] ?? '',
        sender: messageMap['sender'] != null
            ? AuthUserModel.fromJson(messageMap['sender'])
            : null,
        offer: offerMap != null ? InboxOffers.fromJson(offerMap) : null,
        offerId: offerMap != null ? offerMap['id'] ?? '' : '',
      );

      // Check if a message with the same offerId already exists
      if (message.offerId != null && message.offerId.toString().isNotEmpty) {
        final index = _messages.indexWhere((m) => m.offerId == message.offerId);
        if (index != -1) {
          // Update the offer in the existing message
          _messages[index] = _messages[index].copyWith(
            offer: message.offer,
            offerId: message.offerId,
          );
          notifyListeners();
          return;
        }
      }

      log('Message from socket: \u001b[32m${jsonEncode(message)}\u001b[0m');
      _messages.add(message);
      notifyListeners();
    } catch (e, st) {
      debugPrint('Error adding message from socket: $e\n$st');
    }
  }
}
