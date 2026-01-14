import 'package:circ/core/constant/global.dart';
import 'package:circ/data/models/sales/sales_order_model.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:circ/presentation/feature/profile_screen/views/other_profile_screen.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/dispached_confirmation_dialog.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/order_status_widget.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/order_summary_section.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/custom_primary_app_bar.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/order_status_timeline.dart';
import 'package:provider/provider.dart';
import '../../../../../../utils/custom_widgets/product_price_display.dart';
import '../../shipping_info_section.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import '../../confirmation_dialog.dart';

class SoldOrderDetailPage extends StatelessWidget {
  final int proIndex;
  final SalesOrderModel order;
  final bool isDispatched;
  final bool isDelivered;
  const SoldOrderDetailPage({
    super.key,
    required this.order,
    required this.proIndex,
    required this.isDispatched,
    required this.isDelivered,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<ProfileViewModel>(
        builder: (context, profileViewModel, child) {
          return Column(
            children: [
              CustomPrimaryAppBar(
                title: 'Sales Details',
                isBackButtonVisible: true,
                notiNumber: 0,
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
                                isDelivered: isDelivered,
                                isDispatched: isDispatched,
                                paymentStatus: order.paymentStatus,
                                cancel: order.items![proIndex].status,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Sold Item",
                          style: AppTextStyles.neueMontreal(
                            fontSize: 18.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        _productCard(item: order.items![proIndex]),
                        10.verticalSpace,

                        ShippingInformationSection(
                          order: order,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => OthersProfileScreen(
                                  userId: order.buyer?.id ?? '',
                                ),
                              ),
                            );
                          },
                        ),
                        10.verticalSpace,
                        Text(
                          'After Sales Checklist',
                          style: AppTextStyles.neueMontreal(
                            fontSize: 18.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        10.verticalSpace,
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 12.sp,
                            horizontal: 16.sp,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Column(
                            children: [
                              checkListItem(
                                title:
                                    'Find a courier/dispatch service to ship the item. See some recommendations below',
                              ),

                              10.verticalSpace,
                              Row(
                                children: [
                                  SizedBox(width: 20.sp, height: 20.sp),
                                  8.horizontalSpace,
                                  GestureDetector(
                                    onTap: _openKwikApp,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4.r),
                                      child: Image.asset(
                                        'assets/partners/kwik.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                  ),
                                  8.horizontalSpace,
                                  GestureDetector(
                                    onTap: _openUberApp,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50.r),
                                      child: Image.asset(
                                        'assets/partners/uber.png',
                                        width: 52,
                                        height: 52,
                                      ),
                                    ),
                                  ),
                                  8.horizontalSpace,
                                  GestureDetector(
                                    onTap: _openGokadaApp,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4.r),
                                      child: Image.asset(
                                        'assets/partners/gokada.jpeg',
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              10.verticalSpace,
                              checkListItem(
                                title:
                                    'Get the delivery fee from the dispatch service and inform the buyer',
                              ),

                              10.verticalSpace,
                              checkListItem(
                                title: 'Agree on payment method with the buyer',
                              ),

                              10.verticalSpace,
                              checkListItem(
                                title: 'Ship the item for delivery',
                              ),

                              10.verticalSpace,
                              checkListItem(title: 'Mark order as dispatched'),
                            ],
                          ),
                        ),
                        10.verticalSpace,
                        Text(
                          'Quick Actions',
                          style: AppTextStyles.neueMontreal(
                            fontSize: 18.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (order.paymentStatus != "PAID" ||
                            order.items![proIndex].status == "CANCELLED")
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
                                Icon(
                                  Icons.warning,
                                  color: Colors.red,
                                  size: 20.sp,
                                ),
                                SizedBox(width: 8.w),
                                Center(
                                  child: Text(
                                    order.items![proIndex].status == "CANCELLED"
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
                          )
                        else
                          Row(
                            spacing: 10.sp,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CustomAppButtons.primaryButton(
                                  text: 'Mark as Dispatch',
                                  width: double.infinity,
                                  onTap: () {
                                    final ProfileViewModel profileViewModel =
                                        getIt.get<ProfileViewModel>();
                                    BuildContext dialogContext = context;
                                    showMarkDispachedDialog(
                                      imgUrl:
                                          order
                                              .items![proIndex]
                                              .product
                                              ?.photos
                                              ?.first ??
                                          "",
                                      context: dialogContext,
                                      onbtnPressed: () {
                                        profileViewModel
                                            .markAsDispatch(
                                              context,
                                              order.id ?? '',
                                              order.items![proIndex].id ?? '',
                                            )
                                            .then((e) {
                                              if (context.mounted) {
                                                context.pop();
                                              }
                                            });
                                      },
                                    );
                                  },

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
                          paymentCompleted: order.paymentStatus == "PAID",
                          createdAt: order.createdAt != null
                              ? DateTime.tryParse(order.createdAt!)
                              : null,
                          dispatched: isDispatched,
                          delivered: isDelivered,
                        ),
                        20.verticalSpace,
                        OrderSummarySection(
                          order: order,
                          itemModel:
                              order.items?[proIndex] ?? SalesOrderItemModel(),
                        ),

                        16.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget checkListItem({required String title}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: SvgPicture.asset(
            'assets/svg/info.svg',
            width: 20.sp,
            height: 20.sp,
          ),
        ),
        8.horizontalSpace,
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.neueMontreal(
              fontSize: 13.sp,
              color: Color(0xFF000000).withValues(alpha: 0.7),
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _productCard({required SalesOrderItemModel item}) {
    final product = item.product!;
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
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
                  'Buyer: ${order.fullName ?? ''}',
                  style: AppTextStyles.neueMontreal(
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                    fontSize: 14.sp,
                    color: AppColors.lightblack.withValues(alpha: 0.7),
                  ),
                ),
                Text(
                  'Ordered about ${Formators.timeAgoSinceDate(DateTime.parse(product.createdAt ?? ''))}',
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

  void showMarkDispachedDialog({
    required BuildContext context,
    required VoidCallback? onbtnPressed,
    required String imgUrl,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        backgroundColor: Colors.white,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
        shape: RoundedRectangleBorder(),
        child: DispachedConfirmationDialog(
          imgUrl: imgUrl,
          onSubmitTap: onbtnPressed ?? () {},
        ),
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

  Future<void> _openKwikApp() async {
    await LaunchApp.openApp(
      androidPackageName: 'com.kwik.customer',
      iosUrlScheme: 'kwik://',
      appStoreLink: 'https://apps.apple.com/in/app/kwik-delivery/id1469870846',
      openStore: true,
    );
  }

  Future<void> _openUberApp() async {
    await LaunchApp.openApp(
      androidPackageName: 'com.ubercab',
      iosUrlScheme: 'uber://',
      appStoreLink: 'https://apps.apple.com/app/uber/id368677368',
      openStore: true,
    );
  }

  Future<void> _openGokadaApp() async {
    await LaunchApp.openApp(
      androidPackageName: 'ng.gokada.superapp_client',
      iosUrlScheme: 'gokada://',
      appStoreLink: 'https://apps.apple.com/us/app/gokada-superapp/id1560095848',
      openStore: true,
    );
  }
}
