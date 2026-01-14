import 'dart:developer';

import 'package:circ/core/constant/global.dart';
import 'package:circ/domain/services/secure_storage_services.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Import the global navigator key from main.dart
import '../../main.dart';

class AppServices {
  static Future<void> initialize() async {
    // await notificationService.initInfo();

    // final apiClient = ApiClient(ApiPath.baseUrl);
  }

  // Global logout function that can be called from anywhere
  static Future<void> handleGlobalLogout(BuildContext context) async {
    try {
      final profileViewModel = getIt.get<ProfileViewModel>();
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // Clear profile data
      profileViewModel.clearCurrUser();

      // Clear shared preferences
      await prefs.remove('saved_address');
      await prefs.remove('saved_address2');
      await prefs.remove('saved_state');
      await prefs.remove('saved_city');

      // Clear secure storage
      await SecureStorageService.clearAll();

      // Navigate to login using global navigator key
      if (context.mounted) {
        // Try to use GoRouter if available
        try {
          context.go('/login');
        } catch (e) {
          // Fallback to Navigator if GoRouter is not available
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil('/login', (route) => false);
        }
      }
    } catch (e) {
      if (context.mounted) {
        MessageHelper.showErrorMessage(context, "Error during logout: $e");
      }
    }
  }

  // Alternative logout function that doesn't require context
  static Future<void> handleGlobalLogoutWithoutContext() async {
    try {
      final profileViewModel = getIt.get<ProfileViewModel>();
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // Clear profile data
      profileViewModel.clearCurrUser();

      // Clear shared preferences
      await prefs.remove('saved_address');
      await prefs.remove('saved_address2');
      await prefs.remove('saved_state');
      await prefs.remove('saved_city');

      // Clear secure storage
      await SecureStorageService.clearAll();

      // Use global navigator key for navigation
      if (navigatorKey.currentContext != null) {
        try {
          navigatorKey.currentContext!.go('/login');
        } catch (e) {
          Navigator.of(
            navigatorKey.currentContext!,
          ).pushNamedAndRemoveUntil('/login', (route) => false);
        }
      }

      MessageHelper.showSuccessMessage(
        navigatorKey.currentContext!,
        "Session expired. Please login again.",
      );
    } catch (e) {
      log("Error during logout without context: $e");
    }
  }
}
