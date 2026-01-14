import 'package:circ/core/constant/global.dart';
import 'package:circ/data/models/sales/sales_order_model.dart';
import 'package:circ/presentation/feature/chat/view_model/chat_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/confirmation_dialog.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/order_recipt.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/order_status_widget.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/rating_review_dialog.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PurchaseCard extends StatelessWidget {
  final SalesOrderModel order;

  const PurchaseCard({super.key, required this.order});

  void showRatingReviewDialog({
    required BuildContext context,
    required String sellerId,
  }) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.r)),
        child: RatingAndReviewDialogContent(sellerId: sellerId),
      ),
    );
  }

  void showMarkDiliveredDialog({
    required BuildContext context,
    required VoidCallback? onbtnPressed,
  }) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.white,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.r)),
        child: ConfirmationDialog(onSubmitTap: onbtnPressed ?? () {}),
      ),
    );
  }

  void showReceiptDialog(BuildContext context, SalesOrderModel order) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.white,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
        shape: RoundedRectangleBorder(),
        child: OrderRecipt(order: order),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10.sp),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: order.items?.length ?? 0,
      itemBuilder: (context, index) {
        final dispatch = order.items?[index].status == "DISPATCH";
        final delivered = order.items?[index].status == "DELIVERED";
        return GestureDetector(
          onTap: () {
            context.push(
              '/orderDetail',
              extra: {
                'index': index,
                'order': order,
                'isDelivered': delivered,
                'isDispatched': dispatch,
              },
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              spacing: 10.sp,
              children: [
                _productCard(item: order.items![index], order: order),
                3.verticalSpace,
                Row(
                  spacing: 7.sp,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomAppButtons.primaryIconButton(
                        text: 'Need Help',
                        onTap: () {
                          context.push(
                            '/support',
                            extra: {
                              'item': order.items![index],
                              'orderId': order.id ?? '',
                            },
                          );
                        },
                        icon: Icons.info_outline,
                        iconColor: Colors.black87,
                        width: 160.w,
                        backgroundColor: AppColors.white,
                        textColor: Colors.black87,
                        borderRadius: 42.r,
                        borderColor: Colors.grey.shade400,
                      ),
                    ),
                    Expanded(
                      child: CustomAppButtons.primaryIconButton(
                        text: 'Message Seller',
                        onTap: () {
                          if (order.items == null ||
                              order.items == null ||
                              order.items![index].product?.seller == null) {
                            return;
                          }
                          final chatViewModel = getIt.get<ChatViewModel>();

                          chatViewModel.navigateToChat(
                            context,
                            order.items![index].product?.seller,
                          );
                        },
                        icon: Icons.chat_bubble_outline,
                        iconColor: Colors.white,
                        width: 160.w,
                        backgroundColor: AppColors.black,
                        textColor: Colors.white,
                        borderRadius: 42.r,
                        borderColor: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
                order.paymentStatus != "PAID" ||
                        order.items?[index].status == "CANCELLED"
                    ? Container(
                        width: double.infinity,
                        height: 42.h,
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          color: Colors.red.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(42.r),
                          border: Border.all(color: Colors.red, width: 1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.warning, color: Colors.red, size: 20.sp),
                            SizedBox(width: 8.w),
                            Center(
                              child: Text(
                                order.items?[index].status == "CANCELLED"
                                    ? "The order has been canceled"
                                    : "The payment is not done yet",
                                style: AppTextStyles.neueMontreal(
                                  color: Colors.red,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Row(
                        spacing: 10.sp,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomAppButtons.primaryIconButton(
                              text: 'View Reciept',
                              onTap: () {
                                showReceiptDialog(context, order);
                              },
                              icon: Icons.receipt_long_outlined,
                              iconColor: Colors.black87,
                              backgroundColor: AppColors.white,
                              textColor: Colors.black87,
                              borderRadius: 42.r,
                              borderColor: Colors.grey.shade400,
                            ),
                          ),
                          if (order.items?[index].status == "DISPATCHED")
                            Expanded(
                              child: CustomAppButtons.primaryIconButton(
                                text: 'Mark as Deliverd',
                                onTap: () {
                                  final ProfileViewModel profileViewModel =
                                      getIt.get<ProfileViewModel>();
                                  BuildContext dialogContext = context;
                                  showMarkDiliveredDialog(
                                    context: dialogContext,
                                    onbtnPressed: () {
                                      profileViewModel
                                          .markAsDelivered(
                                            dialogContext,
                                            order.id ?? '',
                                            order.items?[index].id ?? '',
                                          )
                                          .then((e) {
                                            if (dialogContext.mounted) {
                                              dialogContext.pop();
                                            }
                                          });
                                    },
                                  );
                                },
                                icon: Icons.local_shipping_outlined,
                                iconColor: Colors.black87,
                                width: 160.w,
                                backgroundColor: Colors.white,
                                textColor: Colors.black87,
                                borderRadius: 42.r,
                                borderColor: Colors.grey.shade400,
                              ),
                            ),
                          if (delivered == true)
                            Expanded(
                              child: CustomAppButtons.primaryIconButton(
                                text: 'Leave Review',
                                onTap: () {
                                  showRatingReviewDialog(
                                    context: context,
                                    sellerId:
                                        order.items![index].product!.sellerId!,
                                  );
                                },
                                icon: Icons.star_border_outlined,
                                iconColor: Colors.black87,
                                width: 160,
                                backgroundColor: Colors.white,
                                textColor: Colors.black87,
                                borderRadius: 42.r,
                                borderColor: Colors.grey.shade400,
                              ),
                            ),
                        ],
                      ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _productCard({required SalesOrderItemModel item,
    required SalesOrderModel order,
  }) {
    final product = item.product!;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: NetworkImageHelper(
            imagePath: product.photos?.first ?? '',
            height: 80.sp,
            width: 80.sp,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            spacing: 4.sp,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.sp),
                child: Text(
                  product.title ?? '',
                  style: AppTextStyles.neueMontreal(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                (() {
                  if (product.sizes != null && product.sizes!.isNotEmpty) {
                    final sizeDisplay = product.sizes!.entries
                        .expand(
                          (entry) =>
                              entry.value.map((v) => '${entry.key}-${v.value}'),
                        )
                        .join(', ');
                    return 'Size $sizeDisplay';
                  }
                  return 'Size';
                })(),
                style: AppTextStyles.neueMontreal(
                  fontSize: 14.sp,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Sold by ${product.seller?.username ?? ''}',
                style: AppTextStyles.neueMontreal(
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                  fontSize: 14.sp,
                  color: Colors.black54,
                ),
              ),
              Text(
                Formators.timeAgoSinceDate(
                  DateTime.parse(order.createdAt ?? ''),
                ),
                style: AppTextStyles.neueMontreal(
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                  fontSize: 14.sp,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            item.decidedPrice != product.price
                ? Row(
                    children: [
                      Text(
                        Formators.formatCurrency(product.price ?? 0),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,

                          decorationColor: Colors.red,
                          decorationThickness: 1.9.r,
                        ),
                      ),
                      5.horizontalSpace,
                      Text(
                        Formators.formatCurrency(item.decidedPrice ?? 0),
                        style: AppTextStyles.neueMontreal(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  )
                : Text(
                    Formators.formatCurrency(product.price ?? 0),
                    style: AppTextStyles.neueMontreal(
                      fontSize: 18.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
            10.verticalSpace,
            OrderStatusBadge(
              paymentStatus: order.paymentStatus,
              cancel: item.status,
              isDelivered: item.status == "DELIVERED" ? true : false,
              isDispatched: item.status == "DISPATCHED" ? true : false,
            ),
          ],
        ),
      ],
    );
  }
}
