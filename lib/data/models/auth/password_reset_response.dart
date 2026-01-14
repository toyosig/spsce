class PasswordResetResponse {
  final bool? success;
  final String? message;
  final String? error;
  final int? statusCode;

  PasswordResetResponse({
    this.success,
    this.message,
    this.error,
    this.statusCode,
  });

  factory PasswordResetResponse.fromJson(Map<String, dynamic> json) {
    return PasswordResetResponse(
      success: json['success'],
      message: json['message'],
      error: json['error'],
      statusCode: json['statusCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'error': error,
      'statusCode': statusCode,
    };
  }
}
