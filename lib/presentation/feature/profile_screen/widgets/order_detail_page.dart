import 'package:circ/core/constant/global.dart';
import 'package:circ/data/models/sales/sales_order_model.dart';
import 'package:circ/presentation/feature/chat/view_model/chat_view_model.dart';
import 'package:circ/presentation/feature/checkout/view_model/check_out_vm.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/views/profile_screen.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/confirmation_dialog.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/order_recipt.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/order_status_timeline.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/order_status_widget.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/order_summary_section.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/rating_review_dialog.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/custom_primary_app_bar.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/custom_widgets/product_price_display.dart';
import 'shipping_info_section.dart';

class OrderDetailPage extends StatefulWidget {
  final int proIndex;
  final SalesOrderModel order;
  final bool isDispatched;
  final bool isDelivered;
  const OrderDetailPage({
    super.key,
    required this.order,
    required this.proIndex,
    required this.isDispatched,
    required this.isDelivered,
  });

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    final dispatch = order.items?[widget.proIndex].status == "DISPATCHED"
        ? true
        : false;
    final delivered = order.items?[widget.proIndex].status == "DELIVERED"
        ? true
        : false;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomPrimaryAppBar(
            title: 'Purchase Details',
            isBackButtonVisible: true,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.sp),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 10.sp,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            order.id!.length > 10
                                ? 'Order #${order.id!.substring(0, 10)}...'
                                : 'Order #${order.id!}',
                            style: AppTextStyles.neueMontreal(
                              fontSize: 16.sp,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          OrderStatusBadge(
                            hideSvg: true,
                            paymentStatus: order.paymentStatus,
                            isDelivered: widget.isDelivered,
                            isDispatched: widget.isDispatched,
                            cancel: order.items![widget.proIndex].status,
                          ),
                        ],
                      ),
                    ),

                    productCard(item: order.items![widget.proIndex]),
                    16.verticalSpace,
                    ShippingInformationSection(
                      order: order,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ),
                        );
                      },
                    ),
                    1.verticalSpace,
                    Text(
                      'Quick Actions',
                      style: AppTextStyles.neueMontreal(
                        fontSize: 18.sp,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (order.paymentStatus != "PAID" ||
                        order.items![widget.proIndex].status == "CANCELLED")
                      Container(
                        width: double.infinity,
                        height: 42.h,
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          color: Colors.red.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(8.r),
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
                                order.items![widget.proIndex].status ==
                                        "CANCELLED"
                                    ? "The order has been cancelled"
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
                      ),
                    Row(
                      spacing: 7.sp,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomAppButtons.primaryButton(
                            text: 'Need Help',
                            onTap: () {
                              context.push(
                                '/support',
                                extra: {
                                  'item': order.items![widget.proIndex],
                                  'orderId': order.id ?? '',
                                },
                              );
                            },
                            width: double.infinity,
                            backgroundColor: AppColors.white,
                            textColor: Colors.black87,
                            borderRadius: 20,
                          ),
                        ),
                        Expanded(
                          child: CustomAppButtons.primaryButton(
                            text: 'Message Seller',
                            onTap: () {
                              if (order.items == null ||
                                  order.items == null ||
                                  order
                                          .items![widget.proIndex]
                                          .product
                                          ?.seller ==
                                      null) {
                                return;
                              }
                              final chatViewModel = getIt.get<ChatViewModel>();

                              chatViewModel.navigateToChat(
                                context,
                                order.items![widget.proIndex].product?.seller,
                              );
                            },

                            width: double.infinity,
                            backgroundColor: AppColors.black,
                            textColor: AppColors.white,
                            borderRadius: 20,
                          ),
                        ),
                      ],
                    ),
                    if (order.items![widget.proIndex].status != "CANCELLED")
                      order.paymentStatus != "PAID" &&
                              order.items![widget.proIndex].status !=
                                  "CANCELLED"
                          ? CustomAppButtons.primaryIconButton(
                              text: 'Try Payment',
                              onTap: () {
                                final checkOutVm = getIt
                                    .get<CheckOutViewModel>();
                                final orderId = order.id!;
                                final prod = order.items?.first.product;
                                // if (order.paymentType == 'paystack') {
                                checkOutVm.handleReTryPaystackPayment(
                                  context,
                                  orderId: orderId,
                                  orderTotal: order.total!,
                                  products: prod!,
                                );
                                // }
                              },
                              width: double.infinity,
                              icon: Icons.warning,
                              iconColor: Colors.white,
                              backgroundColor: AppColors.black,
                              textColor: Colors.white,
                              borderRadius: 42.r,
                              borderColor: Colors.grey.shade400,
                            )
                          : Row(
                              spacing: 10.sp,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CustomAppButtons.primaryButton(
                                    text: 'View Reciept',
                                    onTap: () {
                                      showReceiptDialog(context, order);
                                    },
                                    backgroundColor: AppColors.white,
                                    textColor: Colors.black87,
                                    borderRadius: 20,
                                    width: double.infinity,
                                  ),
                                ),
                                if (dispatch == true)
                                  Expanded(
                                    child: CustomAppButtons.primaryButton(
                                      text: 'Mark Delivered',
                                      onTap: () {
                                        final ProfileViewModel
                                        profileViewModel = getIt
                                            .get<ProfileViewModel>();
                                        BuildContext dialogContext = context;
                                        showMarkDiliveredDialog(
                                          context: dialogContext,
                                          onbtnPressed: () {
                                            profileViewModel
                                                .markAsDelivered(
                                                  dialogContext,
                                                  order.id ?? '',
                                                  order
                                                          .items?[widget
                                                              .proIndex]
                                                          .id ??
                                                      '',
                                                )
                                                .then((e) {
                                                  if (context.mounted) {
                                                    dialogContext.pop();
                                                  }
                                                });
                                          },
                                        );
                                      },

                                      width: 160,
                                      backgroundColor: Colors.white,
                                      textColor: Colors.black87,
                                      borderRadius: 20,
                                    ),
                                  ),
                                if (dispatch == true && delivered == true)
                                  Expanded(
                                    child: CustomAppButtons.primaryButton(
                                      text: 'Leave Review',
                                      onTap: () {
                                        showRatingReviewDialog(
                                          context: context,
                                          sellerId: order
                                              .items![widget.proIndex]
                                              .product!
                                              .sellerId!,
                                        );
                                      },

                                      width: 160,
                                      backgroundColor: Colors.white,
                                      textColor: Colors.black87,
                                      borderRadius: 20,
                                    ),
                                  ),
                              ],
                            ),
                    10.verticalSpace,
                    Text(
                      "Order Status",
                      style: AppTextStyles.neueMontreal(
                        fontSize: 18.sp,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    OrderStatusTimeline(
                      createdAt: order.createdAt != null
                          ? DateTime.tryParse(order.createdAt!)
                          : null,
                      dispatched: dispatch,
                      delivered: delivered,
                      paymentCompleted: order.paymentStatus == "PAID",
                    ),
                    20.verticalSpace,
                    OrderSummarySection(
                      order: order,
                      itemModel:
                          order.items?[widget.proIndex] ??
                          SalesOrderItemModel(),
                    ),
                    // if (order.items![widget.proIndex].status == "DISPATCHED" ||
                    //     order.items![widget.proIndex].status == "FULFILLED")
                    //   CustomAppButtons.primaryIconButton(
                    //     text: 'Cancel Order',
                    //     onTap: () {
                    //       BuildContext dialogContext = context;
                    //       TextEditingController reasonController =
                    //           TextEditingController();
                    //       final formKey = GlobalKey<FormState>();
                    //       showDialog(
                    //         context: dialogContext,
                    //         barrierDismissible: false,
                    //         builder: (_) => Dialog(
                    //           backgroundColor: Colors.white,
                    //           insetPadding: EdgeInsets.symmetric(
                    //             horizontal: 24.w,
                    //           ),
                    //           shape: RoundedRectangleBorder(),
                    //           child: ActionDialogBox(
                    //             onSubmitText: "Cancel Order",
                    //             title: "Cancel Order",
                    //             subTitle: "Are you sure to cancel the order",
                    //             isSuccess: false,
                    //             field: Form(
                    //               key: formKey,
                    //               child: LabeledTextField(
                    //                 label: 'Reason',
                    //                 hintText: '200 Characters maximum',
                    //                 controller: reasonController,
                    //                 maxLines: 3,
                    //                 isTitleVisible: true,
                    //                 validator: FormValidators.validateReason,
                    //               ),
                    //             ),
                    //             onSubmitTap: () {
                    //               if (formKey.currentState!.validate()) {
                    //                 Navigator.of(dialogContext).pop();
                    //                 final profileVm = getIt
                    //                     .get<ProfileViewModel>();
                    //                 try {
                    //                   profileVm
                    //                       .cancelOrder(
                    //                         orderId: order.id!,
                    //                         itemId: order
                    //                             .items![widget.proIndex]
                    //                             .id!,
                    //                         reason: reasonController.text,
                    //                       )
                    //                       .then((val) {
                    //                         reasonController.clear();
                    //                         if (val.success == true &&
                    //                             context.mounted) {
                    //                           profileVm.getMyPurchases();
                    //                           context.pop();
                    //                           MessageHelper.showSuccessMessage(
                    //                             context,
                    //                             val.message ??
                    //                                 "Order has been Cancelled",
                    //                           );
                    //                         }
                    //                       });
                    //                 } catch (e) {
                    //                   MessageHelper.showErrorMessage(
                    //                     context,
                    //                     e.toString(),
                    //                   );
                    //                 }
                    //               }
                    //             },
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //     width: double.infinity,
                    //     icon: Icons.cancel,
                    //     iconColor: Colors.white,
                    //     backgroundColor: AppColors.primaryColor,
                    //     textColor: Colors.white,
                    //     borderRadius: 42.r,
                    //     borderColor: Colors.grey.shade400,
                    //   ),
                    16.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget productCard({required SalesOrderItemModel item}) {
    final product = item.product!;
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.lightbox,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: NetworkImageHelper(
              imagePath: product.photos?.first ?? '',
              height: 64.sp,
              width: 64.sp,
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
                      fontSize: 16.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  "Color :${product.color ?? ''}",
                  style: AppTextStyles.neueMontreal(
                    fontSize: 14.sp,
                    color: AppColors.lightblack.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Sold by ${product.seller?.username ?? ''}',
                  style: AppTextStyles.neueMontreal(
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                    fontSize: 14.sp,
                    color: AppColors.lightblack.withValues(alpha: 0.7),
                  ),
                ),
                Text(
                  'Ordered about ${Formators.timeAgoSinceDate(DateTime.parse(widget.order.createdAt ?? ''))}',
                  style: AppTextStyles.neueMontreal(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    height: 1.3,
                    fontSize: 13.sp,
                    color: AppColors.lightblack.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          ProductPriceDisplay(
            product: product,
            salesOrderItemModel: item,
            total: item.decidedPrice ?? 0,
          ),
        ],
      ),
    );
  }

  void showRatingReviewDialog({
    required BuildContext context,
    required String sellerId,
  }) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.white,
        // insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
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
        shape: RoundedRectangleBorder(),
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
}
