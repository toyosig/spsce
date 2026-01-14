import 'dart:developer';
import 'package:circ/data/models/auth/login_response.dart';
import 'package:circ/data/models/auth/refresh_token_response_model.dart';
import 'package:circ/domain/repository/auth_repositry.dart';
import 'package:circ/domain/services/secure_storage_services.dart';

class TokenExpirationService {
  /// Attempt to refresh the access token
  static Future<RefreshTokenResponseModel?> refreshAccessToken(
    AuthRepository authRepository,
    AuthResponse user,
  ) async {
    try {
      // Check if user has a refresh token
      if (user.refreshToken == null || user.refreshToken!.isEmpty) {
        log('No refresh token available');
        return null;
      }

      // Attempt to refresh the token
      final response = await authRepository.refreshToken(
        refreshToken: user.refreshToken!,
      );

      if (response.success == true && response.accessToken != null) {
        // Update the stored user data with new tokens
        final updatedUser = user.copyWith(
          accessToken: response.accessToken,
          refreshToken: response.refreshToken,
          expiresIn: response.expiresIn,
        );

        await SecureStorageService.saveUser(updatedUser);
        log('Token refreshed successfully');
        return response;
      } else {
        return null;
      }
    } catch (e) {
      log('Error refreshing token: $e');
      return null;
    }
  }
}
