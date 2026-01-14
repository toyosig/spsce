class ChangePasswordResModel {
  final int? statusCode;
  final bool? success;
  final String? message;

  ChangePasswordResModel({
    this.statusCode,
    this.success,
    this.message,
  });

  factory ChangePasswordResModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordResModel(
      statusCode: json['statusCode'] as int?,
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'success': success,
      'message': message,
    };
  }

  @override
  String toString() {
    return 'ChangePasswordResModel(statusCode: $statusCode, success: $success, message: $message)';
  }
}
