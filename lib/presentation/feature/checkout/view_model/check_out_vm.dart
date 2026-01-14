// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:circ/core/constant/global.dart';
import 'package:circ/domain/repository/place_order_repository.dart';
import 'package:circ/presentation/feature/auth/view_model/auth_view_model.dart';
import 'package:circ/presentation/feature/cart_screen/view_model/cart_view_model.dart';
import 'package:circ/presentation/feature/chat/view_model/chat_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/presentation/routes/routes.dart';
import 'package:circ/utils/custom_widgets/order_action_dialog_box.dart';
import 'package:circ/utils/helpers/custom_http_exceptions.dart';
import 'package:circ/utils/helpers/loading_helpers.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/models/home/products_data.dart';
import '../../../../data/models/payment_models/order_request_model.dart';
import '../../../../domain/services/payment_service/flutterwave_service.dart';
import '../../../../domain/services/payment_service/paystack_service.dart';
import '../../../../domain/services/secure_storage_services.dart';

class CheckOutViewModel extends ChangeNotifier {
  final PlaceOrderRepository repository = getIt.get<PlaceOrderRepository>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController address1Controller = TextEditingController();
  final TextEditingController address2Controller = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  bool _saveAddress = false;
  bool get saveAddress => _saveAddress;

  double _marketplaceFeePercentage = 0.0;
  double get marketplaceFeePercentage => _marketplaceFeePercentage;

  double _marketplaceFeeAmount = 0.0;
  double get marketplaceFeeAmount => _marketplaceFeeAmount;

  double _total = 0.0;
  double get total => _total;

  double _subtotal = 0.0;
  double get subtotal => _subtotal;

  String _savedAddress = '';
  String _savedAddress2 = '';
  String _savedState = '';
  String _savedCity = '';
  String _savedFullName = '';
  String _savedPhoneNumber = '';



  void setMarketplaceFee(List<ProductsData> products, double? decidedPrice) {
    // Calculate subtotal using product quantities
    double amount = 0.0;
    for (var product in products) {
      final price = product.price ?? 0.0;
      final quantity = product.quantity;
      amount += price * quantity;
    }

    final priceToUse = decidedPrice ?? amount;
    _marketplaceFeeAmount = priceToUse * _marketplaceFeePercentage / 100;
    final total = priceToUse + _marketplaceFeeAmount;
    final subtotal = priceToUse;
    _total = total;
    _subtotal = subtotal;
    notifyListeners();
  }

  bool isCheckoutFormValid() {
    return fullNameController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        address1Controller.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        stateController.text.isNotEmpty;
  }

  void toggleSaveAddress(bool value) async {
    _saveAddress = value;
    notifyListeners();

    if (value) {
      final pref = await SharedPreferences.getInstance();
      await pref.setString('saved_address', address1Controller.text);
      await pref.setString('saved_address2', address2Controller.text);
      await pref.setString('saved_state', stateController.text);
      await pref.setString('saved_city', cityController.text);
      await pref.setString('saved_full_name', fullNameController.text);
      await pref.setString('saved_phone_number', phoneNumberController.text);
    } else {
      await removeSavedAddress();
    }
  }

