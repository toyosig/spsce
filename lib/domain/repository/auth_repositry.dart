// lib/domain/repository/auth_repositry.dart

import 'package:circ/data/models/auth/login_response.dart';
import 'package:circ/data/models/auth/password_reset_response.dart';
import 'package:circ/data/models/auth/register_request_model.dart';
import 'package:circ/data/models/auth/refresh_token_response_model.dart';
import 'package:circ/data/models/auth/logout_response_model.dart';
import 'package:circ/data/models/settings/settings_model.dart';
import 'package:circ/data/models/auth/social_login_request.dart';

abstract class AuthRepository {
  // Future<SignUpResponseModel> signUp(SignUpRequestModel req);
  Future<AuthResponse> logIn({required String email, required String password});
  Future<AuthResponse> register({required RegisterRequestModel req});
  Future<SettingsResponse> getEnv();
  Future<PasswordResetResponse> sendPasswordResetCode({required String email});
  Future<PasswordResetResponse> resetPassword({
    required String email,
    required String code,
    required String newPassword,
  });
  Future<PasswordResetResponse> verifyEmail({
    required String email,
    required String code,
  });
  Future<PasswordResetResponse> resendVerificationEmailOtp({
    required String email,
  });
  Future<AuthResponse> socialLogin(SocialLoginRequest request);
  Future<AuthResponse> guestLogin({
    required String deviceId,
    required String deviceType,
    required String userAgent,
  });
  Future<RefreshTokenResponseModel> refreshToken({
    required String refreshToken,
  });
  Future<LogoutResponseModel> logout();
}
