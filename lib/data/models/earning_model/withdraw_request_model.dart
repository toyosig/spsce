class WithdrawRequestModel {
  final String bankName;
  final String accountNumber;
  final String accountHolderName;
  final double amount;

  WithdrawRequestModel({
    required this.bankName,
    required this.accountNumber,
    required this.accountHolderName,
    required this.amount,
  });

  Map<String, dynamic> toJson() {
    return {
      'bankName': bankName,
      'accountNumber': accountNumber,
      'accountHolderName': accountHolderName,
      'amount': amount,
    };
  }
}

class WithdrawRequestResponseModel {
  final bool? success;
  final String? error;
  final String? message;

  WithdrawRequestResponseModel({this.error, this.success, this.message});

  factory WithdrawRequestResponseModel.fromJson(Map<String, dynamic> json) {
    return WithdrawRequestResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      error: json['error'] as String?,
    );
  }
}

