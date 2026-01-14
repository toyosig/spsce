class LogoutResponseModel {
  final int? statusCode;
  final bool? success;
  final String? message;

  LogoutResponseModel({this.statusCode, this.success, this.message});

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) {
    return LogoutResponseModel(
      statusCode: json['statusCode'],
      success: json['success'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'statusCode': statusCode, 'success': success, 'message': message};
  }
}
