import 'dart:developer';

import 'package:circ/core/constant/global.dart';
import 'package:circ/domain/services/secure_storage_services.dart';
import 'package:circ/presentation/feature/checkout/view_model/check_out_vm.dart';
import 'package:circ/utils/constants/app_images.dart';
import 'package:circ/utils/helpers/loading_helpers.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import '../../../../config/payment_config.dart';
import '../../../../data/models/home/products_data.dart';
import '../../../../domain/repository/product_details_repository.dart';
import '../../chat/view_model/chat_view_model.dart';

/// Enum to identify the source of payment
enum PaymentSource { offer, cart, detail }

class CartViewModel extends ChangeNotifier {
  // final CartRepository repository = CartRepoImpl();
  final ProductDetailsRepository repository = getIt
      .get<ProductDetailsRepository>();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final Map<String, int> _cartQuantities = {};
  final List<String> selectedProductIds = [];

  List<ProductsData> _cartProducts = [];
  List<ProductsData> get cartProducts => _cartProducts;

  double _subtotal = 0.0;
  double get subtotal => _subtotal;

  bool isPriceButtonDisabled = false;

  double _marketplaceFeePercentage = 0.0;
  double get marketplaceFeePercentage => _marketplaceFeePercentage;

  double _marketplaceFeeAmount = 0.0;
  double get marketplaceFeeAmount => _marketplaceFeeAmount;

  double _total = 0.0;
  double get total => _total;

  int _cartNumbers = 0;
  int get cartNumbers => _cartNumbers;

  // this function will return the quantity of the product in the cart
  // if the product is not in the cart, it will return 1
  // if the product is in the cart but the quantity is not set, it will return 1
  // if the product is in the cart but the quantity is set to 0, it will return 1
  // if the product is in the cart but the quantity is set to null, it will return 1
  // if the product is in the cart but the quantity is set to 0, it will return 1
  int getQuantity(String productId) {
    return _cartQuantities[productId] ?? 1;
  }

  Future<void> fetchMarketplaceFee() async {
    final checkOutViewModel = getIt.get<CheckOutViewModel>();
    await checkOutViewModel.fetchMarketplaceFee();
    _marketplaceFeePercentage = checkOutViewModel.marketplaceFeePercentage;
    notifyListeners();
  }

  void setMarketplaceFee(List<ProductsData> products) {
    if (products.isEmpty) {
      _marketplaceFeeAmount = 0.0;
      _total = 0.0;
      _subtotal = 0.0;
      notifyListeners();
      return;
    }

    // Calculate subtotal using cart quantities
    double amount = 0.0;
    for (var product in products) {
      final price = product.price ?? 0.0;
      final quantity = getQuantity(product.id!);
      amount += price * quantity;
    }

    _marketplaceFeeAmount = amount * _marketplaceFeePercentage / 100;
    final total = amount + _marketplaceFeeAmount;
    final subtotal = amount;
    _total = total;
    _subtotal = subtotal;
    notifyListeners();
  }

  bool hasAlreadyOffered(String productId) {
    return selectedProductIds.contains(productId);
  }

  void markProductAsOffered(String productId) {
    selectedProductIds.add(productId);
    notifyListeners();
  }

  void disablePriceButton() {
    isPriceButtonDisabled = true;
    notifyListeners();
  }

  void enablePriceButton() {
    isPriceButtonDisabled = false;
    notifyListeners();
  }

  void calculateCartNumbers() {
    _cartNumbers = _cartProducts.length;
    notifyListeners();
  }

  void updateCart(List<ProductsData> newCart) {
    _cartProducts = newCart;
    // calculateCartTotals();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void incrementQuantity(String productId, {BuildContext? context}) {
    final product = _cartProducts.firstWhere((p) => p.id == productId);
    final currentQty = getQuantity(productId);
    final availableStock = product.quantity;
    if (currentQty < availableStock) {
      _cartQuantities[productId] = currentQty + 1;
      recalculateTotals();
      notifyListeners();
    } else {
      MessageHelper.showErrorMessage(
        context!,
        'Cannot add more than available stock.',
      );
    }
  }

  void decrementQuantity(String productId) {
    final currentQty = getQuantity(productId);
    if (currentQty > 1) {
      _cartQuantities[productId] = currentQty - 1;
      recalculateTotals();
      notifyListeners();
    }
  }

  void toggleProductSelection(String productId, bool selected) {
    if (selected) {
      selectedProductIds.add(productId);
    } else {
      selectedProductIds.remove(productId);
    }
    recalculateTotals();
    notifyListeners();
  }

  void selectProduct(String productId) {
    selectedProductIds.add(productId);
    recalculateTotals();
    notifyListeners();
  }

  void deselectProduct(String productId) {
    selectedProductIds.remove(productId);
    recalculateTotals();
    notifyListeners();
  }

  void recalculateTotals() {
    _subtotal = 0.0;
    for (var product in _cartProducts) {
      final price = product.price ?? 0.0;
      final quantity = getQuantity(product.id!);
      _subtotal += price * quantity;
    }
    _marketplaceFeeAmount = _subtotal * (_marketplaceFeePercentage / 100);
    _total = _subtotal + _marketplaceFeeAmount;
    notifyListeners();
  }

  List<ProductsData> get selectedProducts =>
      _cartProducts.where((p) => selectedProductIds.contains(p.id)).toList();

  double get selectedSubtotal => selectedProducts.fold(
    0.0,
    (total, product) =>
        total + ((product.price ?? 0) * getQuantity(product.id!)),
  );

  double get selectedMarketplaceFee =>
      selectedSubtotal * (_marketplaceFeePercentage / 100);

  double get selectedTotal => selectedSubtotal + selectedMarketplaceFee;

