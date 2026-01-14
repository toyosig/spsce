import 'dart:convert';
import 'dart:developer';
import 'package:circ/main.dart';
import 'package:circ/core/constant/global.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';

void handleNotificationRouting(String? payload) {
  if (payload == null) return;

  WidgetsBinding.instance.addPostFrameCallback((_) {
    try {
      final Map<String, dynamic> data = jsonDecode(payload);

      // Mark notification as read if notificationId is provided
      if (data['notificationId'] != null) {
        final profileViewModel = getIt.get<ProfileViewModel>();
        profileViewModel.markNotificationAsRead(
          notificationId: data['notificationId'],
        );
        profileViewModel.getAllNotifications(isRefresh: true);
      }

      switch (data['type']) {
        case 'NEW_FOLLOWER':
          final userId = data['followerId'];
          GoRouter.of(
            navigatorKey.currentContext!,
          ).push('/othersProfile', extra: userId);
          break;

        case 'NEW_PRODUCT':
          final productId = data['productId'];
          GoRouter.of(
            navigatorKey.currentContext!,
          ).push('/detail', extra: {'id': productId});
          break;

        case 'PRODUCT_LIKE':
          final productId = data['productId'];
          GoRouter.of(
            navigatorKey.currentContext!,
          ).push('/detail', extra: {'id': productId});
          break;

        case 'notification':
          GoRouter.of(navigatorKey.currentContext!).push('/notificationScreen');
          break;

        case 'message':
          final userId = data['senderId'];
          final name = data['senderUsername'];
          final senderProfilePic = data['senderProfilePic'];
          GoRouter.of(navigatorKey.currentContext!).push(
            '/chatInbox',
            extra: {
              "other_user_id": userId,
              "name": name,
              "imagePath": senderProfilePic,
            },
          );
          break;

        case 'new-offer':
          final userId = data['senderId'];
          final name = data['senderUsername'];
          final senderProfilePic = data['senderProfilePic'];
          GoRouter.of(navigatorKey.currentContext!).push(
            '/chatInbox',
            extra: {
              "other_user_id": userId,
              "name": name,
              "imagePath": senderProfilePic,
            },
          );
          break;

        case 'counter-offer':
          final userId = data['senderId'];
          final name = data['senderUsername'];
          final senderProfilePic = data['senderProfilePic'];
          GoRouter.of(navigatorKey.currentContext!).push(
            '/chatInbox',
            extra: {
              "other_user_id": userId,
              "name": name,
              "imagePath": senderProfilePic,
            },
          );
          break;

        case 'offer-response':
          final userId = data['senderId'];
          final name = data['senderUsername'];
          final senderProfilePic = data['senderProfilePic'];
          GoRouter.of(navigatorKey.currentContext!).push(
            '/chatInbox',
            extra: {
              "other_user_id": userId,
              "name": name,
              "imagePath": senderProfilePic,
            },
          );
          break;

        default:
          GoRouter.of(navigatorKey.currentContext!).push('/notificationScreen');
      }
    } catch (e) {
      log('❌ Error parsing notification payload: $e');
    }
  });
}
