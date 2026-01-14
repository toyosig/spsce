import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/chat/view_model/chat_view_model.dart';
import 'package:circ/presentation/feature/chat/widgets/chat_list/chat_lists_widget.dart';
import 'package:circ/utils/constants/custom_primary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/services/secure_storage_services.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  void initState() {
    super.initState();
    final viewModel = getIt.get<ChatViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (await SecureStorageService.isGuestUser()) {
        return;
      }
      if (mounted) {
        viewModel.getConversations(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TabController? tabController;

    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Consumer<ChatViewModel>(
            builder: (context, viewModel, child) {
              return Column(
                children: [
                  CustomPrimaryAppBar(
                    title: 'Messages',
                    showTrailing: true,
                    isBackButtonVisible: false,
                  ),

                  ChatListsWidget(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
