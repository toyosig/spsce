import 'package:circ/presentation/feature/cart_screen/view_model/cart_view_model.dart';
import 'package:circ/presentation/feature/home_screen/view_model/home_view_model.dart';
import 'package:circ/presentation/feature/detail_screen/widgets/footer.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/constant/global.dart';
import '../../detail_screen/view_model/details_view_model.dart';
import 'package:circ/utils/custom_widgets/guest_restriction_dialog.dart';
import 'package:circ/domain/services/secure_storage_services.dart';

class ProductDetailBottomNavBar extends StatelessWidget {
  const ProductDetailBottomNavBar({
    super.key,
    required this.isSellersProduct,
    required this.cartVm,
    required this.profileVm,
    required this.viewModel,
    required this.isSold,
  });

  final bool isSellersProduct;
  final CartViewModel cartVm;
  final ProfileViewModel profileVm;
  final HomeViewModel viewModel;
  final bool isSold;

  @override
  Widget build(BuildContext context) {
    if (viewModel.productDetails.id == null) {
      return SizedBox.shrink();
    }
    return ProductFooter(
      isSold: isSold,
      isSellersProduct: isSellersProduct,
      onEditTab: isSold
          ? () {}
          : () => DetailsViewModel.showSellerProductOptions(
              context: context,
              product: viewModel.productDetails,
              onEdit: () {
                context.push(
                  '/sellItem',
                  extra: {'product': viewModel.productDetails, 'isEdit': true},
                );
              },
              onRemove: () {
                DetailsViewModel.showRemoveProductDialog(
                  context: context,
                  onConfirm: () {
                    final viewModel = getIt.get<HomeViewModel>();
                    viewModel.removeProduct(
                      context,
                      id: viewModel.productDetails.id,
                    );
                  },
                );
              },
            ),
      price: (viewModel.productDetails.price ?? 5000).toInt(),
      onBagTap: isSold
          ? () {}
          : () async {
              if (await SecureStorageService.isGuestUser()) {
                if (context.mounted) {
                  showDialog(
                    context: context,
                    builder: (ctx) => GuestRestrictionDialog(),
                  );
                }
                return;
              }
              if (context.mounted) {
                cartVm.addToCart(context, id: viewModel.productDetails.id);
              }
            },
      onPriceItTap: isSold
          ? () {}
          : () async {
              if (await SecureStorageService.isGuestUser()) {
                if (context.mounted) {
                  showDialog(
                    context: context,
                    builder: (ctx) => GuestRestrictionDialog(),
                  );
                }
                return;
              }
              if (!context.mounted) return;
              DetailsViewModel.showPriceInputDialog(
                context,
                price: (viewModel.productDetails.price ?? 0).toInt(),
                onSubmit: (price) {
                  final description =
                      "${profileVm.user?.username} make an Offer: ₦$price";
                  context.read<CartViewModel>().updateProductDetails(
                    context,
                    receiverId: viewModel.productDetails.seller?.id,
                    productId: context.read<HomeViewModel>().productDetails.id,
                    price: price,
                    description: description,
                  );
                },
              );
            },
      onBuyNowTap: isSold
          ? () {}
          : () async {
              if (await SecureStorageService.isGuestUser()) {
                if (context.mounted) {
                  showDialog(
                    context: context,
                    builder: (ctx) => GuestRestrictionDialog(),
                  );
                }
                return;
              }
              if (context.mounted) {
                final product = viewModel.productDetails.copyWith(quantity: 1);
                context.push('/checkout', extra: [product]);
              }
            },
    );
  }
}
