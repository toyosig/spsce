import 'package:circ/data/models/sales/sales_order_model.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/app_images.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderRecipt extends StatelessWidget {
  final SalesOrderModel order;
  const OrderRecipt({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    double subTotal = 0.0;
    if (order.items != null && order.items!.isNotEmpty) {
      for (var item in order.items!) {
        final itemPrice = item.decidedPrice ?? 0;
        final itemQuantity = item.quantity ?? 1;
        subTotal += itemPrice * itemQuantity;
      }
    }
    final double marketplaceFeePercent = order.marketplaceFee ?? 0;
    final double fee = subTotal * marketplaceFeePercent / 100;
    final double total = subTotal + fee;


    return Padding(
      padding: EdgeInsets.all(20.r),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(14.sp),
                    decoration: BoxDecoration(
                      color: Color(0xFFFF4D8C).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    ),
                    child: SvgPicture.asset(
                      AppImages.reciptIcon,
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                  12.verticalSpace,
                  Text(
                    'Payment Receipt',
                    style: AppTextStyles.neueMontreal(
                      fontSize: 18.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            24.verticalSpace,
            _sectionTitle('Order Info'),
            16.verticalSpace,
            _infoTile('Order ID: ', order.id),
            12.verticalSpace,
            _infoTile('Payment ID: ', order.paymentId),
            12.verticalSpace,
            _infoTile('Payment Type: ', order.paymentType),
            12.verticalSpace,
            _infoTile(
              'Date: ',
              Formators.formatDateTime(order.createdAt ?? ''),
            ),
            24.verticalSpace,
            _sectionTitle('Items'),
            16.verticalSpace,
            SizedBox(
              height: order.items!.length == 1 ? 73 : 150.h,
              width: double.infinity,
              child: ListView.separated(
                itemCount: order.items!.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  child: Divider(color: Colors.grey.shade300),
                ),
                itemBuilder: (context, index) =>
                    productCard(item: order.items![index]),
              ),
            ),
            24.verticalSpace,
            _sectionTitle('Summary'),
            16.verticalSpace,
            _infoTile('Sub Total: ', Formators.formatCurrency(subTotal)),
            1.verticalSpace,
            _infoTile(
              'Marketplace Fee: ',
              Formators.formatCurrency(fee),  // ✅ Shows ₦800
            ),
            16.verticalSpace,
            _infoTile(
              'Total: ',
              Formators.formatCurrency(order.total ?? 0),
              bold: true,
            ),
            24.verticalSpace,
            CustomAppButtons.primaryButton(
              height: 45.h,
              width: double.infinity,
              onTap: () => Navigator.of(context).pop(),
              text: "Close",
              borderRadius: 2.r,
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.neueMontreal(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );
  }

  Widget _infoTile(String label, String? value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            textAlign: TextAlign.start,
            style: AppTextStyles.neueMontreal(
              color: Color(0xFF6B7280),
              fontSize: bold ? 18.sp : 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Text(
              value ?? '-',
              textAlign: TextAlign.right,
              style: AppTextStyles.neueMontreal(
                color: AppColors.black,
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                fontSize: bold ? 18.sp : 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget productCard({required SalesOrderItemModel item}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: NetworkImageHelper(
            imagePath: item.product?.photos?.first ?? '',
            height: 70,
            width: 65,
            fit: BoxFit.cover,
          ),
        ),
        10.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.sp),
                child: Text(
                  item.product?.title ?? '',
                  style: AppTextStyles.neueMontreal(
                    fontSize: 14.sp,
                    height: 1.5,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                'Quantity: ${item.quantity}',
                style: AppTextStyles.neueMontreal(
                  fontSize: 14.sp,
                  height: 1.5,
                  color: Color(0xFF6B7280),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                Formators.formatCurrency(item.decidedPrice ?? 0),
                style: AppTextStyles.neueMontreal(
                  fontSize: 14.sp,
                  height: 1.7,
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
