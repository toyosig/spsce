import 'package:circ/core/constant/global.dart';
import 'package:circ/data/models/chat/inbox/inbox_offers.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:go_router/go_router.dart';
import '../../view_model/chat_view_model.dart';

class OfferCard extends StatelessWidget {
  final dynamic message;
  final String price;
  final bool isMe;
  final String currentPrice;
  final DateTime createdAt;
  const OfferCard({
    super.key,
    required this.message,
    required this.price,
    required this.isMe,
    required this.currentPrice,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    final offer = message.offer;
    final product = offer?.product;
    final productImage = product?.photos[0] ?? '';
    final offerMessage = message.text ?? '';
    final currentUserId = getIt.get<ProfileViewModel>().user?.id;
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isMe
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Container(
            width: 280.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: isMe ? AppColors.chatgreen : AppColors.lightgreyshade,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 12.h,
                  ),
                  child: Text(
                    getOfferStatusMessage(
                      senderId: offer?.sender?.id,
                      currentUserId: currentUserId,
                      status: offer?.status,
                    ),
                    style: AppTextStyles.neueMontreal(
                      color: AppColors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  width: 280.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 20.h,
                  ),
                  margin: EdgeInsets.only(
                    bottom: 12.h,
                    left: 12.w,
                    right: 12.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: AppColors.white,
                  ),
                  child: Column(
                    spacing: 20.h,
                    crossAxisAlignment: isMe
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 20.w,
                        children: [
                          if (offerMessage.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8.h),
                                  child: Text(
                                    isMe
                                        ? 'Your Offer ${Formators.formatCurrency(offer.price)}'
                                        : 'Buyer Offer ${Formators.formatCurrency(offer.price)}',
                                    style: AppTextStyles.neueMontreal(
                                      color: AppColors.greenPrice,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Current Price ${Formators.formatCurrency(double.tryParse(currentPrice) ?? 0)}',
                                  style: AppTextStyles.neueMontreal(
                                    color: AppColors.greyText,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4.r),
                            child: NetworkImageHelper(
                              imagePath: productImage,
                              height: 40.h,
                              width: 40.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),

                      _OfferActionButtons(
                        viewModel: getIt.get<ChatViewModel>(),
                        myContext: context,
                        senderId: offer?.sender?.id,
                        offer: offer,
                        currentUserId: currentUserId,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            Formators.timeAgoSinceDate(createdAt),
            style: AppTextStyles.neueMontreal(
              color: Colors.black54,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  String getOfferStatusMessage({
    required String? senderId,
    required String? currentUserId,
    required String? status,
  }) {
    final isSender = senderId == currentUserId;

    switch (status?.toUpperCase()) {
      case "PENDING":
        return isSender ? "You made an offer" : "You have received an offer";
      case "ACCEPTED":
        return isSender ? "Your offer was accepted" : "You accepted the offer";
      case "DECLINED":
        return isSender ? "Your offer was rejected" : "You rejected the offer";
      case "FULFILLED":
        return "This offer has been fulfilled";
      case "EXPIRED":
        return "This offer has expired";
      default:
        return "Offer update";
    }
  }
}

class _OfferActionButtons extends StatelessWidget {
  final ChatViewModel viewModel;
  final BuildContext myContext;
  final String? senderId;
  final InboxOffers? offer;
  final String? currentUserId;
  const _OfferActionButtons({
    required this.viewModel,
    required this.myContext,
    required this.senderId,
    required this.offer,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    final product = offer?.product;
    final sellerId = product?.seller?.id;
    final offerStatus = offer?.status ?? "Pending";
    if (offerStatus == "EXPIRED") {
      return CustomAppButtons.primaryButton(
        text: "Expired",
        onTap: () {},
        width: double.infinity,
        backgroundColor: AppColors.white,
        textColor: Colors.black,
        boarderSideColor: AppColors.black,
      );
    }
    if (offerStatus == "ACCEPTED" && sellerId == currentUserId) {
      return CustomAppButtons.primaryButton(
        text: "Accepted",
        onTap: () {},
        width: double.infinity,
        backgroundColor: AppColors.black,
        textColor: Colors.white,
      );
    } else if (offerStatus == "ACCEPTED" && sellerId != currentUserId) {
      return CustomAppButtons.primaryButton(
        text: "Buy Now",
        onTap: () {
          myContext.push(
            '/checkout',
            extra: {
              'product': product,
              'offerId': offer?.id,
              'decidedPrice': offer?.price?.toDouble(),
            },
          );
        },
        width: double.infinity,
        backgroundColor: AppColors.black,
        textColor: Colors.white,
      );
    } else if (offerStatus == "PENDING" && senderId != currentUserId) {
      final isProductAvailable = (product?.quantity ?? 0) < 0;
      final isProductDeleted = product?.isDelete == true;

      String? getProductErrorMessage() {
        if (isProductDeleted) {
          return 'This product is deleted.';
        }
        if (isProductAvailable) {
          return 'This product is out of stock.';
        }
        return null;
      }

      final bool isActionDisabled = isProductDeleted || isProductAvailable;

      return Row(
        spacing: 5.h,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomAppButtons.primaryButton(
              height: 40.h,
              text: "Accept",
              padding: EdgeInsets.zero,
              onTap: () {
                final errorMsg = getProductErrorMessage();
                if (errorMsg != null) {
                  MessageHelper.showErrorMessage(context, errorMsg);
                  return;
                }
                viewModel.acceptOffer(offer?.id ?? '', myContext);
              },
              backgroundColor: !isActionDisabled
                  ? AppColors.black
                  : Colors.grey.shade300,
              boarderSideColor: !isActionDisabled
                  ? AppColors.black
                  : Colors.grey.shade300,
              textColor: !isActionDisabled ? AppColors.white : Colors.grey,
            ),
          ),

          Expanded(
            child: CustomAppButtons.primaryButton(
              height: 40.h,
              text: "Counter",
              padding: EdgeInsets.zero,
              onTap: () {
                final errorMsg = getProductErrorMessage();
                if (errorMsg != null) {
                  MessageHelper.showErrorMessage(context, errorMsg);
                  return;
                }
                viewModel.counterOffer(
                  offer?.id ?? '',
                  offer?.price ?? 0,
                  myContext,
                );
              },
              backgroundColor: !isActionDisabled
                  ? AppColors.white
                  : Colors.grey.shade300,
              boarderSideColor: !isActionDisabled
                  ? AppColors.black
                  : Colors.grey.shade300,
              textColor: !isActionDisabled ? AppColors.black : Colors.grey,
            ),
          ),
          Expanded(
            child: CustomAppButtons.primaryButton(
              height: 40.h,
              text: "Decline",
              padding: EdgeInsets.zero,
              onTap: () {
                final errorMsg = getProductErrorMessage();
                if (errorMsg != null) {
                  MessageHelper.showErrorMessage(context, errorMsg);
                  return;
                }
                viewModel.rejectOffer(offer?.id ?? '', myContext);
              },
              backgroundColor: !isActionDisabled
                  ? AppColors.white
                  : Colors.grey.shade300,
              boarderSideColor: !isActionDisabled
                  ? AppColors.black
                  : Colors.grey.shade300,
              textColor: !isActionDisabled ? AppColors.black : Colors.grey,
            ),
          ),
        ],
      );
    } else if (offerStatus == "PENDING" && senderId == currentUserId) {
      return CustomAppButtons.primaryButton(
        text: "Pending",
        onTap: () {},
        width: double.infinity,
        backgroundColor: AppColors.white,
        textColor: AppColors.black,
        boarderSideColor: AppColors.black,
      );
    } else if (offerStatus == "FULFILLED") {
      return CustomAppButtons.primaryButton(
        text: "Fulfilled",
        onTap: () {},
        width: double.infinity,
        backgroundColor: AppColors.white,
        textColor: Colors.black,
      );
    } else {
      return CustomAppButtons.primaryButton(
        text: "DECLINED",
        onTap: () {},
        width: double.infinity,
        backgroundColor: AppColors.white,
        textColor: Colors.black,
      );
    }
  }
}
