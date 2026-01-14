import 'package:flutterwave_standard/flutterwave.dart';

enum PaymentStatus { success, failed, cancelled, error }

class PaymentResult {
  final String status; // e.g. "successful"
  final bool? success;
  final String? transactionId;
  final String? txRef;
  final String? message;
  final String? title;
  final String? description;

  PaymentResult({
    required this.status,
    required this.success,
    required this.txRef,
    this.transactionId,
    this.message,
    this.title,
    this.description,
  });

  factory PaymentResult.fromChargeResponse(ChargeResponse response) {
    return PaymentResult(
      status: response.status ?? "unknown",
      success: response.success ?? false,
      txRef: response.txRef ?? "",
      transactionId: response.transactionId,
      message: response.toString(), // You can customize this
      title: response.status,
      description: response.toString(),
    );
  }
}
