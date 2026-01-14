import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/chat/view_model/chat_view_model.dart';
import 'package:circ/presentation/feature/chat/widgets/chat_inbox/message_list.dart';
import 'package:circ/presentation/feature/chat/widgets/msg_appbar.dart';
import 'package:circ/presentation/feature/chat/widgets/send_chat.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// A widget that displays a chat conversation between users.
class ChatInbox extends StatefulWidget {
  final String? otherUserId;
  final String? name;
  final String? imagePath;

  const ChatInbox({super.key, this.otherUserId, this.name, this.imagePath});

  @override
  State<ChatInbox> createState() => _ChatInboxState();
}

class _ChatInboxState extends State<ChatInbox> {
  @override
  void initState() {
    super.initState();
    _initializeChat();
  }

  void _initializeChat() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = getIt.get<ChatViewModel>();
      viewModel.init(context, otherUserId: widget.otherUserId);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = getIt.get<ChatViewModel>();
      viewModel.checkAndRefreshAfterPayment(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Consumer<ChatViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                MsgAppBar(
                  title: widget.name ?? 'Unnamed',
                  imagePath: widget.imagePath,
                  userId: widget.otherUserId ?? '',
                ),
                MessagesList(),
                ChatInputField(
                  controller: viewModel.messageController,
                  onSend: () {
                    if (viewModel.isSending) return;
                    if (viewModel.messageController.text.isEmpty) return;
                    viewModel.sendDirectMessage(
                      sellerOrReceiverId: widget.otherUserId ?? '',
                      message: viewModel.messageController.text.toString(),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
