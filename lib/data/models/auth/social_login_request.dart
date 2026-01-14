import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_login_request.freezed.dart';
part 'social_login_request.g.dart';

@freezed
abstract class SocialLoginRequest with _$SocialLoginRequest {
  const factory SocialLoginRequest({
    required String provider, // 'google', 'apple', etc.
    required String providerId,
    required String email,
    String? fullName,
    String? username,
    String? profilePic,
    String? dateOfBirth,
    // String? idToken, // optional for backend
    required String fcmToken,
  }) = _SocialLoginRequest;

  factory SocialLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$SocialLoginRequestFromJson(json);
}