  Future<void> removeSavedAddress() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('saved_address');
    await pref.remove('saved_address2');
    await pref.remove('saved_state');
    await pref.remove('saved_city');
    await pref.setString('saved_full_name', fullNameController.text);
    await pref.setString('saved_phone_number', phoneNumberController.text);
  }

  Future<void> loadSavedAddress() async {
    final pref = await SharedPreferences.getInstance();
    _savedAddress = pref.getString('saved_address') ?? '';
    _savedAddress2 = pref.getString('saved_address2') ?? '';
    _savedState = pref.getString('saved_state') ?? '';
    _savedCity = pref.getString('saved_city') ?? '';
    _savedFullName = pref.getString('saved_full_name') ?? '';
    _savedPhoneNumber = pref.getString('saved_phone_number') ?? '';
    if (_savedAddress.isNotEmpty) {
      address1Controller.text = _savedAddress;
      address2Controller.text = _savedAddress2;
      stateController.text = _savedState;
      cityController.text = _savedCity;
      fullNameController.text = _savedFullName;
      phoneNumberController.text = _savedPhoneNumber;
      _saveAddress = true;
      notifyListeners();
    }
  }

  Future<void> payNowFlutterWave(
    BuildContext context, {
    required String amount,
    required String publicKey,
    required String provider,
    double? decidedPrice,
    int? quantity,
    required String uniqueTransRef,
    bool isCartCheckout = false,
    List<ProductsData>? product,
    String? offerId,
    PaymentSource? source,
  }) async {
    if (!isCheckoutFormValid()) {
      MessageHelper.showErrorMessage(context, 'Please fill all fields');
      return;
    }
    LoadingHelper.showLoading(context);
    try {
      final user = await SecureStorageService.getUser();
      if (user == null) {
        if (context.mounted) {
          LoadingHelper.hideLoading(context);
          showError(context, "User not found");
        }
        return;
      }

      var items = product!
          .map(
            (p) => OrderItem(
              productId: p.id!,
              quantity: p
                  .quantity, // Use the quantity from the product (already updated with cart quantities)
              decidedPrice: double.tryParse(p.price.toString()) ?? 0.0,
              actualPrice: double.tryParse(p.price.toString()) ?? 0.0,
              offerId: offerId ?? "",
            ),
          )
          .toList();
      final shippingInfo = ShippingInfo(
        fullName: fullNameController.text,
        phoneNumber: phoneNumberController.text,
        address1: address1Controller.text,
        address2: address2Controller.text,
        city: cityController.text,
        state: stateController.text,
      );
      final paymentInfo = PaymentInfo(
        type: "flutterwave",
        paymentId: uniqueTransRef,
      );
      final flutterwaveService = FlutterwaveService(repository: repository);
      if (context.mounted == false) {
        LoadingHelper.hideLoading(context);
        debugPrint("🔥 Context not mounted");
        return;
      }
      await flutterwaveService.payWithFlutterwave(
        context: context,
        publicKey: publicKey,
        uniqueTransRef: uniqueTransRef,
        total: total,
        items: items,
        shippingInfo: shippingInfo,
        marketplaceFee: marketplaceFeeAmount,
        fullName: fullNameController.text,
        phoneNumber: phoneNumberController.text,
        offerId: offerId ?? "",
        paymentInfo: paymentInfo,
        onSuccess: () async {
          if (context.mounted) {
            LoadingHelper.hideLoading(context);
            getIt.get<CartViewModel>().handlePostPayment(source!, context);
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => Dialog(
                backgroundColor: Colors.white,
                insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
                shape: RoundedRectangleBorder(),
                child: OrderActionDialogBox(
                  onSubmitText: "Message Seller",
                  onCancelTap: () {
                    context.pop();
                    context.pop();
                  },
                  onCancelText: 'Continue Shopping',
                  title: "Your order is placed, Thank you",
                  subTitle: "The seller will reach out to arrange delivery",
                  buttonText: "Buyer pays for delivery",
                  isSuccess: true,
                  onSubmitTap: () {
                    final chatViewModel = getIt.get<ChatViewModel>();
                    context.pop();
                    chatViewModel.navigateToChat(context, product.first.seller);
                  },
                ),
              ),
            ).then((_) {
              if (context.mounted) {
                clearForm();
              }
            });
          }
        },
        onFailure: (error) {
          if (context.mounted) {
            LoadingHelper.hideLoading(context);
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => Dialog(
                backgroundColor: Colors.white,
                insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
                shape: RoundedRectangleBorder(),
                child: OrderActionDialogBox(
                  onSubmitText: "Try Again",
                  onCancelTap: () {
                    context.pop();
                    context.pop();
                  },
                  onCancelText: 'Close',
                  title: "Payment Failed",
                  subTitle:
                      "An unexpected error occurred. Please try again.\n\nError: $error",
                  isSuccess: false,
                  onSubmitTap: () {
                    context.pop();
                  },
                ),
              ),
            );
          }
        },
      );
    } catch (e, stacktrace) {
      debugPrint("🔥 Error during payment: $e");
      debugPrint("🪵 Stacktrace: $stacktrace");
      if (context.mounted) {
        LoadingHelper.hideLoading(context);
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => Dialog(
            backgroundColor: Colors.white,
            insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
            shape: RoundedRectangleBorder(),
            child: OrderActionDialogBox(
              onSubmitText: "Try Again",
              onCancelTap: () {
                context.pop();
                context.pop();
              },
              onCancelText: 'Close',
              title: "Payment Failed",
              subTitle:
                  "An unexpected error occurred. Please try again.\n\nError: $e",
              isSuccess: false,
              onSubmitTap: () {
                context.pop();
              },
            ),
          ),
        ).then((_) {});
      }
    }
  }

  BuildContext? _context;
  Future<void> handlePaystackPayment(
    BuildContext context,
    String uniqueTransRef, {
    double? decidedPrice,
    int? quantity,
    List<ProductsData>? products,
    String? offerId,
    PaymentSource? source,
  }) async {
    _context = context;
    LoadingHelper.showLoading(_context!);

    try {
      final user = await SecureStorageService.getUser();
      if (user == null) {
        if (_context?.mounted ?? false) {
          LoadingHelper.hideLoading(_context!);
          showError(_context!, "User not found");
        }
        return;
      }

      if (products == null) {
        if (_context?.mounted ?? false) {
          LoadingHelper.hideLoading(_context!);
          showError(_context!, "Product not found");
        }
        return;
      }

      final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      final secretKey =
          authViewModel.settingsResponse?.data.paystackKey ??
          dotenv.env['PAYSTACK_SECRET_KEY'];
      if (secretKey == null || secretKey.isEmpty) {
        if (_context?.mounted ?? false) {
          LoadingHelper.hideLoading(_context!);
          showError(_context!, "Paystack secret key is not configured.");
        }
        return;
      }

      final callbackUrl = 'https://fallback.com';

      if (products.isNotEmpty) {
        var items = products
            .map(
              (p) => OrderItem(
                productId: p.id!,
                quantity: p
                    .quantity, // Use the quantity from the product (already updated with cart quantities)
                decidedPrice:
                    decidedPrice ?? double.tryParse(p.price.toString()) ?? 0.0,
                actualPrice: double.tryParse(p.price.toString()) ?? 0.0,
                offerId: offerId ?? "",
              ),
            )
            .toList();

        final shippingInfo = ShippingInfo(
          fullName: fullNameController.text,
          phoneNumber: phoneNumberController.text,
          address1: address1Controller.text,
          address2: address2Controller.text,
          city: cityController.text,
          state: stateController.text,
        );

        final paymentInfo = PaymentInfo(
          type: "paystack",
          paymentId: uniqueTransRef,
        );

        final paystackService = PaystackService(repository: repository);

        if (!(_context?.mounted ?? false)) {
          LoadingHelper.hideLoading(_context!);
          return;
        }

        await paystackService.payWithPaystack(
          context: _context!,
          secretKey: secretKey,
          uniqueTransRef: uniqueTransRef,
          total: _total,
          items: items,
          shippingInfo: shippingInfo,
          marketplaceFee: _marketplaceFeePercentage,
          fullName: fullNameController.text,
          phoneNumber: phoneNumberController.text,
          offerId: offerId ?? "",
          paymentInfo: paymentInfo,
          customerEmail: user.user!.email!,
          callbackUrl: callbackUrl,
          onSuccess: () async {
            if (!(_context?.mounted ?? false)) return;
            await getIt.get<CartViewModel>().handlePostPayment(
              source!,
              _context!,
            );
            LoadingHelper.hideLoading(_context!);
            await Future.delayed(Duration(milliseconds: 200));
            if (!(_context?.mounted ?? false)) return;
            await showDialog(
              context: _context!,
              barrierDismissible: false,
              builder: (_) => Dialog(
                backgroundColor: Colors.white,
                insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
                shape: RoundedRectangleBorder(),
                child: OrderActionDialogBox(
                  onSubmitText: "Message Seller",
                  onCancelTap: () {
                    if (_context?.mounted ?? false) {
                      Navigator.of(_context!).pop();
                      _context!.goNamed(Routes.navbar.name, extra: 1);
                    }
                  },
                  onCancelText: 'Continue Shopping',
                  title: "Your order is placed, Thank you",
                  subTitle: "The seller will reach out to arrange delivery",
                  isSuccess: true,
                  onSubmitTap: () {
                    if (_context?.mounted ?? false) {
                      Navigator.of(_context!).pop();
                      getIt.get<ChatViewModel>().navigateToChat(
                        _context!,
                        products.first.seller,
                      );
                    }
                  },
                ),
              ),
            );

            if (_context?.mounted ?? false) {
              clearForm();
            }
          },

          onFailure: (error) async {
            LoadingHelper.hideLoading(_context!);
            showError(_context!, error);
          },
        );
      } else {
        if (_context?.mounted ?? false) {
          LoadingHelper.hideLoading(_context!);
          showError(_context!, "No products available for checkout");
        }
        return;
      }
    } catch (e, stacktrace) {
      debugPrint("🔥 Error during payment: $e");
      debugPrint("🪵 Stacktrace: $stacktrace");
      if (_context?.mounted ?? false) {
        LoadingHelper.hideLoading(_context!);
        await Future.delayed(Duration(milliseconds: 100), () {
          if (_context?.mounted ?? false) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => Dialog(
                backgroundColor: Colors.white,
                insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
                shape: RoundedRectangleBorder(),
                child: OrderActionDialogBox(
                  onSubmitText: "Try Again",
                  onCancelTap: () {
                    context.pop(_context!);
                    context.pop();
                  },
                  onCancelText: 'Close',
                  title: "Payment Failed",
                  subTitle: e.toString(),
                  isSuccess: false,
                  onSubmitTap: () {
                    context.pop(_context!);
                  },
                ),
              ),
            );
          }
        });
      }
    }
  }

  Future<void> handleReTryPaystackPayment(
    BuildContext context, {
    required String orderId,
    required double orderTotal,
    required ProductsData products,
  }) async {
    LoadingHelper.showLoading(context);
    try {
      final user = await SecureStorageService.getUser();
      if (user == null) {
        if (context.mounted) {
          LoadingHelper.hideLoading(context);
          showError(context, "User not found");
        }
        return;
      }

      final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      final secretKey =
          authViewModel.settingsResponse?.data.paystackKey ??
          dotenv.env['PAYSTACK_SECRET_KEY'];
      if (secretKey == null || secretKey.isEmpty) {
        if (context.mounted) {
          LoadingHelper.hideLoading(context);
          showError(context, "Paystack secret key is not configured.");
        }
        return;
      }

      final callbackUrl = 'https://fallback.com';

      final paystackService = PaystackService(repository: repository);

      if (!(context.mounted)) {
        LoadingHelper.hideLoading(context);
        return;
      }

      BuildContext dialogcontext = context;

      await paystackService.reTryPayWithPaystack(
        orderId: orderId,
        context: context,
        secretKey: secretKey,
        customerEmail: user.user!.email!,
        callbackUrl: callbackUrl,
        onSuccess: (confirm) async {
          log("cornfirmation order: ${confirm.data.toString()}");
          await Future.delayed(Duration(milliseconds: 200));
          LoadingHelper.hideLoading(context);
          if (!(context.mounted)) return;
          final profileVm = getIt.get<ProfileViewModel>();
          await showDialog(
            context: dialogcontext,
            barrierDismissible: false,
            builder: (_) => Dialog(
              backgroundColor: Colors.white,
              insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
              shape: RoundedRectangleBorder(),
              child: OrderActionDialogBox(
                onSubmitText: "Message Seller",
                onCancelTap: () {
                  if (dialogcontext.mounted) {
                    Navigator.of(dialogcontext).pop();

                    profileVm.getMyPurchases();
                    context.pop(context);
                  }
                },
                onCancelText: 'Cencel',
                title: "Your Payment is Done, Thank you",
                subTitle: "The seller will reach out to arrange delivery",
                isSuccess: true,
                onSubmitTap: () {
                  if (dialogcontext.mounted) {
                    Navigator.of(dialogcontext).pop();
                    context.pop(context);
                    profileVm.getMyPurchases();
                    getIt.get<ChatViewModel>().navigateToChat(
                      context,
                      products.seller,
                    );
                  }
                },
              ),
            ),
          );
        },
        onFailure: (error) {
          throw CustomHTTPException(error.toString());
        },
      );
    } catch (e) {
      LoadingHelper.hideLoading(context);
      BuildContext dialogcontext = context;
      await Future.delayed(Duration(milliseconds: 100), () {
        showDialog(
          context: dialogcontext,
          barrierDismissible: false,
          builder: (_) => Dialog(
            backgroundColor: Colors.white,
            insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
            shape: RoundedRectangleBorder(),
            child: OrderActionDialogBox(
              onSubmitText: "Try Again",
              onCancelTap: () {
                Navigator.of(dialogcontext).pop();
              },
              onCancelText: 'Close',
              title: "Payment Failed",
              subTitle:
                  "An unexpected error occurred. Please try again.\n\nError: $e",
              isSuccess: false,
              onSubmitTap: () {
                Navigator.of(dialogcontext).pop();
              },
            ),
          ),
        );
      });
    }
  }

  void showError(BuildContext context, String message) {
    if (context.mounted) {
      MessageHelper.showErrorMessage(context, message);
    }
  }

  Customer createCustomer(String email) {
    return Customer(
      name: fullNameController.text,
      phoneNumber: phoneNumberController.text,
      email: email,
    );
  }

  /// get commission
  Future<void> fetchMarketplaceFee() async {
    try {
      final fee = await repository.getMarketplaceFee(); // 0.08 expected
      _marketplaceFeePercentage = fee;
      notifyListeners();
    } catch (e) {
      throw CustomHTTPException(e.toString());
    } finally {}
  }

  void clearForm() {
    fullNameController.clear();
    phoneNumberController.clear();
    address1Controller.clear();
    address2Controller.clear();
    stateController.clear();
    cityController.clear();
    _saveAddress = false;
    _marketplaceFeePercentage = 0.0;
    _marketplaceFeeAmount = 0.0;
    _total = 0.0;
    _subtotal = 0.0;
    notifyListeners();
  }
}
