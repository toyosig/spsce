import 'package:circ/core/constant/global.dart';
import 'package:circ/core/widgets/no_results_found.dart';
import 'package:circ/presentation/feature/chat/view_model/chat_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chat_tile.dart';

class ChatListsWidget extends StatelessWidget {
  const ChatListsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<ChatViewModel>();
    final combinedConversations = viewModel.combinedConversations;

    if (combinedConversations.isEmpty) {
      return Expanded(child: Center(child: NoResultsFound()));
    }
    if (viewModel.isLoading) {
      return const SizedBox.shrink();
    }

    return Consumer<ChatViewModel>(
      builder: (context, viewModel, child) {
        return Expanded(
          child: ListView.separated(
            itemCount: combinedConversations.length,
            itemBuilder: (context, index) {
              final conversation = combinedConversations[index];
              final unReadCount = conversation.unreadCount;
              final user = conversation.user;
              return ChatTile(
                onTap: () => viewModel.navigateToChat(context, user),
                name: user?.username ?? 'Unknown User',
                subtitle: conversation.lastMessage,
                imagePath: user?.avatarUrl ?? '',
                unreadCount: unReadCount,
                tiemago: conversation.lastMessageTime,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                thickness: 1,
                color: AppColors.lightgrey,
                height: 2,
              );
            },
          ),
        );
      },
    );
  }
}
