import 'dart:developer';
import 'dart:io';
import 'dart:async';
import 'package:circ/core/constant/global.dart';
import 'package:circ/data/models/auth/login_response.dart';
import 'package:circ/domain/repository/auth_repositry.dart';
import 'package:circ/domain/services/secure_storage_services.dart';
import 'package:circ/domain/services/app_services.dart';
import 'package:circ/domain/services/token_expiration_service.dart';
import 'package:circ/utils/helpers/custom_http_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ApiClient {
  final Dio _dio;
  final bool? isChange;
  // ignore: unused_field
  static BuildContext? _globalContext;

  ApiClient(String baseUrl, {this.isChange = false})
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          validateStatus: (status) {
            return status != null && status < 500;
          },
        ),
      ) {
    // Accept all certificates (for development only)
    _dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? token;
          AuthResponse? user;
          user = await SecureStorageService.getUser();

          if (user != null) {
            token = user.accessToken;
          }

          if (kDebugMode) {
            log("API Request: ${options.path}");
            log("Method: ${options.method}");
            log("Token: ${token ?? 'Not present'}");
          }

          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          } else {
            options.headers['Authorization'] = '';
          }

          return handler.next(options);
        },
        onError: (error, handler) {
          _logError(error);
          return handler.next(error);
        },
        onResponse: (response, handler) async {
          if (kDebugMode) {
            log("API Response: ${response.requestOptions.path}");
            log("Status Code: ${response.statusCode}");
            log("Response Data: ${response.data}");
          }

          if (response.statusCode == 401) {
            final retryResponse = await _handleUnauthorizedResponse(response);
            if (retryResponse != null) {
              return handler.next(retryResponse);
            }
          }

          return handler.next(response);
        },
      ),
    );
  }

  // Static method to set global context
  static void setGlobalContext(BuildContext context) {
    _globalContext = context;
  }

  // Improved error logging
  void _logError(DioException error) {
    log("API Error: ${error.type}");
    log("Endpoint: ${error.requestOptions.path}");
    log("Status Code: ${error.response?.statusCode}");
    log("Response Data: ${error.response?.data}");
    log("Error Message: ${error.message}");
  }

  /// Handle 401 Unauthorized responses by attempting token refresh
  Future<Response?> _handleUnauthorizedResponse(Response response) async {
    log("Unauthorized access detected, attempting token refresh...");

    // Skip refresh for auth endpoints to avoid infinite loops
    if (response.requestOptions.path.contains('auth/refresh') ||
        response.requestOptions.path.contains('auth/login') ||
        response.requestOptions.path.contains('auth/logout')) {
      log("Auth endpoint returned 401, redirecting to login");
      await SecureStorageService.clearAll();
      await AppServices.handleGlobalLogoutWithoutContext();
      return null;
    }

    try {
      final user = await SecureStorageService.getUser();
      if (user == null) {
        log("No user data found, redirecting to login");
        await SecureStorageService.clearAll();
        await AppServices.handleGlobalLogoutWithoutContext();
        return null;
      }

      final authRepository = getIt.get<AuthRepository>();
      final refreshResponse = await TokenExpirationService.refreshAccessToken(
        authRepository,
        user,
      );

      if (refreshResponse == null) {
        log("Token refresh failed, redirecting to login");
        await SecureStorageService.clearAll();
        await AppServices.handleGlobalLogoutWithoutContext();
        return null;
      }

      final newUser = await SecureStorageService.getUser();
      if (newUser?.accessToken == null) {
        log("Failed to get new token after refresh");
        await SecureStorageService.clearAll();
        await AppServices.handleGlobalLogoutWithoutContext();
        return null;
      }

      // Update the request headers with new token
      response.requestOptions.headers['Authorization'] =
          'Bearer ${newUser!.accessToken}';

      // Retry the request
      try {
        final retryResponse = await _dio.fetch(response.requestOptions);
        return retryResponse;
      } catch (retryError) {
        log("Retry request failed: $retryError");
        return null;
      }
    } catch (e) {
      log("Error during token refresh: $e");
      await SecureStorageService.clearAll();
      await AppServices.handleGlobalLogoutWithoutContext();
      return null;
    }
  }

  // Retry mechanism for failed requests
  Future<Response> _retryRequest(
    Future<Response> Function() request,
    int retryCount,
  ) async {
    try {
      // Check network availability before making request
      if (!await _isNetworkAvailable()) {
        throw DioException(
          requestOptions: RequestOptions(path: ''),
          type: DioExceptionType.connectionError,
          error: 'No internet, Check your internet connection',
        );
      }

      return await request();
    } on DioException catch (e) {
      if (retryCount < _maxRetries &&
          (e.type == DioExceptionType.connectionTimeout ||
              e.type == DioExceptionType.receiveTimeout ||
              e.type == DioExceptionType.connectionError)) {
        await Future.delayed(_retryDelay * (retryCount + 1));
        return _retryRequest(request, retryCount + 1);
      } else if (e.type == DioExceptionType.badResponse && e.response != null) {
        return e.response!;
      }
      return _handleError(e);
    }
  }

  // Generic GET request
  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return _retryRequest(() async {
        final response = await _dio.get(
          endpoint,
          queryParameters: queryParameters,
        );
        return response;
      }, 0);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse && e.response != null) {
        return e.response!;
      }
      return _handleError(e);
    }
  }

  // Generic POST request
  Future<Response> post({
    required String endpoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      return _retryRequest(() async {
        final response = await _dio.post(endpoint, data: data);
        return response;
      }, 0);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse && e.response != null) {
        return e.response!;
      }
      return _handleError(e);
    }
  }

  Future<Response> put({
    required String endpoint,
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
        options: options ?? Options(),
      );
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse && e.response != null) {
        return e.response!;
      }
      return _handleError(e);
    }
  }

  Future postFormData({
    required String endpoint,
    required FormData formData,
    Options? options,
  }) async {
    try {
      // Make sure to set the right content type for multipart form data
      Options requestOptions =
          options ?? Options(contentType: 'multipart/form-data');
      final response = await _dio.post(
        endpoint,
        data: formData,
        options: requestOptions,
      );
      return response;
    } on DioException catch (e) {
      // For bad response (like 404), return the response instead of throwing
      if (e.type == DioExceptionType.badResponse && e.response != null) {
        return e.response!;
      }
      return _handleError(e);
    }
  }

  Future putFormData({
    required String endpoint,
    required FormData formData,
    Options? options,
  }) async {
    try {
      // Make sure to set the right content type for multipart form data
      Options requestOptions =
          options ?? Options(contentType: 'multipart/form-data');
      final response = await _dio.put(
        endpoint,
        data: formData,
        options: requestOptions,
      );
      return response;
    } on DioException catch (e) {
      // For bad response (like 404), return the response instead of throwing
      if (e.type == DioExceptionType.badResponse && e.response != null) {
        return e.response!;
      }
      return _handleError(e);
    }
  }

  // Check network connectivity
  Future<bool> _isNetworkAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  //Delete
  Future<Response> delete({
    required String endpoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.delete(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse && e.response != null) {
        return e.response!;
      }
      return _handleError(e);
    }
  }

  // Retry configuration
  static const int _maxRetries = 3;
  static const Duration _retryDelay = Duration(seconds: 1);

  Response _handleError(DioException error) {
    if (kDebugMode) {
      log("DioExceptionType: ${error.type}");
      log("Status Code: ${error.response?.statusCode}");
      log("Message: ${error.message}");
      log("Error Data: ${error.response?.data}");
    }

    final response = error.response;

    // Return response directly for client-side errors (400–499)
    if (response != null &&
        response.statusCode != null &&
        response.statusCode! >= 400 &&
        response.statusCode! < 500) {
      return response;
    }

    // Handle network-related errors separately
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        throw CustomHTTPException("Connection timeout. Please try again.");
      case DioExceptionType.sendTimeout:
        throw CustomHTTPException("Send timeout. Please try again.");
      case DioExceptionType.receiveTimeout:
        throw CustomHTTPException("Receive timeout. Please try again.");
      case DioExceptionType.connectionError:
        throw CustomHTTPException(
          "No internet, Check your internet connection",
        );
      case DioExceptionType.cancel:
        throw CustomHTTPException("Request was cancelled.");
      case DioExceptionType.badCertificate:
        throw CustomHTTPException("Bad SSL certificate.");
      case DioExceptionType.unknown:
        throw CustomHTTPException("Unknown error occurred.");
      case DioExceptionType.badResponse:
        // This is already handled above.
        break;
    }

    // Default fallback error
    throw CustomHTTPException("Unexpected error occurred: ${error.message}");
  }
}
