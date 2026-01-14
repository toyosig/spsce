// ignore_for_file: use_build_context_synchronously
import 'dart:async';
import 'package:circ/core/constant/global.dart';
import 'package:circ/core/constant/keys/secure_stoarage.dart';
import 'package:circ/data/models/auth/login_response.dart';
import 'package:circ/data/models/auth/register_request_model.dart';
import 'package:circ/data/models/settings/settings_model.dart';
import 'package:circ/domain/repository/auth_repositry.dart';
import 'package:circ/domain/services/secure_storage_services.dart';
import 'package:circ/domain/services/socket_services.dart';
import 'package:circ/presentation/feature/auth/widgets/password_success_sheet.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/utils/helpers/custom_http_exceptions.dart';
import 'package:circ/utils/helpers/loading_helpers.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../data/models/auth/auth_user_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:circ/domain/services/firebase_social_login_service.dart';
import 'package:circ/data/models/auth/social_login_request.dart';
import 'package:circ/domain/services/app_services.dart';

import '../../../../utils/helpers/device_helper.dart';

class AuthViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController resetCodeController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  final TextEditingController emailVerificationCodeController =
      TextEditingController();

  final PageController pageController = PageController();

  AuthUserModel? user;
  SettingsResponse? settingsResponse;

  int currentStep = 1;
  DateTime? dob;

  String selectedGender = 'Male';

  String? verificationId;
  String? error;
  String _state = '';
  String _area = '';
  bool _rememberMe = false;
  bool _tcAccepted = false;
  bool _isOtpSent = false;
  bool _isLoading = false;
  bool _isObscureText = true;
  bool _isConfirmObscureText = true;
  bool _isNewPasswordObscureText = true;
  bool _isConfirmNewPasswordObscureText = true;
  bool _isResetCodeSent = false;
  bool _isEmailVerificationSent = false;
  String? _pendingVerificationEmail;
  Timer? _resendCodeTimer;
  int _resendCooldownSeconds = 0;

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();

  String get state => _state;
  String get area => _area;

  bool get isLoading => _isLoading;
  bool get isOtpSent => _isOtpSent;
  bool get isObscureText => _isObscureText;
  bool get isConfirmObscureText => _isConfirmObscureText;
  bool get isNewPasswordObscureText => _isNewPasswordObscureText;
  bool get isConfirmNewPasswordObscureText => _isConfirmNewPasswordObscureText;
  bool get isResetCodeSent => _isResetCodeSent;
  bool get isEmailVerificationSent => _isEmailVerificationSent;
  String? get pendingVerificationEmail => _pendingVerificationEmail;
  int get resendCooldownSeconds => _resendCooldownSeconds;
  bool get isResendEnabled => _resendCooldownSeconds == 0;
  bool get rememberMe => _rememberMe;
  bool get tcAccepted => _tcAccepted;

  final AuthRepository _repository = getIt.get<AuthRepository>();
  final FirebaseSocialLoginService _firebaseSocialLoginService =
      FirebaseSocialLoginService();

  bool _isSocialLoading = false;
  String? _socialError;
  bool get isSocialLoading => _isSocialLoading;
  String? get socialError => _socialError;

  ///************************************************setters************************************************************ */

  void setCurrentState(String state) {
    _state = state;
    _area = ''; // Clear area when state changes
    notifyListeners();
  }

  void setCurrentArea(String area) {
    _area = area;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // void setCurrentState(String state) {
  //   _state = state;
  //   notifyListeners();
  // }

  void setGender(String gender) {
    selectedGender = gender;
    notifyListeners();
  }

  void backStep() {
    if (currentStep > 1) {
      currentStep--;
      notifyListeners();
    }
  }

  void toggleObscureText() {
    _isObscureText = !_isObscureText;
    notifyListeners();
  }

  void setRememberMe(bool value) async {
    _rememberMe = value;
    await SecureStorageService.saveRememberme(value.toString());
    notifyListeners();
  }

  void setTermConditions(bool value) async {
    _tcAccepted = value;
    notifyListeners();
  }

  void toggleConfirmObscureText() {
    _isConfirmObscureText = !_isConfirmObscureText;
    notifyListeners();
  }

  void toggleNewPasswordObscureText() {
    _isNewPasswordObscureText = !_isNewPasswordObscureText;
    notifyListeners();
  }

  void toggleConfirmNewPasswordObscureText() {
    _isConfirmNewPasswordObscureText = !_isConfirmNewPasswordObscureText;
    notifyListeners();
  }

  void setOtpSent(bool value) {
    _isOtpSent = value;
    notifyListeners();
  }

  void startResendCooldown(int seconds) {
    _resendCooldownSeconds = seconds;
    notifyListeners();
    _resendCodeTimer?.cancel();
    _resendCodeTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_resendCooldownSeconds > 0) {
        _resendCooldownSeconds--;
        notifyListeners();
      } else {
        _resendCodeTimer?.cancel();
      }
    });
  }

  void setControllers() async {
    final isRemember = await SecureStorageService.get(
      SecureStorageKeys.rememberMe,
    );
    if (isRemember == 'true') {
      final email = await SecureStorageService.get(SecureStorageKeys.email);
      final password = await SecureStorageService.get(
        SecureStorageKeys.password,
      );
      emailController.text = email ?? "";
      passwordController.text = password ?? "";
      setRememberMe(true);
    }
  }

  void setResetCodeSent(bool value) {
    _isResetCodeSent = value;
    notifyListeners();
  }

  void setEmailVerificationSent(bool value) {
    _isEmailVerificationSent = value;
    notifyListeners();
  }

  void setUser(AuthUserModel user) {
    this.user = user;
    notifyListeners();
  }

  void saveLoginPassword(String username, String password) async {
    await SecureStorageService.saveLoginPassword(username, password);
  }

  void deleteLocalVeriables() async {
    await SecureStorageService.delete(SecureStorageKeys.email);
    await SecureStorageService.delete(SecureStorageKeys.password);
    await SecureStorageService.saveRememberme("false");
  }

  Future<void> saveUser(AuthResponse loginResponse) async {
    await SecureStorageService.saveUser(loginResponse);
  }

  ///*************************************************Auth Functions************************************************************ */

  Future<void> login(BuildContext context) async {
    setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      if (rememberMe == true) {
        saveLoginPassword(emailController.text, passwordController.text);
      } else {
        deleteLocalVeriables();
      }
      final result = await _repository.logIn(
        email: emailController.text,
        password: passwordController.text,
      );
      if (checkAuthResponseValid(result)) {
        if (result.user!.isVerified == false) {
          _pendingVerificationEmail = emailController.text;
          reSendVerifyEmailOtp(context);
          context.push('/email-verification');
        } else {
          // setUser(result.user!);
          // await saveUser(result);
          // if (!context.mounted) return;
          setUser(result.user!);
          await saveUser(result);
          // FIX: Explicitly save the accessToken for the network layer to pick up
          if (result.accessToken != null) {
            await SecureStorageService.saveToken(result.accessToken!);
          }
          if (!context.mounted) return;
          await getIt.get<ProfileViewModel>().getUserProfile();
          await getIt.get<SocketService>().initSocketConnection();
          MessageHelper.showSuccessMessage(context, result.message ?? "");
          context.go('/navbar');
        }
        emailController.clear();
        passwordController.clear();
        _rememberMe = false;
      }
    } catch (e) {
      MessageHelper.showErrorMessage(context, e.toString());
    } finally {
      setLoading(false);
      LoadingHelper.hideLoading(context);
      notifyListeners();
    }
  }

  Future<void> register(BuildContext context) async {
    setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      final email = emailController.text;
      final req = RegisterRequestModel(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        fullName: nameController.text.trim(),
        dateOfBirth: dob,
        gender: selectedGender,
        location: area,
        username: usernameController.text.trim(),
      );
      final result = await _repository.register(req: req);
      if (!context.mounted) return;
      _pendingVerificationEmail = email;
      setResetCodeSent(true);
      setEmailVerificationSent(true);
      startResendCooldown(300);
      clear();
      context.push('/email-verification');
      MessageHelper.showSuccessMessage(context, result.message.toString());
    } catch (e) {
      MessageHelper.showErrorMessage(context, e.toString());
    } finally {
      setLoading(false);
      LoadingHelper.hideLoading(context);
    }
  }

  //verifyEmail
  Future<void> verifyEmail(BuildContext context) async {
    if (isResendEnabled) {
      MessageHelper.showErrorMessage(
        context,
        "Please Resend the Varification code.",
      );
      return;
    }
    setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      if (_pendingVerificationEmail == null) {
        MessageHelper.showErrorMessage(context, "No email to verify");
        return;
      }

      final result = await _repository.verifyEmail(
        email: _pendingVerificationEmail!,
        code: emailVerificationCodeController.text,
      );

      if (result.success == true) {
        MessageHelper.showSuccessMessage(
          context,
          result.message ?? "Email verified successfully!",
        );
        clearEmailVerificationFields();
        startResendCooldown(300);
        context.go('/login');
      } else {
        MessageHelper.showErrorMessage(
          context,
          result.message ?? "Failed to verify email.",
        );
      }
    } catch (e) {
      MessageHelper.showErrorMessage(context, e.toString());
    } finally {
      setLoading(false);
      LoadingHelper.hideLoading(context);
    }
  }

  //resend verify email code
  Future<void> reSendVerifyEmailOtp(BuildContext context) async {
    setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      if (_pendingVerificationEmail == null) {
        throw Exception("No email to verify");
      }
      final result = await _repository.resendVerificationEmailOtp(
        email: _pendingVerificationEmail ?? "",
      );
      if (result.success == true) {
        setResetCodeSent(true);
        MessageHelper.showSuccessMessage(
          context,
          result.message ?? "Successfully send Email Varification Code",
        );
        setEmailVerificationSent(true);
        startResendCooldown(300);
      } else {
        throw Exception(result.message ?? "Failed to send Verification code.");
      }
    } catch (e) {
      MessageHelper.showErrorMessage(context, e.toString());
    } finally {
      setLoading(false);
      LoadingHelper.hideLoading(context);
    }
  }

  //send and resend password reset code
  Future<bool> sendPasswordResetCode(BuildContext context) async {
    setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      final result = await _repository.sendPasswordResetCode(
        email: emailController.text.trim(),
      );
      if (result.success == true) {
        setResetCodeSent(true);
        MessageHelper.showSuccessMessage(
          context,
          result.message ?? "Password reset code sent to your email.",
        );
        _pendingVerificationEmail = emailController.text.trim();
        setEmailVerificationSent(true);
        startResendCooldown(300);
        clearResetFields();
        return true;
      } else {
        throw Exception(result.message ?? "Failed to send Otp");
      }
    } catch (e) {
      MessageHelper.showErrorMessage(context, e.toString());
      return false;
    } finally {
      setLoading(false);
      LoadingHelper.hideLoading(context);
    }
  }

  //reset new password
  Future<void> resetPassword(
    BuildContext context,
    String email,
    String code,
    String newPassword,
  ) async {
    setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      if (!isNewPasswordMatch(context)) return;

      final result = await _repository.resetPassword(
        email: email,
        code: code,
        newPassword: newPassword,
      );

      if (result.success == true) {
        clearResetFields();
        LoadingHelper.hideLoading(context);
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => PasswordUpdatedBottomSheet(
            onBackToLogin: () {
              Navigator.pop(context);
              context.go('/login');
            },
          ),
        );
      } else {
        throw Exception(result.message ?? "Failed to reset password.");
      }
    } catch (e) {
      MessageHelper.showErrorMessage(context, e.toString());
    } finally {
      setLoading(false);
      LoadingHelper.hideLoading(context);
    }
  }

  Future<void> logout(BuildContext context) async {
    LoadingHelper.showLoading(context);
    try {
      final logoutResponse = await _repository.logout();
      if (logoutResponse.success == true) {
        await AppServices.handleGlobalLogout(context);
        MessageHelper.showSuccessMessage(
          context,
          logoutResponse.message ?? "Logout successful",
        );
      } else {
        MessageHelper.showErrorMessage(
          context,
          logoutResponse.message ?? "Logout failed",
        );
      }
    } catch (e) {
      await AppServices.handleGlobalLogout(context);
      MessageHelper.showErrorMessage(
        context,
        "Logout completed locally due to network error",
      );
    } finally {
      LoadingHelper.hideLoading(context);
      notifyListeners();
    }
  }

  Future<void> getEnv(BuildContext context) async {
    LoadingHelper.showLoading(context);
    try {
      final response = await _repository.getEnv();
      settingsResponse = response;
    } catch (e) {
      debugPrint("Error while getting env: ${e.toString()}");
    } finally {
      LoadingHelper.hideLoading(context);
      notifyListeners();
    }
  }

  ///*************************************************Utility Functions************************************************************ */

  bool isPasswordMatch(BuildContext context) {
    if (passwordController.text == confirmPasswordController.text) {
      return true;
    } else {
      MessageHelper.showErrorMessage(context, "Password does not match");
      return false;
    }
  }

  bool isNewPasswordMatch(BuildContext context) {
    if (newPasswordController.text == confirmNewPasswordController.text) {
      return true;
    } else {
      MessageHelper.showErrorMessage(context, "Passwords does not match");
      return false;
    }
  }

  bool checkAuthResponseValid(AuthResponse? model) {
    if (model != null &&
        model.success == true &&
        model.accessToken != null &&
        model.user != null) {
      return true;
    }
    throw CustomHTTPException("${model?.message} ${model?.error}");
  }

  clear() {
    confirmPasswordController.clear();
    nameController.clear();
    phonenumberController.clear();
    dobController.clear();
    dob = null;
    _state = "";
    usernameController.clear();
    setRememberMe(false);
    setTermConditions(false);
    hideKeyboard();
  }

  clearResetFields() {
    resetCodeController.clear();
    newPasswordController.clear();
    confirmNewPasswordController.clear();
    otpController.clear();
    emailVerificationCodeController.clear();
    setResetCodeSent(false);
  }

  clearEmailVerificationFields() {
    emailVerificationCodeController.clear();
    setEmailVerificationSent(false);
    _pendingVerificationEmail = null;
  }

  hideKeyboard() {
    emailFocusNode.unfocus();
    passwordFocusNode.unfocus();
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    LoadingHelper.showLoading(context);
    if (_isSocialLoading) return;
    _isSocialLoading = true;
    _socialError = null;
    notifyListeners();
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken() ?? '';
      final googleData = await _firebaseSocialLoginService.signInWithGoogle();

      final request = SocialLoginRequest(
        provider: 'google',
        providerId: googleData['providerId'] ?? '',
        email: googleData['email'] ?? '',
        fullName: googleData['fullName'] ?? '',
        username: googleData['username'] ?? '',
        profilePic: googleData['profilePic'] ?? '',
        fcmToken: fcmToken,
        dateOfBirth:
            (googleData['dateOfBirth'] != null &&
                googleData['dateOfBirth'].isNotEmpty)
            ? googleData['dateOfBirth']
            : null, // omit if not available
      );
      final response = await _repository.socialLogin(request);
      await saveUser(response);
      if (!context.mounted) return;
      await getIt.get<ProfileViewModel>().getUserProfile();
      await getIt.get<SocketService>().initSocketConnection();
      context.go('/navbar');
      MessageHelper.showSuccessMessage(context, response.message ?? "");
      clear();
    } catch (e) {
      _socialError = e.toString();
      MessageHelper.showErrorMessage(
        context,
        _socialError ?? 'Google sign-in failed',
      );
    } finally {
      LoadingHelper.hideLoading(context);
      _isSocialLoading = false;
      notifyListeners();
    }
  }

  Future<void> signInWithApple(BuildContext context) async {
    LoadingHelper.showLoading(context);
    if (_isSocialLoading) return;
    _isSocialLoading = true;
    _socialError = null;
    notifyListeners();
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken() ?? '';
      final appleData = await _firebaseSocialLoginService.signInWithApple();
      final request = SocialLoginRequest(
        provider: 'apple',
        providerId: appleData['providerId'],
        email: appleData['email'],
        fullName: appleData['fullName'],
        profilePic: appleData['profilePic'],
        fcmToken: fcmToken,
      );
      final response = await _repository.socialLogin(request);
      await saveUser(response);
      if (!context.mounted) return;
      await getIt.get<ProfileViewModel>().getUserProfile();
      await getIt.get<SocketService>().initSocketConnection();
      // Only navigate if not already on /navbar
      if (context.mounted &&
          GoRouterState.of(context).uri.toString() != '/navbar') {
        context.go('/navbar');
      }
      MessageHelper.showSuccessMessage(context, response.message ?? "");
      clear();
    } catch (e) {
      _socialError = e.toString();
      MessageHelper.showErrorMessage(
        context,
        _socialError ?? 'Apple sign-in failed',
      );
    } finally {
      LoadingHelper.hideLoading(context);
      _isSocialLoading = false;
      notifyListeners();
    }
  }

  Future<void> loginAsGuest(BuildContext context) async {
    setLoading(true);
    LoadingHelper.showLoading(context);
    try {
      final data = await DeviceHelper.getGuestLoginMeta();
      final result = await _repository.guestLogin(
        deviceId: data['deviceId'] ?? '',
        deviceType: data['deviceType'] ?? '',
        userAgent: data['userAgent'] ?? '',
      );
      if (result.accessToken != null && result.accessToken!.isNotEmpty) {
        await SecureStorageService.saveToken(result.accessToken!);
        if (!context.mounted) return;
        context.go('/navbar');
        MessageHelper.showSuccessMessage(
          context,
          result.message ?? "Guest login successful",
        );
      } else {
        MessageHelper.showErrorMessage(
          context,
          result.message ?? "Guest login failed",
        );
      }
    } catch (e) {
      MessageHelper.showErrorMessage(context, e.toString());
    } finally {
      setLoading(false);
      LoadingHelper.hideLoading(context);
      notifyListeners();
    }
  }
}