  init(BuildContext context) async {
    await getCart(context);
    await getIt.get<CheckOutViewModel>().fetchMarketplaceFee();
  }

  Future<bool?> addToCart(BuildContext context, {String? id}) async {
    LoadingHelper.showLoading(context);
    try {
      final result = await repository.addToCart(id: id);
      if (!context.mounted) return false;
      await getCart(context);
      calculateCartNumbers();
      if (!context.mounted) return false;
      MessageHelper.showSuccessMessage(
        context,
        'Added to cart',
        svgIconUrl: AppImages.addedInCart,
      );
      return result;
    } catch (e) {
      if (context.mounted) {
          MessageHelper.showErrorMessage(context, 'Already in cart');
        }
        return false;
     
    } finally {
      notifyListeners();
      if (context.mounted) LoadingHelper.hideLoading(context);
    }
  }

  Future<void> removeFromCart(BuildContext context, {String? id}) async {
    LoadingHelper.showLoading(context);
    try {
      final result = await repository.removeFromCart(id: id);
      if (result == false) {
        return;
      }
      if (!context.mounted) return;
      await getCart(context);
      calculateCartNumbers();
    } catch (e) {
      if (context.mounted) {
        // MessageHelper.showErrorMessage(context, '$e');
        log("error removeFromCart: $e");
      }
    } finally {
      notifyListeners();
      if (context.mounted) LoadingHelper.hideLoading(context);
    }
  }

  Future<void> getCart(BuildContext context) async {
    try {
      final response = await repository.getCart();
      _cartProducts = response.data ?? [];
      // Initialize local cart quantities to 1 for each product
      for (final product in _cartProducts) {
        _cartQuantities[product.id!] = 1;
      }
      calculateCartNumbers();
    } catch (e) {
      if (context.mounted) {
        // MessageHelper.showErrorMessage(context, '$e');
        log("error getCart: $e");
      }
    } finally {
      notifyListeners();
      if (context.mounted) LoadingHelper.hideLoading(context);
    }
  }

  /// Update product details
  Future<void> updateProductDetails(
    BuildContext context, {
    String? receiverId,
    String? productId,
    String? price,
    String? description,
  }) async {
    LoadingHelper.showLoading(context);
    try {
      final result = await repository.addOfferToProduct(
        receiverId: receiverId,
        productId: productId,
        price: price,
        description: description,
      );
      if (result == false) {
        if (context.mounted) {
          MessageHelper.showErrorMessage(context, 'Already Offred');
        }
        if (context.mounted) LoadingHelper.hideLoading(context);
        return;
      }
      if (!context.mounted) return;
      MessageHelper.showSuccessMessage(
        context,
        'Your offer has been sent',
        subTitle:
            'We have sent your offer to the seller You will be alerted when they respond',
        bottomText: 'The seller has 24 hours to respond',
      );
    } catch (e) {
      if (context.mounted) {
        // MessageHelper.showErrorMessage(context, '$e');
        log("error updateProductDetails: $e");
      }
    } finally {
      notifyListeners();
      if (context.mounted) LoadingHelper.hideLoading(context);
    }
  }

  Future<void> handlePaymentInitialization(
    BuildContext context, {
    required PaymentConfig config,
  }) async {
    try {
      final checkOutVm = getIt.get<CheckOutViewModel>();
      final user = await SecureStorageService.getUser();
      if (user == null) {
        if (context.mounted) {
          MessageHelper.showErrorMessage(context, "User not found");
        }
        return;
      }
      final Customer customer = Customer(
        name: checkOutVm.fullNameController.text,
        phoneNumber: checkOutVm.phoneNumberController.text,
        email: user.user!.email!,
      );

      final Flutterwave flutterwave = Flutterwave(
        publicKey: config.publicKey,
        currency: config.currency,
        redirectUrl: config.redirectUrl,
        txRef: config.txRef,
        amount: config.amount,
        customer: customer,
        paymentOptions: config.paymentOptions,
        customization: Customization(title: config.customizationTitle),
        isTestMode: config.isTestMode,
      );

      if (!context.mounted) {
        debugPrint("Context issue handlePaymentInitialization");
        return;
      }
      final ChargeResponse response = await flutterwave.charge(context);
      if (!context.mounted) {
        debugPrint("Context issue handlePaymentInitialization");
        return;
      }
      if (response.success == true) {
        MessageHelper.showSuccessMessage(context, "Payment successful");
      } else {
        MessageHelper.showErrorMessage(context, "Payment failed");
      }
    } catch (e) {
      debugPrint("Error in handlePaymentInitialization: $e");
      if (!context.mounted) {
        debugPrint("Context issue handlePaymentInitialization");
        return;
      }
      MessageHelper.showErrorMessage(
        context,
        "Payment initialization failed: ${e.toString()}",
      );
    }
  }

  /// Post-payment handler
  /// Usage: Call after a successful payment to refresh relevant data
  /// depending on the source screen.
  ///
  /// [source] - source of payment screen (offer/cart/detail)
  /// [context] - context for making API calls
  /// [conversationId] - required only when source is `PaymentSource.offer`
  Future<void> handlePostPayment(
    PaymentSource source,
    BuildContext context, {
    String? conversationId,
  }) async {
    final chatVm = getIt.get<ChatViewModel>();
    switch (source) {
      case PaymentSource.offer:
        if (chatVm.otherUserId != null) {
          await chatVm.getChatsAfterOfferPayment(chatVm.otherUserId!);
        }
        break;
      case PaymentSource.cart:
        getCart(context); // Refresh cart after payment
        break;
      case PaymentSource.detail:
        // No API call needed for now
        break;
    }
  }
}
