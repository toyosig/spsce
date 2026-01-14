import 'dart:developer';
import 'dart:io';
import 'package:circ/core/constant/api_endpoints.dart';
import 'package:circ/core/networks/api_client.dart';
import 'package:circ/data/models/auth/login_response.dart';
import 'package:circ/data/models/auth/password_reset_response.dart';
import 'package:circ/data/models/auth/refresh_token_response_model.dart';
import 'package:circ/data/models/auth/register_request_model.dart';
import 'package:circ/data/models/settings/settings_model.dart';
import 'package:circ/data/models/auth/logout_response_model.dart';
import 'package:circ/utils/helpers/custom_http_exceptions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:circ/data/models/auth/social_login_request.dart';

class AuthRemoteDataSource {
  final ApiClient apiClient = ApiClient(ApiPath.baseUrl);

  Future<AuthResponse> registerRds(RegisterRequestModel req) async {
    try {
      log('ApiPath.register: ${ApiPath.register}');
      final response = await apiClient.post(
        endpoint: ApiPath.register,
        data: req.toJson(),
      );
      final data = AuthResponse.fromJson(response.data);
      if (data.success == true) {
        return data;
      } else {
        return throw CustomHTTPException(data.message ?? "Registration Failed");
      }
    } catch (error) {
      throw CustomHTTPException(error.toString());
    }
  }

  // Future<AuthResponse> logInRds(String email, String password) async {
  //   try {
  //     String fcmToken = '';
  //     if (Platform.isAndroid) {
  //       fcmToken = await FirebaseMessaging.instance.getToken() ?? '';
  //     }
  //     final response = await apiClient.post(
  //       endpoint: ApiPath.login,
  //       data: {'identifier': email, 'password': password, 'fcmToken': fcmToken},
  //     );
  //
  //     return AuthResponse.fromJson(response.data);
  //   } catch (error) {
  //     throw Exception(error.toString());
  //   }
  // }
  Future<AuthResponse> logInRds(String email, String password) async {
    try {
      String fcmToken = '';
      if (Platform.isAndroid) {
        fcmToken = await FirebaseMessaging.instance.getToken() ?? '';
      }
      final response = await apiClient.post(
        endpoint: ApiPath.login,
        data: {'identifier': email, 'password': password, 'fcmToken': fcmToken},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data is Map<String, dynamic>) {
          return AuthResponse.fromJson(response.data);
        } else {
          throw Exception('Invalid response format: expected JSON object, got ${response.data.runtimeType}');
        }
      } else {
        final data = response.data;

        if (data is String) {
          throw Exception(data);
        }

        if (data is Map<String, dynamic>) {
          if (data['message'] is List) {
            data['message'] = (data['message'] as List).join('\n');
          }
          throw Exception(data['message'] ?? 'Login failed');
        }

        throw Exception('Login failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }


  Future<SettingsResponse> getEnv() async {
    try {
      log('ApiPath.settings: ${ApiPath.settings}');
      final response = await apiClient.get(ApiPath.settings);

      return SettingsResponse.fromJson(response.data);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<PasswordResetResponse> sendPasswordResetCode(String email) async {
    try {
      final response = await apiClient.post(
        endpoint: ApiPath.requestPasswordReset,
        data: {'email': email},
      );
      return PasswordResetResponse.fromJson(response.data);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<PasswordResetResponse> resetPasswordRds({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    try {
      log('email: $email');
      log('code: $code');
      log('newPassword: $newPassword');
      log('ApiPath.resetPassword: ${ApiPath.resetPassword}');
      final response = await apiClient.post(
        endpoint: ApiPath.resetPassword,
        data: {'email': email, 'code': code, 'newPassword': newPassword},
      );

      return PasswordResetResponse.fromJson(response.data);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<PasswordResetResponse> verifyEmailRds({
    required String email,
    required String code,
  }) async {
    try {
      final response = await apiClient.post(
        endpoint: ApiPath.verifyEmail,
        data: {'email': email, 'code': code},
      );

      return PasswordResetResponse.fromJson(response.data);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<PasswordResetResponse> resendVerificationEmailOtp({
    required String email,
  }) async {
    try {
      final response = await apiClient.post(
        endpoint: ApiPath.resendVerificationEmailOtp,
        data: {'email': email},
      );

      return PasswordResetResponse.fromJson(response.data);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<AuthResponse> socialLogin(SocialLoginRequest request) async {
    //asad
    try {
      log(request.toJson().toString());
      final response = await apiClient.post(
        endpoint: ApiPath.socialLogin,
        data: request.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return AuthResponse.fromJson(response.data);
      } else {
        final data = response.data;
        if (data['message'] is List) {
          data['message'] = (data['message'] as List).join('\n');
        }
        throw Exception(data['message']);
      }
    } catch (error) {
      throw Exception('Error during social login: $error');
    }
  }

  Future<AuthResponse> guestLoginRds({
    required String deviceId,
    required String deviceType,
    required String userAgent,
  }) async {
    try {
      log('ApiPath.guestLogin: \\${ApiPath.guestLogin}');
      final response = await apiClient.post(
        endpoint: ApiPath.guestLogin,
        data: {
          'deviceId': deviceId,
          'deviceType': deviceType,
          'userAgent': userAgent,
        },
      );
      return AuthResponse.fromJson(response.data);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<RefreshTokenResponseModel> refreshTokenRds(String refreshToken) async {
    try {
      final response = await apiClient.post(
        endpoint: ApiPath.refresh,
        data: {'refresh_token': refreshToken},
      );
      return RefreshTokenResponseModel.fromJson(response.data);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<LogoutResponseModel> logoutRds() async {
    try {
      final response = await apiClient.post(endpoint: ApiPath.logout);
      return LogoutResponseModel.fromJson(response.data);
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
