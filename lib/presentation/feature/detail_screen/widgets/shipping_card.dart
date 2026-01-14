import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/detail_screen/widgets/shipping_to.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/app_images.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShippingCard extends StatelessWidget {
  final String? shippingFrom;
  final String? shippingTo;

  const ShippingCard({
    super.key,
    required this.shippingFrom,
    required this.shippingTo,
  });

  String _getShippingText(String shippingTo) {
    switch (shippingTo) {
      case 'Nation-wide':
        return 'Ships $shippingTo';
      case 'State-wide':
        return 'Ships within $shippingTo';
      case 'World-wide':
        return 'Ships $shippingTo';
      default:
        return 'Shipping info unavailable';
    }
  }

  @override
  Widget build(BuildContext context) {
    final ShippingToOption selectedOption = shippingToList.firstWhere(
      (option) => option.title == shippingTo,
      orElse: () => ShippingToOption(
        title: 'Unknown',
        subtitle: 'No shipping info available',
        icon: Icons.help_outline,
      ),
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (shippingFrom != null)
            Row(
              children: [
                SvgPicture.asset(
                  AppImages.locationIcon,
                  height: 15.h,
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryColor.withValues(alpha: 0.6),
                    BlendMode.srcIn,
                  ),
                ),
                7.horizontalSpace,
                Text(
                  shippingFrom ?? "",
                  style: AppTextStyles.neueMontreal(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryBlack,
                  ),
                ),
              ],
            ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.sp),
            padding: EdgeInsets.symmetric(vertical: 18.sp, horizontal: 16.sp),
            decoration: BoxDecoration(
              color: AppColors.black.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(2.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(7.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xFFE4E4E7)),
                  ),
                  child: Icon(
                    Icons.flag_outlined,
                    size: 20.sp,
                    color: AppColors.greyText,
                  ),
                ),
                16.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getShippingText(selectedOption.title),
                      style: AppTextStyles.neueMontreal(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    5.verticalSpace,
                    Text(
                      selectedOption.subtitle,
                      style: AppTextStyles.neueMontreal(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
