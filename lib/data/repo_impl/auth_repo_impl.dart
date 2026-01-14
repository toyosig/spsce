import 'package:circ/core/constant/global.dart';
import 'package:circ/data/data_sources/remote/auth_rds.dart';
import 'package:circ/data/models/auth/login_response.dart';
import 'package:circ/data/models/auth/password_reset_response.dart';
import 'package:circ/data/models/auth/refresh_token_response_model.dart';
import 'package:circ/data/models/auth/register_request_model.dart';
import 'package:circ/data/models/settings/settings_model.dart';
import 'package:circ/data/models/auth/logout_response_model.dart';
import 'package:circ/domain/repository/auth_repositry.dart';
import 'package:circ/data/models/auth/social_login_request.dart';
import 'package:circ/utils/helpers/custom_http_exceptions.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource = getIt
      .get<AuthRemoteDataSource>();

  @override
  Future<AuthResponse> logIn({
    required String email,
    required String password,
  }) {
    try {
      return _authRemoteDataSource.logInRds(email, password);
    } catch (error) {
      throw CustomHTTPException(error.toString());
    }
  }

  @override
  Future<AuthResponse> register({required RegisterRequestModel req}) {
    try {
      return _authRemoteDataSource.registerRds(req);
    } catch (error) {
      throw CustomHTTPException(error.toString());
    }
  }

  @override
  Future<SettingsResponse> getEnv() {
    try {
      return _authRemoteDataSource.getEnv();
    } catch (error) {
      throw CustomHTTPException(error.toString());
    }
  }

  @override
  Future<PasswordResetResponse> sendPasswordResetCode({required String email}) {
    try {
      return _authRemoteDataSource.sendPasswordResetCode(email);
    } catch (error) {
      throw CustomHTTPException(error.toString());
    }
  }

  @override
  Future<PasswordResetResponse> resetPassword({
    required String email,
    required String code,
    required String newPassword,
  }) {
    try {
      return _authRemoteDataSource.resetPasswordRds(
        email: email,
        code: code,
        newPassword: newPassword,
      );
    } catch (error) {
      throw CustomHTTPException(error.toString());
    }
  }

  @override
  Future<PasswordResetResponse> verifyEmail({
    required String email,
    required String code,
  }) {
    try {
      return _authRemoteDataSource.verifyEmailRds(email: email, code: code);
    } catch (error) {
      throw CustomHTTPException(error.toString());
    }
  }

  @override
  Future<PasswordResetResponse> resendVerificationEmailOtp({
    required String email,
  }) {
    try {
      return _authRemoteDataSource.resendVerificationEmailOtp(email: email);
    } catch (error) {
      throw CustomHTTPException(error.toString());
    }
  }

  @override
  Future<AuthResponse> socialLogin(SocialLoginRequest request) {
    try {
      return _authRemoteDataSource.socialLogin(request);
    } catch (error) {
      throw CustomHTTPException(error.toString());
    }
  }

  @override
  Future<AuthResponse> guestLogin({
    required String deviceId,
    required String deviceType,
    required String userAgent,
  }) {
    try {
      return _authRemoteDataSource.guestLoginRds(
        deviceId: deviceId,
        deviceType: deviceType,
        userAgent: userAgent,
      );
    } catch (error) {
      throw CustomHTTPException(error.toString());
    }
  }

  @override
  Future<RefreshTokenResponseModel> refreshToken({
    required String refreshToken,
  }) {
    try {
      return _authRemoteDataSource.refreshTokenRds(refreshToken);
    } catch (error) {
      throw CustomHTTPException(error.toString());
    }
  }

  @override
  Future<LogoutResponseModel> logout() {
    try {
      return _authRemoteDataSource.logoutRds();
    } catch (error) {
      throw CustomHTTPException(error.toString());
    }
  }
}
