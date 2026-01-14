import 'package:circ/presentation/feature/cart_screen/view_model/cart_view_model.dart';
import 'package:circ/presentation/feature/home_screen/view_model/home_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constant/global.dart';
import '../widgets/product_detail_content.dart';
import '../widgets/product_detail_bottom_nav_bar.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, this.id});
  final String? id;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late HomeViewModel vm;
  late CartViewModel cartVm;

  @override
  void initState() {
    super.initState();
    vm = getIt.get<HomeViewModel>();
    cartVm = getIt.get<CartViewModel>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.clearDetailproduct();
      vm.init(context, id: widget.id);
    });
  }

  @override
  dispose() {
    super.dispose();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.clearDetailproduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    final CartViewModel cartVm = getIt.get<CartViewModel>();
    final profileVm = getIt.get<ProfileViewModel>();
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, _) {
        final bool isSellersProduct =
            viewModel.productDetails.seller?.id == profileVm.user?.id;
        return Scaffold(
          backgroundColor: AppColors.white,
          body: viewModel.productDetails.id == null
              ? null
              : ProductDetailContent(
                  isSellersProduct: isSellersProduct,
                  viewModel: viewModel,
                ),
          bottomNavigationBar: ProductDetailBottomNavBar(
            isSellersProduct: isSellersProduct,
            cartVm: cartVm,
            profileVm: profileVm,
            viewModel: viewModel,
            isSold: viewModel.productDetails.quantity == 0,
          ),
        );
      },
    );
  }
}
