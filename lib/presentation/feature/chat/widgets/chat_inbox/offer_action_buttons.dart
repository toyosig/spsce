import 'package:flutter/material.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:circ/presentation/feature/chat/view_model/chat_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:go_router/go_router.dart';

class OfferActionButtons extends StatelessWidget {
  final dynamic offer;
  final dynamic product;
  final bool isMe;
  final ChatViewModel chatViewModel;
  final ProfileViewModel profileVm;
  final BuildContext myContext;
  final bool showCheckout;

  const OfferActionButtons({
    super.key,
    required this.offer,
    required this.product,
    required this.isMe,
    required this.chatViewModel,
    required this.profileVm,
    required this.myContext,
    this.showCheckout = false,
  });

  @override
  Widget build(BuildContext context) {
    final senderId = offer?.senderId;
    final offerStatus = (offer?.status ?? "PENDING").toUpperCase();
    final sellerId = product?.seller?.id;
    final bool isProductAvailable = (product?.quantity ?? 0) > 0;
    final bool isProductDeleted = product?.isDelete == true;
    final bool isSeller = sellerId == profileVm.user?.id;

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

    // Status logic
    if (offerStatus == "EXPIRED") {
      return CustomAppButtons.primaryButton( 
        text: "Paid",
        onTap: () {},
        width: double.infinity,
        backgroundColor: AppColors.pink,
        textColor: Colors.white,
      );
    }
    if (offerStatus == "ACCEPTED" && isSeller) {
      return CustomAppButtons.primaryButton(
        text: "Accepted",
        onTap: () {},
        width: double.infinity,
        backgroundColor: AppColors.pink,
        textColor: Colors.white,
      );
    } else if (offerStatus == "ACCEPTED" && !isSeller && showCheckout) {
      return CustomAppButtons.primaryButton(
        text: "Checkout",
        onTap: () {
          GoRouter.of(myContext).push(
            '/checkout',
            extra: {
              'product': product,
              'offerId': offer?.id,
              'decidedPrice': offer?.price?.toDouble(),
            },
          );
        },
        width: double.infinity,
        backgroundColor: AppColors.pink,
        textColor: Colors.white,
      );
    } else if (offerStatus == "PENDING" && senderId != profileVm.user?.id) {
      return Column(
        children: [
          Expanded(
            child: isMe
                ? CustomAppButtons.secondaryButton(
                    width: double.infinity,
                    text: "Reject",
                    onTap: () {
                      final errorMsg = getProductErrorMessage();
                      if (errorMsg != null) {
                        MessageHelper.showErrorMessage(context, errorMsg);
                        return;
                      }
                      chatViewModel.rejectOffer(offer?.id ?? '', myContext);
                    },
                    borderColor: !isActionDisabled
                        ? AppColors.primaryColor
                        : Colors.grey.shade300,
                    backgroundColor: AppColors.white,
                    textColor: !isActionDisabled ? Colors.pink : Colors.grey,
                  )
                : CustomAppButtons.primaryButton(
                    width: double.infinity,
                    text: "Reject",
                    onTap: () {
                      final errorMsg = getProductErrorMessage();
                      if (errorMsg != null) {
                        MessageHelper.showErrorMessage(context, errorMsg);
                        return;
                      }
                      chatViewModel.rejectOffer(offer?.id ?? '', myContext);
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
          SizedBox(width: 10),
          Expanded(
            child: isMe
                ? CustomAppButtons.secondaryButton(
                    width: double.infinity,
                    text: "Accept",
                    onTap: () {
                      final errorMsg = getProductErrorMessage();
                      if (errorMsg != null) {
                        MessageHelper.showErrorMessage(context, errorMsg);
                        return;
                      }
                      chatViewModel.acceptOffer(offer?.id ?? '', myContext);
                    },
                    borderColor: !isActionDisabled
                        ? AppColors.primaryColor
                        : Colors.grey.shade300,
                    backgroundColor: AppColors.white,
                    textColor: !isActionDisabled ? Colors.pink : Colors.grey,
                  )
                : CustomAppButtons.primaryButton(
                    width: double.infinity,
                    text: "Accept",
                    onTap: () {
                      final errorMsg = getProductErrorMessage();
                      if (errorMsg != null) {
                        MessageHelper.showErrorMessage(context, errorMsg);
                        return;
                      }
                      chatViewModel.acceptOffer(offer?.id ?? '', myContext);
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
          SizedBox(width: 10),
          Expanded(
            child: isMe
                ? CustomAppButtons.secondaryButton(
                    text: "Counter",
                    width: double.infinity,
                    onTap: () {
                      final errorMsg = getProductErrorMessage();
                      if (errorMsg != null) {
                        MessageHelper.showErrorMessage(context, errorMsg);
                        return;
                      }
                      chatViewModel.counterOffer(
                        offer?.id ?? '',
                        offer?.price ?? 0,
                        myContext,
                      );
                    },
                    borderColor: !isActionDisabled
                        ? AppColors.primaryColor
                        : Colors.grey.shade300,
                    backgroundColor: AppColors.white,
                    textColor: !isActionDisabled ? Colors.pink : Colors.grey,
                  )
                : CustomAppButtons.primaryButton(
                    text: "Counter",
                    width: double.infinity,
                    onTap: () {
                      final errorMsg = getProductErrorMessage();
                      if (errorMsg != null) {
                        MessageHelper.showErrorMessage(context, errorMsg);
                        return;
                      }
                      chatViewModel.counterOffer(
                        offer?.id ?? '',
                        offer?.price ?? 0,
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
    } else if (offerStatus == "REJECTED") {
      return CustomAppButtons.primaryButton(
        text: "Rejected",
        onTap: () {},
        width: double.infinity,
        backgroundColor: AppColors.pink,
        textColor: Colors.white,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
