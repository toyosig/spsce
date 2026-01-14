import 'dart:convert';
import 'dart:developer';
import 'package:circ/core/constant/keys/secure_stoarage.dart';
import 'package:circ/data/models/auth/login_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

class SecureStorageService {
  const SecureStorageService._();
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static const _tokenKey = 'accessToken';

  static Future<String?> get(String key) async {
    try {
      final value = await _secureStorage.read(key: key);
      return value;
    } on Exception catch (e) {
      log('Error encountered $e');
      return null;
    }
  }

  static Future<void> saveUser(AuthResponse loginResponse) async {
    final jsonString = jsonEncode(loginResponse.toJson());

    await _secureStorage.write(
      key: SecureStorageKeys.userKey,
      value: jsonString,
    );
  }

  static Future<void> saveRememberme(String value) async {
    await _secureStorage.write(key: SecureStorageKeys.rememberMe, value: value);
  }

  static Future<void> saveLoginPassword(String email, String password) async {
    await _secureStorage.write(key: SecureStorageKeys.email, value: email);
    await _secureStorage.write(
      key: SecureStorageKeys.password,
      value: password,
    );
  }

  static Future<AuthResponse?> getUser() async {
    final jsonString = await get(SecureStorageKeys.userKey);
    if (jsonString == null) return null;
    return AuthResponse.fromJson(jsonDecode(jsonString));
  }

  static Future<void> save(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  static Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }

  static Future<void> deleteUser() async {
    await _secureStorage.delete(key: SecureStorageKeys.userKey);
  }

  static Future<void> clearAll() async {
    // Keys to keep
    const keysToKeep = [
      SecureStorageKeys.rememberMe,
      SecureStorageKeys.email,
      SecureStorageKeys.password,
    ];
    // Get all keys
    final allKeys = await _secureStorage.readAll();
    for (final key in allKeys.keys) {
      if (!keysToKeep.contains(key)) {
        await _secureStorage.delete(key: key);
      }
    }
  }

  static Future<String?> getToken() async {
    final storage = FlutterSecureStorage();
    return await storage.read(key: _tokenKey);
  }

  static Future<void> saveToken(String token) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: _tokenKey, value: token);
  }

  static Future<void> clearToken() async {
    final storage = FlutterSecureStorage();
    await storage.delete(key: _tokenKey);
  }

  static Future<bool> isGuestUser() async {
    try {
      final token = await getToken();
      if (token == null) return false;
      final payload = Jwt.parseJwt(token);
      return payload['type'] == 'guest';
    } catch (e) {
      return false;
    }
  }
}
