import 'dart:developer';

import 'package:circ/core/constant/global.dart';
import 'package:circ/data/repo_impl/profile_repository_imp.dart';
import 'package:circ/domain/repository/profile_repository.dart';
import 'package:circ/domain/services/secure_storage_services.dart';
import 'package:circ/domain/services/socket_services.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashService {
  ProfileRepository profileRepository = ProfileRepositoryImpl();

  Future<void> checkFirstTime(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final bool isFirstTime = prefs.getBool('is_first_time') ?? true;

    if (!context.mounted) return;

    if (isFirstTime) {
      log('First time');
      await prefs.setBool('is_first_time', false);
      if (!context.mounted) return;
      context.go('/login');
    } else {
      log('Not first time');
      checkAuthentication(context);
    }
  }

  Future<void> checkAuthentication(BuildContext context) async {
    try {
      final user = await SecureStorageService.getUser();
      if (user != null &&
          user.accessToken != null &&
          user.accessToken?.isNotEmpty == true) {
        if (context.mounted) {
          sessionValidity(context);
        }
      } else {
        // Check for guest token
        final token = await SecureStorageService.getToken();
        final isGuest = await SecureStorageService.isGuestUser();
        if (token != null && token.isNotEmpty && isGuest) {
          // Guest session: go straight to navbar, no profile/socket
          if (context.mounted) {
            context.go('/navbar');
          }
        } else {
          // Not authenticated
          if (context.mounted) {
            context.go('/login');
            log('User is not authenticated');
          }
        }
      }
    } catch (e) {
      if (context.mounted) {
        context.go('/login');
      }
    }
  }

  Future<void> sessionValidity(BuildContext context) async {
    try {
      final user = await SecureStorageService.getUser();
      if (user == null) {
        if (context.mounted) {
          context.go('/login');
        }
        return;
      }

      final response = await profileRepository.getUserProfile();
      if (response.message == "Unauthorized" || response.success == false) {
        if (context.mounted) {
          MessageHelper.showErrorMessage(
            context,
            response.message ??
                "Your session has been expired please login again.",
          );
          context.go('/login');
        }
      } else {
        await getIt.get<ProfileViewModel>().getUserProfile();
        await getIt.get<SocketService>().initSocketConnection();
        if (context.mounted) {
          context.go('/navbar');
        }
      }
    } catch (e) {
      if (context.mounted) {
        context.go('/login');
      }
    }
  }
}
