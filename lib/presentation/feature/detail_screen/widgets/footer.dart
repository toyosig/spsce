// ignore_for_file: deprecated_member_use

import 'package:circ/presentation/feature/cart_screen/view_model/cart_view_model.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:provider/provider.dart';

class ProductFooter extends StatelessWidget {
  final bool isSellersProduct;
  final int price;
  final VoidCallback onBagTap;
  final VoidCallback onEditTab;
  final VoidCallback onPriceItTap;
  final VoidCallback onBuyNowTap;
  final bool isSold;

  const ProductFooter({
    super.key,
    required this.isSellersProduct,
    required this.price,
    required this.onBagTap,
    required this.onPriceItTap,
    required this.onBuyNowTap,
    required this.onEditTab,
    required this.isSold,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 77.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.greyborder, width: 2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Formators.formatCurrency(price),
            style: AppTextStyles.neueMontreal(
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.greenPrice,
            ),
          ),
          isSellersProduct
              ? CustomAppButtons.primaryFooterBtn(
                  text: "Manage Listing",
                  onTap: onEditTab,
                  iconPath: "assets/svg/settingIcon.svg",
                  iconColor: AppColors.white,
                  buttonColor: AppColors.black,
                  textColor: AppColors.white,
                  borderColor: AppColors.black,
                )
              : Row(
                  spacing: 8.w,
                  children: [
                    SizedBox(
                      height: 38.h,
                      child: CustomAppButtons.primaryFooterBtn(
                        text: 'Bag',
                        onTap: onBagTap,
                        iconPath: 'assets/svg/cart_bag.svg',
                        buttonColor: AppColors.white,
                        textColor:  isSold ? AppColors.grey.withOpacity(0.4) : AppColors.black,
                        borderColor: isSold ? AppColors.grey.withOpacity(0.4)   : AppColors.black,
                        iconColor: isSold ? AppColors.grey.withOpacity(0.4) : AppColors.black,
                        textSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      height: 38.h,
                      child: Consumer<CartViewModel>(
                        builder: (context, cartVm, _) {
                          final isDisabled = cartVm.isPriceButtonDisabled;
                          return SizedBox(
                            height: 38.h,
                            child: CustomAppButtons.primaryFooterBtn(
                              text: '₦ Price it',
                              onTap: isDisabled ? () {} : onPriceItTap,
                              buttonColor: isDisabled || isSold
                                  ? AppColors.white
                                  : AppColors.white,
                              textColor: isDisabled || isSold
                                  ? AppColors.lightblack.withOpacity(0.4)
                                  : AppColors.black,
                              borderColor: isDisabled || isSold
                                  ? AppColors.grey.withOpacity(0.4)
                                  : AppColors.black,
                              textSize: 14.sp,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                      child: CustomAppButtons.primaryFooterBtn(
                        text: "Buy Now",
                        onTap: onBuyNowTap,
                        buttonColor:  isSold ? AppColors.white : AppColors.black,
                        textColor: isSold ? AppColors.grey.withOpacity(0.6) : AppColors.white,
                        borderColor: isSold ? AppColors.grey.withOpacity(0.4) : AppColors.black,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
