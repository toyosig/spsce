import 'package:circ/data/models/payment_models/order_request_model.dart';
import 'package:flutterwave_standard/models/requests/customer.dart';

class FlutterwavePaymentRequest {
  final String txRef;
  final String publicKey;
  final String currency;
  final String redirectUrl;
  final double amount;
  final String customizationTitle;
  final bool isTestMode;
  final String paymentOptions;
  final String fullName;
  final String phoneNumber;
  final String email;
  final ShippingInfo shippingInfo;
  final OrderItem orderItem;

  FlutterwavePaymentRequest({
    required this.txRef,
    required this.publicKey,
    required this.currency,
    required this.redirectUrl,
    required this.amount,
    required this.customizationTitle,
    required this.isTestMode,
    required this.paymentOptions,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.shippingInfo,
    required this.orderItem,
  });

  Customer toCustomer(String email) {
    return Customer(name: fullName, phoneNumber: phoneNumber, email: email);
  }

  OrderRequest toOrderRequest(String email) {
    final fee = amount * 0.008;
    final total = amount + fee;

    return OrderRequest(
      items: [orderItem],
      shippingInfo: shippingInfo,
      paymentInfo: PaymentInfo(type: "flutterwave", paymentId: txRef),
      marketplaceFee: fee,
      total: total,
    );
  }
}
