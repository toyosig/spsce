import 'package:flutter/material.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import '../../../data/models/payment_models/order_request_model.dart';
import '../../repository/place_order_repository.dart';
import '../../services/secure_storage_services.dart';

class FlutterwaveService {
  final PlaceOrderRepository repository;
  FlutterwaveService({required this.repository});

  Future<bool> payWithFlutterwave({
    required BuildContext context,
    required String publicKey,
    required String uniqueTransRef,
    required double total,
    required List<OrderItem> items,
    required ShippingInfo shippingInfo,
    required double marketplaceFee,
    required String fullName,
    required String phoneNumber,
    required String offerId,
    required PaymentInfo paymentInfo,
    required Function() onSuccess,
    required Function(String) onFailure,
    bool isTestMode = true,
    String paymentOptions = "ussd, card, bank transfer",
    String customizationTitle = "Circ Payment",
    String redirectUrl = "https://www.google.com",
  }) async {
    final user = await SecureStorageService.getUser();
    if (user == null) {
      onFailure("User not found");
      return false;
    }
    final customer = Customer(
      name: fullName,
      phoneNumber: phoneNumber,
      email: user.user!.email!,
    );
    final flutterwave = Flutterwave(
      publicKey: publicKey,
      currency: "NGN",
      redirectUrl: redirectUrl,
      txRef: uniqueTransRef,
      amount: total.toString(),
      customer: customer,
      paymentOptions: paymentOptions,
      customization: Customization(title: customizationTitle),
      isTestMode: isTestMode,
    );
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
      onFailure("Order creation failed");
      return false;
    }
    if (context.mounted == false) {
      onFailure("Context not mounted");
      return false;
    }
    final ChargeResponse result = await flutterwave.charge(context);
    if (result.success == true && result.status == "successful") {
      final confirm = await repository.confirmOrderFlutterWave(
        uniqueTransRef: result.transactionId!,
      );
      if (confirm == false) {
        onFailure("Order confirmation failed");
        return false;
      }
      onSuccess();
      return true;
    } else {
      onFailure(result.status ?? "Transaction failed");
      return false;
    }
  }
}
