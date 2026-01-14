import 'package:flutter/material.dart';
import 'package:pay_with_paystack/pay_with_paystack.dart';
import '../../../data/models/api/api_response.dart';
import '../../../data/models/payment_models/order_request_model.dart';
import '../../repository/place_order_repository.dart';
import '../../services/secure_storage_services.dart';

class PaystackService {
  final PlaceOrderRepository repository;
  PaystackService({required this.repository});

  Future<ApiResponse> payWithPaystack({
    required BuildContext context,
    required String secretKey,
    required String uniqueTransRef,
    required double total,
    required List<OrderItem> items,
    required ShippingInfo shippingInfo,
    required double marketplaceFee,
    required String fullName,
    required String phoneNumber,
    required String offerId,
    required PaymentInfo paymentInfo,
    required String customerEmail,
    required String callbackUrl,
    required Function() onSuccess,
    required Function(String) onFailure,
  }) async {
    final user = await SecureStorageService.getUser();
    if (user == null) {
      onFailure("User not found");
      return ApiResponse(success: false, message: "User not found");
    }
    final orderRequest = OrderRequest(
      items: items,
      shippingInfo: shippingInfo,
      paymentInfo: paymentInfo,
      marketplaceFee: marketplaceFee,
      total: total,
    );
    final response = await repository.createOrder(
      products: orderRequest.toJson(),
      uniqueTransRef: uniqueTransRef,
    );

    if (response.success == false) {
      onFailure(response.message);
      return ApiResponse(success: false, message: response.message);
    }
    if (!context.mounted) {
      onFailure("Context not mounted");
      return ApiResponse(success: false, message: "Context not mounted");
    }
    await PayWithPayStack().now(
      context: context,
      secretKey: secretKey,
      customerEmail: customerEmail,
      reference: uniqueTransRef,
      currency: "NGN",
      amount: total,
      callbackUrl: callbackUrl,
      transactionCompleted: (paymentData) async {
        final confirm = await repository.confirmOrder(
          uniqueTransRef: paymentData.reference!,
        );
        if (confirm.success == false) {
          onFailure(confirm.message);
          return ApiResponse(success: false, message: "Payment failed");
        }
        onSuccess();
        return ApiResponse(success: true, message: "Payment successful");
      },
      transactionNotCompleted: (reason) async {
        onFailure(reason);
        return ApiResponse(success: false, message: "Payment failed");
      },
    );
    return ApiResponse(success: true, message: "Transection completed");
  }

  Future<ApiResponse> reTryPayWithPaystack({
    required BuildContext context,
    required String secretKey,
    required String orderId,
    required String customerEmail,
    required String callbackUrl,
    required Function(ApiResponse) onSuccess,
    required Function(String) onFailure,
  }) async {
    final response = await repository.reTryOrder(orderId: orderId);
    if (response.success == false) {
      onFailure(response.message ?? "");
      return ApiResponse(success: false, message: response.message ?? "");
    }

    if (!context.mounted) {
      onFailure("Context not mounted");
      return ApiResponse(success: false, message: "Context not mounted");
    }
    final amount = response.amount!;
    final uniqueRef = response.reference!;
    await PayWithPayStack().now(
      context: context,
      secretKey: secretKey,
      customerEmail: customerEmail,
      reference: uniqueRef,
      currency: "NGN",
      amount: amount,
      callbackUrl: callbackUrl,
      transactionCompleted: (paymentData) async {
        final confirm = await repository.confirmOrder(
          uniqueTransRef: paymentData.reference!,
        );
        if (confirm.success == false) {
          onFailure(confirm.message);
          return ApiResponse(success: false, message: "Payment failed");
        }
        onSuccess(confirm);
        return ApiResponse(success: true, message: "Payment successful");
      },
      transactionNotCompleted: (reason) async {
        onFailure(reason);
        return ApiResponse(success: false, message: "Payment failed");
      },
    );
    return ApiResponse(success: true, message: "Payment successful");
  }
}
