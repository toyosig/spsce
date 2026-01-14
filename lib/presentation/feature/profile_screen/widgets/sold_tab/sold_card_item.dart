import 'package:circ/presentation/feature/profile_screen/widgets/order_status_widget.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circ/data/models/sales/sales_order_model.dart';
import 'order_actions.dart';
import 'package:go_router/go_router.dart';

class SoldCardItem extends StatelessWidget {
  final SalesOrderModel order;
  final int index;
  const SoldCardItem({required this.order, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final itemStatus = order.items?[index].status ?? '';
        final isDelivered = itemStatus == "DELIVERED";
        final isDispatched = itemStatus == "DISPATCHED";

        context.push(
          '/soldOrderDetail',
          extra: {
            'index': index,
            'order': order,
            'isDelivered': isDelivered,
            'isDispatched': isDispatched,
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
          spacing: 13.h,
          children: [
            productCard(item: order.items![index]),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ClipOval(
                  child: NetworkImageHelper(
                    fit: BoxFit.cover,
                    isCircular: true,
                    height: 25.h,
                    width: 25.h,
                    imagePath:
                        order.buyer?.avatarUrl ?? 'assets/images/user.png',
                  ),
                ),
                5.horizontalSpace,
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Purchased by - ',
                        style: AppTextStyles.neueMontreal(
                          fontSize: 14.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '${order.buyer?.username} ',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            OrderActions(order: order, index: index),
          ],
        ),
      ),
    );
  }

  Widget productCard({required SalesOrderItemModel item}) {
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
                    height: 1.5,
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
                  height: 1.5,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Text(
                Formators.timeAgoSinceDate(
                  DateTime.parse(product.createdAt ?? ''),
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
                          fontWeight: FontWeight.w600,
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
              isDelivered: order.items?[index].status == "DELIVERED"
                  ? true
                  : false,
              isDispatched: order.items?[index].status == "DISPATCHED"
                  ? true
                  : false,
              paymentStatus: order.paymentStatus,
              cancel: order.items?[index].status,
            ),
          ],
        ),
      ],
    );
  }
}
