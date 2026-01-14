import 'package:circ/core/constant/global.dart';
import 'package:circ/data/models/home/products_data.dart';
import 'package:circ/presentation/feature/chat/view_model/chat_view_model.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../profile_screen/view_model/profile_view_model.dart';

class ProductOfferCard extends StatelessWidget {
  final ChatViewModel viewModel;
  final BuildContext myContext;

  const ProductOfferCard({
    super.key,
    required this.viewModel,
    required this.myContext,
  });

  @override
  Widget build(BuildContext context) {
    final product = viewModel.offers.first.product;
    if (product == null) return const SizedBox.shrink();

    return Consumer<ChatViewModel>(
      builder: (context, viewModel, child) {
        return viewModel.offers.isEmpty
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  margin: EdgeInsets.only(top: 15.h),
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ProductHeader(
                        viewModel: viewModel,
                        product: product,
                        price: double.tryParse(
                          viewModel.offers.first.price.toString(),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      _ProductImageAndDescription(product: product),
                      SizedBox(height: 10.h),
                      _OfferActionButtons(
                        viewModel: viewModel,
                        myContext: myContext,
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}

class _ProductHeader extends StatelessWidget {
  final ProductsData product; // ideally use a model class
  final double? price;
  final ChatViewModel viewModel;

  const _ProductHeader({
    required this.product,
    required this.price,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final offer = viewModel.offers.first;
    return Row(
      children: [
        CircleAvatar(
          radius: 16.r,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: NetworkImageHelper(
              imagePath: product.seller?.profilePic ?? '',
              fit: BoxFit.cover,
              height: 100.h,
              width: 100.w,
              isCircular: true,
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          offer.sender?.username ?? '',
          style: AppTextStyles.neueMontreal(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        10.horizontalSpace,
        Icon(Icons.star, color: Colors.amber, size: 16),
        Text("${offer.sender?.averageReview ?? 0}"),
        const Spacer(),
        Text(
          Formators.formatCurrency(price ?? 0),
          style: AppTextStyles.neueMontreal(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}

class _ProductImageAndDescription extends StatelessWidget {
  final dynamic product;

  const _ProductImageAndDescription({required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NetworkImageHelper(
          imagePath: product.photos?.isNotEmpty == true
              ? product.photos?.first ?? ''
              : '',
          fit: BoxFit.cover,
          height: 70.sp,
          width: 60.sp,
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            product.description ?? '',
            style: AppTextStyles.neueMontreal(
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontSize: 16.sp,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}

class _OfferActionButtons extends StatelessWidget {
  final ChatViewModel viewModel;
  final BuildContext myContext;
  const _OfferActionButtons({required this.viewModel, required this.myContext});

  @override
  Widget build(BuildContext context) {
    final profileVm = getIt.get<ProfileViewModel>();
    final senderId = viewModel.offers.first.senderId;
    final offerStatus = viewModel.offers.first.status ?? "Pending";
    final offer = viewModel.offers.first;
    final product = viewModel.offers.first.product;
    final sellerId = product?.seller?.id;
    if (offerStatus == "EXPIRED") {
      return CustomAppButtons.primaryButton(
        text: "Paid",
        onTap: () {},
        width: double.infinity,
        backgroundColor: AppColors.pink,
        textColor: Colors.white,
      );
    }
    if (offerStatus == "ACCEPTED" && sellerId == profileVm.user?.id) {
      return CustomAppButtons.primaryButton(
        text: "Accepted",
        onTap: () {},
        width: double.infinity,
        backgroundColor: AppColors.pink,
        textColor: Colors.white,
      );
    } else if (offerStatus == "ACCEPTED" && sellerId != profileVm.user?.id) {
      return CustomAppButtons.primaryButton(
        text: "Checkout",
        onTap: () {
          myContext.push(
            '/checkout',
            extra: {
              'product': product,
              'offerId': offer.id,
              'decidedPrice': offer.price?.toDouble(),
            },
          );
        },
        width: double.infinity,
        backgroundColor: AppColors.pink,
        textColor: Colors.white,
      );
    } else if (offerStatus == "PENDING" && senderId != profileVm.user?.id) {
      final isProductAvailable = (product?.quantity ?? 0) > 0;
      final isProductDeleted = product?.isDelete == true;

      String? getProductErrorMessage() {
        if (isProductDeleted) {
          return 'This product is deleted.';
        }
        if (!isProductAvailable) {
          return 'This product is out of stock.';
        }
        return null;
      }

      final bool isActionDisabled = isProductDeleted || !isProductAvailable;

      return Row(
        children: [
          Expanded(
            child: CustomAppButtons.primaryButton(
              width: double.infinity,
              text: "Reject",
              onTap: () {
                final errorMsg = getProductErrorMessage();
                if (errorMsg != null) {
                  MessageHelper.showErrorMessage(context, errorMsg);
                  return;
                }
                viewModel.rejectOffer(offer.id ?? '', myContext);
              },
              backgroundColor: !isActionDisabled
                  ? AppColors.white
                  : Colors.grey.shade300,
              boarderSideColor: !isActionDisabled
                  ? AppColors.primaryColor
                  : Colors.grey.shade300,
              textColor: !isActionDisabled ? Colors.pink : Colors.grey,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: CustomAppButtons.primaryButton(
              width: double.infinity,
              text: "Accept",
              onTap: () {
                final errorMsg = getProductErrorMessage();
                if (errorMsg != null) {
                  MessageHelper.showErrorMessage(context, errorMsg);
                  return;
                }
                viewModel.acceptOffer(offer.id ?? '', myContext);
              },
              backgroundColor: !isActionDisabled
                  ? AppColors.pink
                  : Colors.grey.shade300,
              boarderSideColor: !isActionDisabled
                  ? AppColors.primaryColor
                  : Colors.grey.shade300,
              textColor: !isActionDisabled ? Colors.white : Colors.grey,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: CustomAppButtons.primaryButton(
              text: "Counter",
              width: double.infinity,
              onTap: () {
                final errorMsg = getProductErrorMessage();
                if (errorMsg != null) {
                  MessageHelper.showErrorMessage(context, errorMsg);
                  return;
                }
                viewModel.counterOffer(
                  offer.id ?? '',
                  offer.price ?? 0,
                  myContext,
                );
              },
              backgroundColor: !isActionDisabled
                  ? AppColors.primaryColor
                  : Colors.grey.shade300,
              boarderSideColor: !isActionDisabled
                  ? AppColors.primaryColor
                  : Colors.grey.shade300,
              textColor: !isActionDisabled ? Colors.white : Colors.grey,
            ),
          ),
        ],
      );
    } else if (offerStatus == "PENDING" && senderId == profileVm.user?.id) {
      return CustomAppButtons.primaryButton(
        text: "Pending",
        onTap: () {},
        width: double.infinity,
        backgroundColor: AppColors.pink,
        textColor: Colors.white,
      );
    } else {
      return CustomAppButtons.primaryButton(
        text: "Rejected",
        onTap: () {},
        width: double.infinity,
        backgroundColor: AppColors.pink,
        textColor: Colors.white,
      );
    }
  }
}
