import 'package:circ/core/constant/global.dart';
import 'package:circ/core/widgets/no_results_found.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'notification_tile.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({super.key});

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  ScrollController scrollController = ScrollController();

  @override
  initState() {
    super.initState();
    if (!scrollController.hasClients) {
      scrollController.addListener(_onScroll);
    }
  }

  bool get _isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentPosition = scrollController.position.pixels;
    return currentPosition >= maxScroll;
  }

  void _onScroll() {
    if (_isBottom) {
      getIt.get<ProfileViewModel>().getAllNotifications(isLoadMore: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
      builder: (context, viewModel, _) {
        return Expanded(
          child: RefreshIndicator(
            color: AppColors.primaryColor,
            elevation: 5,
            backgroundColor: Colors.white,
            strokeWidth: 2,
            onRefresh: () => viewModel.getAllNotifications(isRefresh: true),
            child: Builder(
              builder: (context) {
                if (viewModel.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  );
                }
                if (viewModel.notifications.isEmpty) {
                  return Center(child: NoResultsFound());
                }
                final groupedNotifications = _groupNotificationsByDate(
                  viewModel.notifications,
                );
                final sortedDates = groupedNotifications.keys.toList()
                  ..sort((a, b) {
                    // Sort dates in descending order (most recent first)
                    final dateA = _getDateFromKey(a);
                    final dateB = _getDateFromKey(b);
                    return dateB.compareTo(dateA);
                  });

                return ListView.builder(
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: viewModel.hasMoreNotifications
                      ? _getTotalItems(groupedNotifications, sortedDates) + 1
                      : _getTotalItems(groupedNotifications, sortedDates),
                  itemBuilder: (BuildContext context, int index) {
                    if (index >=
                        _getTotalItems(groupedNotifications, sortedDates)) {
                      return _buildBottomLoader(viewModel);
                    }

                    final itemIndex = _getItemIndex(
                      index,
                      groupedNotifications,
                      sortedDates,
                    );
                    if (itemIndex.isHeader) {
                      // Show date header
                      return _buildDateHeader(
                        sortedDates[itemIndex.headerIndex],
                      );
                    } else {
                      // Show notification tile
                      final dateKey = sortedDates[itemIndex.headerIndex];
                      final notification =
                          groupedNotifications[dateKey]![itemIndex.itemIndex];
                      return NotificationTile(
                        title: notification.title ?? "",
                        message: notification.body ?? "",
                        date: notification.createdAt != null
                            ? _formatTime(notification.createdAt!)
                            : "",
                        isRead: notification.isRead ?? false,
                        onTap:  () async  {
                          if (viewModel.isLoading) return;
                          {
                                final notificationId = notification.id;
                          if (notificationId != null &&
                              !(notification.isRead ?? false)) {
                            await viewModel.markNotificationAsRead(
                              notificationId: notificationId,
                            );
                          }

                          // Handle navigation based on notification type
                          final data = notification.data;
                          final type = data?.type?.toLowerCase();

                          if (type == "new-offer" && data != null) {
                            // Navigate to offer/conversation screen
                            final conversationId = data
                                .toJson()['conversationId'];
                            if (conversationId != null && context.mounted) {
                              context.push(
                                '/chatInbox',
                                extra: {
                                  "other_user_id": data.toJson()['senderId'],
                                  "name": data.toJson()['senderUsername'],
                                  "imagePath": data
                                      .toJson()['senderProfilePic'],
                                },
                              );
                            }
                          } else if (type == "counter-offer" && data != null) {
                            // Handle counter-offer type (same as new-offer)
                            final conversationId = data
                                .toJson()['conversationId'];
                            if (conversationId != null && context.mounted) {
                              context.push(
                                '/chatInbox',
                                extra: {
                                  "other_user_id": data.toJson()['senderId'],
                                  "name": data.toJson()['senderUsername'],
                                  "imagePath": data
                                      .toJson()['senderProfilePic'],
                                },
                              );
                            }
                          } else if (type == "message" && data != null) {
                            final conversationId = data
                                .toJson()['conversationId'];
                            if (conversationId != null && context.mounted) {
                              context.push(
                                '/chatInbox',
                                extra: {
                                  "other_user_id": data.toJson()['senderId'],
                                  "name": data.toJson()['senderUsername'],
                                  "imagePath": data
                                      .toJson()['senderProfilePic'],
                                },
                              );
                            }
                          } else if (type == "product_like" && data != null) {
                            final productId = data.toJson()['productId'];
                            if (productId != null && context.mounted) {
                              context.push('/detail', extra: {'id': productId});
                            }
                          } else if (type == "new_follower" && data != null) {
                            final followerId = data.toJson()['followerId'];
                            if (followerId != null && context.mounted) {
                              context.push('/othersProfile', extra: followerId);
                            }
                          }
                          // Add more types as needed
                        
                          }
                      },
                      );
                    }
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomLoader(ProfileViewModel provider) {
    if (provider.isLoadingMore) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: const Center(
          child: CircularProgressIndicator(color: AppColors.primaryColor),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}

String _formatDateForGrouping(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));
  final notificationDate = DateTime(date.year, date.month, date.day);

  if (notificationDate == today) {
    return 'Today';
  } else if (notificationDate == yesterday) {
    return 'Yesterday';
  } else {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${date.day.toString().padLeft(2, '0')} ${months[date.month - 1]} ${date.year}';
  }
}

String _formatTime(DateTime date) {
  final hour = date.hour;
  final minute = date.minute;
  final period = hour >= 12 ? 'PM' : 'AM';
  final displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
  final displayMinute = minute.toString().padLeft(2, '0');
  return '$displayHour:$displayMinute $period';
}

Map<String, List<dynamic>> _groupNotificationsByDate(List notifications) {
  final Map<String, List<dynamic>> groupedNotifications = {};

  for (final notification in notifications) {
    if (notification.createdAt != null) {
      final dateKey = _formatDateForGrouping(notification.createdAt!);
      if (!groupedNotifications.containsKey(dateKey)) {
        groupedNotifications[dateKey] = [];
      }
      groupedNotifications[dateKey]!.add(notification);
    }
  }

  return groupedNotifications;
}

DateTime _getDateFromKey(String dateKey) {
  final now = DateTime.now();

  if (dateKey == 'Today') {
    return DateTime(now.year, now.month, now.day);
  } else if (dateKey == 'Yesterday') {
    return DateTime(now.year, now.month, now.day - 1);
  } else {
    // Parse date like "02 March 2025"
    final parts = dateKey.split(' ');
    if (parts.length >= 3) {
      final months = [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December',
      ];
      final day = int.tryParse(parts[0]) ?? 1;
      final monthIndex = months.indexOf(parts[1]) + 1;
      final year = int.tryParse(parts[2]) ?? now.year;
      return DateTime(year, monthIndex, day);
    }
  }
  return now;
}

int _getTotalItems(
  Map<String, List<dynamic>> groupedNotifications,
  List<String> sortedDates,
) {
  int total = 0;
  for (final date in sortedDates) {
    total += 1; // Header
    total += groupedNotifications[date]!.length; // Items
  }
  return total;
}

class _ItemIndex {
  final bool isHeader;
  final int headerIndex;
  final int itemIndex;

  _ItemIndex({
    required this.isHeader,
    required this.headerIndex,
    required this.itemIndex,
  });
}

_ItemIndex _getItemIndex(
  int index,
  Map<String, List<dynamic>> groupedNotifications,
  List<String> sortedDates,
) {
  int currentIndex = 0;

  for (int i = 0; i < sortedDates.length; i++) {
    final date = sortedDates[i];
    final itemsInGroup = groupedNotifications[date]!.length;

    // Check if this is the header
    if (currentIndex == index) {
      return _ItemIndex(isHeader: true, headerIndex: i, itemIndex: 0);
    }

    // Check if this is an item in the group
    if (index > currentIndex && index <= currentIndex + itemsInGroup) {
      return _ItemIndex(
        isHeader: false,
        headerIndex: i,
        itemIndex: index - currentIndex - 1,
      );
    }

    currentIndex += 1 + itemsInGroup; // Header + items
  }

  return _ItemIndex(isHeader: false, headerIndex: 0, itemIndex: 0);
}

Widget _buildDateHeader(String dateKey) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    child: Text(
      dateKey,
      style: const TextStyle(
        color: AppColors.grey,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
