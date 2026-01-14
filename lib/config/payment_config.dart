class PaymentConfig {
  final String amount;
  final String currency;
  final String redirectUrl;
  final String txRef;
  final String paymentOptions;
  final String customizationTitle;
  final bool isTestMode;
  final String name;
  final String phoneNumber;
  final String email;
  final String publicKey;
  final String customerName;
  final String customerPhoneNumber;
  final String customerEmail;
  final String customerId;
  final String customerAddress;
  final String customerCity;
  final String customerState;
  final String customerCountry;
  final String customerZip;
  final String customerCountryCode;
  final String provider;

  const PaymentConfig({
    required this.amount,
    required this.currency,
    required this.redirectUrl,
    required this.txRef,
    required this.paymentOptions,
    required this.customizationTitle,
    required this.isTestMode,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.publicKey,
    required this.customerName,
    required this.customerPhoneNumber,
    required this.customerEmail,
    required this.customerId,
    required this.customerAddress,
    required this.customerCity,
    required this.customerState,
    required this.customerCountry,
    required this.customerZip,
    required this.customerCountryCode,
    required this.provider,
  });

  factory PaymentConfig.defaultConfig({
    required String amount,
    required String publicKey,
    required String provider,
  }) {
    return PaymentConfig(
      amount: amount,
      currency: "NGN",
      redirectUrl: "https://www.google.com",
      txRef: "txRef-${DateTime.now().millisecondsSinceEpoch}",
      paymentOptions: "ussd, card, bank transfer",
      customizationTitle: "Circ Payment",
      isTestMode: true,
      name: "Abdullah",
      phoneNumber: "1234566677777",
      email: "a.abdullah@codeminer.co",
      publicKey: publicKey,
      customerName: "Abdullah",
      customerPhoneNumber: "1234566677777",
      customerEmail: "a.abdullah@codeminer.co",
      customerId: "1234566677777",
      customerAddress: "1234566677777",
      customerCity: "1234566677777",
      customerState: "1234566677777",
      customerCountry: "1234566677777",
      customerZip: "1234566677777",
      customerCountryCode: "1234566677777",
      provider: provider,
    );
  }
}
