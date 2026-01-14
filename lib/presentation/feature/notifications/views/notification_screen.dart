import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/presentation/feature/notifications/widgets/notification_list.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/custom_primary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  ProfileViewModel? profileViewModel;

  @override
  void initState() {
    super.initState();
    profileViewModel = getIt.get<ProfileViewModel>();
    // profileViewModel?.getAllNotifications(isRefresh: true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // profileViewModel?.markAllNotificationsAsRead();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Consumer<ProfileViewModel>(
        builder: (context, viewModel, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                CustomPrimaryAppBar(
                  title: 'Notifications',
                  showTrailing: false,
                  notiNumber: viewModel.notifications
                      .where((n) => !(n.isRead ?? false))
                      .length,
                  isBackButtonVisible: true,
                  showPopupMenu: true,
                  isMarkingAllAsRead: viewModel.isMarkingAllAsRead,
                  hasUnreadNotifications: viewModel.notifications
                      .where((n) => !(n.isRead ?? false))
                      .isNotEmpty,
                  onPopupMenuSelected: (value) {
                    if (value == 'mark_all_read') {
                      viewModel.markAllNotificationsAsRead();
                    }
                  },
                ),
                NotificationList(),
              ],
            ),
          );
        },
      ),
    );
  }
}
