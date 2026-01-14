import 'package:circ/core/constant/api_endpoints.dart';
import 'package:circ/domain/services/secure_storage_services.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import '../../core/constant/global.dart';
import '../../presentation/feature/chat/view_model/chat_view_model.dart';

class SocketService extends ChangeNotifier {
  static final SocketService _instance = SocketService._internal();
  factory SocketService() => _instance;
  SocketService._internal();

  io.Socket? socket;
  String? _token;
  final chatViewModel = getIt.get<ChatViewModel>();

  /// initialize socket connection
  Future<void> initSocketConnection() async {
    try {
      final user = await SecureStorageService.getUser();
      _token = user?.accessToken;

      if (_token == null) {
        return;
      }
      _initializeSocket();
      _setupEventHandlers();
    } catch (e) {
      rethrow;
    }
  }

  /// initialize socket
  void _initializeSocket() {
    socket = io.io("${ApiPath.socketUrl}chat", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'extraHeaders': {'authorization': 'Bearer $_token'},
      'reconnection': true,
      'reconnectionAttempts': 5,
      'reconnectionDelay': 2000,
    });
  }

  /// setup event handlers
  void _setupEventHandlers() {
    socket?.connect();

    socket?.onConnect((_) {
      debugPrint('🔗 Socket connected successfully');
    });

    socket?.onDisconnect((_) {
      debugPrint('⚠️ Socket disconnected');
    });

    socket?.onConnectError((data) {
      debugPrint('❌ Socket connection error: $data');
    });

    socket?.onError((data) {
      debugPrint('🔥 Socket error occurred: $data');
    });

    socket?.on('newMessage', (data) {
      try {
        debugPrint('📩 New message received: $data');

        if (data['success'] == true) {
          chatViewModel.addMessageFromSocket(data);
          //   final messageMap = data['data']['message'];
          //   final offerMap = data['data']['offer'];
          //   final conversationId = data['data']['conversationId'];

          //   if (messageMap is Map<String, dynamic>) {
          //     chatViewModel.addMessageFromSocket( )
          //     // debugPrint('📩 Message text: ${messageMap['text']}');
          //   } else {
          //     // debugPrint('⚠️ Unexpected message format');
          //   }

          //   // if (offerMap != null && offerMap is Map<String, dynamic>) {
          //   //   chatViewModel.addOffer(InboxOffers.fromJson(offerMap));
          //   //   // debugPrint('📩 Offer: ${InboxOffers.fromJson(offerMap).toJson()}');
          //   // }
        } else {
          debugPrint('❌ Message received with success: false');
        }
      } catch (e, st) {
        debugPrint('❌ Error parsing message: $e\n$st');
      }
    });

    /// listen this one too conversation_update
    socket?.on('conversation_update', (data) {
      debugPrint('📩 Conversation updated: $data');
      chatViewModel.updateConversationFromSocket(data);
    });

    /// listen for new conversations
    socket?.on('new_conversation', (data) {
      debugPrint('📩 New conversation received: $data');
      chatViewModel.addNewConversationFromSocket(data);
    });
  }

  @override
  void dispose() {
    disposeSocket();
    super.dispose();
  }

  /// dispose socket
  void disposeSocket() {
    socket?.clearListeners();
    socket?.disconnect();
    socket?.dispose();
  }
}
