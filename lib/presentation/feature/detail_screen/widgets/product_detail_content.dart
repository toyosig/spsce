import 'package:circ/domain/services/secure_storage_services.dart';
import 'package:circ/presentation/feature/detail_screen/widgets/product_card/custom_detail_card.dart';
import 'package:circ/presentation/feature/detail_screen/widgets/shipping_card.dart';
import 'package:circ/presentation/feature/detail_screen/widgets/shop_info_card.dart';
import 'package:circ/presentation/feature/home_screen/view_model/home_view_model.dart';
import 'package:circ/utils/constants/custom_primary_app_bar.dart';
import 'package:circ/utils/custom_widgets/guest_restriction_dialog.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant/global.dart';
import '../../../../data/models/auth/auth_user_model.dart';
import '../../detail_screen/view_model/details_view_model.dart';
import '../widgets/description_widget.dart';
import '../widgets/tags_widget.dart';

class ProductDetailContent extends StatelessWidget {
  const ProductDetailContent({
    super.key,
    required this.isSellersProduct,
    required this.viewModel,
  });

  final bool isSellersProduct;
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPrimaryAppBar(
          title: 'Product Details',
          showTrailing: true,
          notiNumber: 0,
          isBackButtonVisible: true,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: ProductDetailBody(
              isSellersProduct: isSellersProduct,
              onSellerProductPress: isSellersProduct
                  ? () async {
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
                        DetailsViewModel.showSellerProductOptions(
                          context: context,
                          product: viewModel.productDetails,
                          onEdit: () {
                            context.push(
                              '/sellItem',
                              extra: {
                                'product': viewModel.productDetails,
                                'isEdit': true,
                              },
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
                        );
                      }
                    }
                  : null,
            ),
          ),
        ).animate().fadeIn(delay: 200.ms, duration: 300.ms),
      ],
    );
  }
}

class ProductDetailBody extends StatelessWidget {
  final bool isSellersProduct;
  final VoidCallback? onSellerProductPress;
  const ProductDetailBody({
    super.key,
    required this.isSellersProduct,
    this.onSellerProductPress,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductDetailCard(
              product: viewModel.productDetails,
              isSellerProduct: isSellersProduct,
              onSellerProductPress: onSellerProductPress,
              onFavoriteToggle: () {
                viewModel.toggleFavourite(
                  context,
                  id: viewModel.productDetails.id,
                );
                viewModel.getProductsById(
                  context,
                  id: viewModel.productDetails.id,
                );
              },
            ),
            if (viewModel.productDetails.description != null ||
                viewModel.productDetails.title != null)
              DescriptionWidget(
                title: viewModel.productDetails.title,
                description: viewModel.productDetails.description,
              ),
            if ((viewModel.productDetails.tags?.isNotEmpty ?? false)) ...[
              TagsWidget(tagList: viewModel.productDetails.tags),
              15.verticalSpace,
            ],
            if (viewModel.productDetails.shippingFrom?.name != null ||
                viewModel.productDetails.shippingTo != null)
              ShippingCard(
                shippingFrom: viewModel.productDetails.shippingFrom?.name,
                shippingTo: viewModel.productDetails.shippingTo,
              ),

            Consumer(
              builder: (context, viewMode, _) {
                return ShopInfoCard(
                  seller: viewModel.productDetails.seller ?? AuthUserModel(),
                  showReviews:
                      (viewModel.productDetails.seller?.averageReview != null &&
                      viewModel.productDetails.seller?.averageReview != 0.0),
                  onMessageTap: () async {
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
                      context.push(
                        '/chatInbox',
                        extra: {
                          "other_user_id": viewModel.productDetails.seller?.id,
                          "name": viewModel.productDetails.seller?.username,
                          "imagePath":
                              viewModel.productDetails.seller?.profilePic,
                        },
                      );
                    }
                  },
                  onShopTap: () async {
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
                      context.push(
                        '/othersProfile',
                        extra: viewModel.productDetails.seller?.id,
                      );
                    }
                  },
                );
              },
            ),
            8.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Information on Delivery',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                  ),
                  16.verticalSpace,
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: Column(
                        children: [
                          InformationLine(
                            text: 'Seller to arrange delivery after purchase',
                          ),
                          16.verticalSpace,
                          InformationLine(
                            text: 'Buyer pays for delivery off-app',
                          ),
                          16.verticalSpace,
                          InformationLine(
                            text:
                                'Message seller before you make a purcahse to\nconfirm the delivery fee',
                          ),
                        ],
                      ),
                    ),
                  ),
                  16.verticalSpace,
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class InformationLine extends StatelessWidget {
  const InformationLine({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/svg/info.svg'),
        8.horizontalSpace,
        Text(
          text,
          maxLines: 2,
          style: AppTextStyles.neueMontreal(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
