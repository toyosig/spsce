import 'package:circ/core/widgets/no_results_found.dart';
import 'package:circ/presentation/feature/chat/widgets/chat_inbox/shimmer_message_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:circ/presentation/feature/chat/view_model/chat_view_model.dart';
import 'package:circ/presentation/feature/chat/widgets/chat_inbox/chat_bubble.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/core/constant/global.dart';
import 'offer_card.dart';

class MessagesList extends StatefulWidget {
  const MessagesList({super.key});

  @override
  State<MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  late final ScrollController _scrollController;
  int _lastMessageCount = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Any initialization logic can go here
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    final viewModel = getIt.get<ChatViewModel>();
    viewModel.clear(context);
    super.dispose();
  }

  void scrollToBottomMessage() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Consumer<ChatViewModel>(
          builder: (context, viewModel, _) {
            final messages = viewModel.messages;
            if (_lastMessageCount != messages.length) {
              _lastMessageCount = messages.length;
              scrollToBottomMessage();
            }

            if (viewModel.isMessageLoading) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                reverse: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ShimmerMessage(isMe: index % 2 == 0);
                },
              );
            }

            if (messages.isEmpty) {
              return NoResultsFound();
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 10.h),
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(12),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final authViewModel = getIt.get<ProfileViewModel>();
                      final isMe = message.senderId == authViewModel.user?.id;

                      if (message.offer != null) {
                        return OfferCard(
                          message: message,
                          price: message.offer!.price.toString(),
                          isMe: isMe,
                          currentPrice:
                              message.offer!.product?.price.toString() ?? '',
                          createdAt: message.createdAt != null
                              ? DateTime.parse(message.createdAt!)
                              : DateTime.now(),
                        );
                      }
                      return ChatBubbles(isMe: isMe, message: message);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
