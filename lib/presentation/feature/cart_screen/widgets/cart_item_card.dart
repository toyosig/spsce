// ignore_for_file: deprecated_member_use
import 'package:circ/presentation/feature/cart_screen/view_model/cart_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CartItemCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String brand;
  final String size;
  final int quantity;
  final double price;
  final VoidCallback onDelete;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final String productId;

  const CartItemCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.brand,
    required this.size,
    required this.quantity,
    required this.price,
    required this.onDelete,
    this.onIncrement,
    this.onDecrement,
    required this.productId,
  });

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    final cartVm = Provider.of<CartViewModel>(context);
    final isChecked = cartVm.selectedProductIds.contains(widget.productId);

    return Animate(
      effects: [
        // SlideEffect(begin: Offset(0, 0.3), duration: 600.ms),
        // FadeEffect(duration: 600.ms),
      ],
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                cartVm.toggleProductSelection(widget.productId, value ?? false);
              },

              activeColor: AppColors.primaryColor,
            ),
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 30.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: NetworkImageHelper(
                            imagePath: widget.imagePath,
                            height: 100.h,
                            width: 100.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            spacing: 4.h,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.neueMontreal(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                '${widget.size}, ${widget.brand}',
                                style: AppTextStyles.neueMontreal(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                Formators.formatCurrency(widget.price),
                                style: AppTextStyles.neueMontreal(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                'Delivery fee to be arranged\nwith seller after purchase',

                                style: AppTextStyles.neueMontreal(
                                  fontSize: 10.sp,
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  // Minus Button
                                  GestureDetector(
                                    onTap: () {
                                      widget.onDecrement!();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(2.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          4.r,
                                        ),
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        size: 16.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    widget.quantity.toString(),
                                    style: AppTextStyles.neueMontreal(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  // Plus Button
                                  GestureDetector(
                                    onTap: () {
                                      widget.onIncrement!();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(2.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          4.r,
                                        ),
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        size: 16.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    bottom: 2,
                    right: 5,
                    child: GestureDetector(
                      onTap: () {
                        widget.onDelete();
                      },
                      child: Container(
                        height: 26.h,
                        width: 26.w,
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SvgPicture.asset(
                          'assets/svg/delete.svg',
                          height: 12.h,
                          width: 12.w,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
