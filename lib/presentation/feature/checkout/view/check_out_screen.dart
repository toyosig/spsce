import 'package:circ/domain/services/secure_storage_services.dart';
import 'package:circ/presentation/feature/auth/view_model/auth_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/utils/constants/custom_primary_app_bar.dart';
import 'package:circ/utils/custom_widgets/guest_restriction_dialog.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:go_router/go_router.dart';
import 'package:circ/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circ/core/constant/global.dart';
import 'package:circ/data/models/home/products_data.dart';
import 'package:circ/presentation/feature/cart_screen/view_model/cart_view_model.dart';
import 'package:circ/presentation/feature/checkout/view_model/check_out_vm.dart';
import 'package:circ/presentation/feature/checkout/widgets/check_out_items.dart';
import 'package:circ/presentation/feature/checkout/widgets/checkout_card.dart';
import 'package:circ/presentation/feature/checkout/widgets/checkout_section_tile.dart';
import 'package:circ/presentation/feature/checkout/widgets/selection_tab.dart';
import 'package:circ/presentation/feature/checkout/widgets/shipping_form.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:pay_with_paystack/pay_with_paystack.dart';
import 'package:pay_with_paystack/pay_with_paystack.dart' show PayWithPayStack;
import 'package:provider/provider.dart';
import '../../sell_screen/view_model/sell_view_model.dart';

class CheckOutScreen extends StatefulWidget {
  final List<ProductsData> products;
  final String? offerId;
  final PaymentSource? source;
  final double? decidedPrice;
  const CheckOutScreen({
    super.key,
    required this.products,
    this.offerId,
    this.source,
    this.decidedPrice,
  });

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static const String placeholderImageUrl = "https://via.placeholder.com/150";
  static const String unknownProduct = "Unknown Product";
  static const String unknownBrand = "Unknown Brand";
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final checkOutViewModel = getIt.get<CheckOutViewModel>();
      final profileViewModel = getIt.get<ProfileViewModel>();
      
      if (await SecureStorageService.isGuestUser()) {
        if (mounted) {
          showDialog(
            context: context,
            builder: (ctx) => GuestRestrictionDialog(),
          );
        }
      } else {
        // Check if this is the user's first purchase
        final isFirstPurchase = await profileViewModel.getIsFirstPurchase();
        if (isFirstPurchase && mounted) {
          // Navigate to FirstPurchaseScreen
          context.pushNamed(Routes.firstPurchase.name);
          return; // Exit early to prevent further initialization
        }
      }
      
      try {
        await checkOutViewModel.fetchMarketplaceFee();
      } catch (e) {
        if (mounted) {
          MessageHelper.showErrorMessage(context, e.toString());
        }
      }
      // Use cart quantities for marketplace fee calculation
      final cartViewModel = getIt.get<CartViewModel>();
      final productsWithCartQuantities = widget.products.map((product) {
        final cartQuantity = cartViewModel.getQuantity(product.id!);
        return product.copyWith(quantity: cartQuantity);
      }).toList();
      checkOutViewModel.setMarketplaceFee(
        productsWithCartQuantities,
        widget.decidedPrice,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final checkOutViewModel = getIt.get<CheckOutViewModel>();
      checkOutViewModel.clearForm();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomPrimaryAppBar(title: 'Checkout', isBackButtonVisible: true),
      backgroundColor: AppColors.authbgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5.h,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const CheckoutSectionTitle(title: "Other Details"),
            ),
            SizedBox(
              height: widget.products.length == 1
                  ? MediaQuery.of(context).size.height * 0.15
                  : MediaQuery.of(context).size.height *
                        (widget.products.length * 0.13),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: widget.products.length,
                itemBuilder: (context, index) {
                  final product = widget.products[index];
                  final cartViewModel = getIt.get<CartViewModel>();
                  final cartQuantity = cartViewModel.getQuantity(product.id!);

                  // Format size information
                  String sizeInfo = "";
                  if (product.sizes != null && product.sizes!.isNotEmpty) {
                    List<String> sizeStrings = [];
                    product.sizes!.forEach((category, sizeValues) {
                      if (sizeValues.isNotEmpty) {
                        String values = sizeValues
                            .map((sv) => sv.value)
                            .join(', ');
                        sizeStrings.add("$category: $values");
                      }
                    });
                    sizeInfo = sizeStrings.join(' | ');
                  }

                  return CheckoutCard(
                    imagePath:
                        (product.photos != null && product.photos!.isNotEmpty)
                        ? product.photos![0]
                        : placeholderImageUrl,
                    title: product.title ?? unknownProduct,
                    brand:
                        '${product.brand?.name ?? unknownBrand} | Qty: $cartQuantity${sizeInfo.isNotEmpty ? '\nSize: $sizeInfo' : ''}',
                    price: (product.price ?? 0.0).toDouble(),
                    decidedPrice: widget.decidedPrice,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: widget.products.length == 1 ? 0 : 10.h,
                  );
                },
              ),
            ),
            // Shipping and Payment Forms
            ShippingForm(formKey: formKey),
            const SelectPayment(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: const CheckoutSectionTitle(title: "Order Summary"),
            ),
            // Order Summary
            Consumer<CheckOutViewModel>(
              builder: (context, checkOutViewModel, child) {
                return CheckOutSummaryBox(
                  subtotal: checkOutViewModel.subtotal,
                  marketplaceFee: checkOutViewModel.marketplaceFeeAmount,
                  marketplaceFeePercentage:
                      checkOutViewModel.marketplaceFeePercentage,
                  total: checkOutViewModel.total,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      final checkOutVm = getIt.get<CheckOutViewModel>();
                      final sellVm = getIt.get<SellViewModel>();
                      if (sellVm.selectedPayment == "Paystack") {
                        final uniqueTransRef = PayWithPayStack()
                            .generateUuidV4();
                        final cartViewModel = getIt.get<CartViewModel>();
                        final productsWithCartQuantities = widget.products.map((
                          product,
                        ) {
                          final cartQuantity = cartViewModel.getQuantity(
                            product.id!,
                          );
                          return product.copyWith(quantity: cartQuantity);
                        }).toList();
                        checkOutVm.handlePaystackPayment(
                          context,
                          uniqueTransRef,
                          products: productsWithCartQuantities,
                          decidedPrice: widget.decidedPrice,
                          offerId: widget.offerId,
                          source: widget.source,
                        );
                      } else {
                        debugPrint("Flutterwave");
                        // static const String paystackPayment = "Paystack";
                        final authViewModel = Provider.of<AuthViewModel>(
                          context,
                          listen: false,
                        );
                        final uniqueTransRef =
                            "txRef-${DateTime.now().millisecondsSinceEpoch}";
                        // Get products with cart quantities
                        final cartViewModel = getIt.get<CartViewModel>();
                        final productsWithCartQuantities = widget.products.map((
                          product,
                        ) {
                          final cartQuantity = cartViewModel.getQuantity(
                            product.id!,
                          );
                          return product.copyWith(quantity: cartQuantity);
                        }).toList();
                        checkOutVm.payNowFlutterWave(
                          context,
                          amount: checkOutViewModel.total.toString(),
                          publicKey:
                              authViewModel
                                  .settingsResponse
                                  ?.data
                                  .flutterwavePublicKey ??
                              dotenv.env['FLUTTERWAVE_PUBLIC_KEY'] ??
                              '',
                          provider: 'flutterwave',
                          uniqueTransRef: uniqueTransRef,
                          product: productsWithCartQuantities,
                          offerId: widget.offerId,
                          source: widget.source,
                        );
                      }
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
