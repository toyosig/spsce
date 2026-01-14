import 'package:circ/core/widgets/no_results_found.dart';
import 'package:circ/presentation/feature/cart_screen/view_model/cart_view_model.dart';
import 'package:circ/presentation/feature/cart_screen/widgets/cart_item_card.dart';
import 'package:circ/presentation/feature/cart_screen/widgets/cart_summary.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/custom_primary_app_bar.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant/global.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<CartViewModel>().init(context);

      final cartViewModel = getIt.get<CartViewModel>();
      await cartViewModel.fetchMarketplaceFee();
      if (mounted) {
        cartViewModel.setMarketplaceFee(
          context.read<CartViewModel>().cartProducts,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Consumer<CartViewModel>(
        builder: (context, viewModel, _) {
          return Column(
            children: [
              CustomPrimaryAppBar(title: 'My Bag', isBackButtonVisible: true),
              CartScreenBody(viewModel: viewModel),
            ],
          );
        },
      ),
    );
  }
}

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key, required this.viewModel});
  final CartViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          viewModel.cartProducts.isEmpty
              ? Expanded(child: NoResultsFound())
              : CartList(viewModel: viewModel),
          viewModel.cartProducts.isEmpty
              ? const SizedBox()
              : CartSummaryBox(
                  subtotal: viewModel.selectedSubtotal,
                  marketplaceFeeAmount: viewModel.selectedMarketplaceFee,
                  marketplaceFeePercentage: viewModel.marketplaceFeePercentage,
                  total: viewModel.selectedTotal,
                  onTap: () {
                    if (viewModel.selectedProducts.isEmpty) {
                      MessageHelper.showErrorMessage(
                        context,
                        "Please select at least one item",
                      );
                      return;
                    }
                    context.push(
                      '/checkout',
                      extra: viewModel.selectedProducts,
                    );
                  },
                ),
        ],
      ),
    );
  }
}

class CartList extends StatefulWidget {
  const CartList({super.key, required this.viewModel});
  final CartViewModel viewModel;

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  final Set<int> animatedIndices = {};

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: widget.viewModel.cartProducts.length,
        padding: const EdgeInsets.symmetric(vertical: 15),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final product = widget.viewModel.cartProducts[index];
          final hasAnimated = animatedIndices.contains(index);
          if (!hasAnimated) {
            animatedIndices.add(index);
          }

          Widget item = CartItemCard(
            productId: product.id!,
            imagePath: (product.photos?.isNotEmpty ?? false)
                ? product.photos![0]
                : '',
            title: product.title ?? 'Product Title',
            brand: product.brand?.name ?? 'Brand Name',
            size:
                product.sizes?.entries
                    .expand(
                      (entry) =>
                          entry.value.map((v) => '${entry.key}-${v.value}'),
                    )
                    .join(', ') ??
                '',
            quantity: widget.viewModel.getQuantity(product.id!),
            price: double.tryParse(product.price.toString()) ?? 5000.0,
            onDelete: () {
              widget.viewModel.removeFromCart(context, id: product.id);
            },
            onDecrement: () => widget.viewModel.decrementQuantity(product.id!),
            onIncrement: () => widget.viewModel.incrementQuantity(
              product.id!,
              context: context,
            ),
          );

          return hasAnimated
              ? item
              : item.animate(
                  delay: Duration(milliseconds: index * 100),
                  effects: const [
                    MoveEffect(
                      begin: Offset(200, 0),
                      end: Offset(0, 0),
                      curve: Curves.easeOut,
                      duration: Duration(milliseconds: 400),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
