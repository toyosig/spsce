// lib/data/models/auth/login_response.dart
import 'package:circ/data/models/auth/auth_user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
abstract class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    String? accessToken,
    String? message,
    String? error,
    int? statusCode,
    bool? success,
    String? refreshToken,
    int? expiresIn,
    AuthUserModel? user,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}
