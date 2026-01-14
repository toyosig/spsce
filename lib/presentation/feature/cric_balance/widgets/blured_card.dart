import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/home_screen/view_model/home_view_model.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BlurredSellerWarningCard extends StatelessWidget {
  const BlurredSellerWarningCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        backgroundBlendMode: BlendMode.darken,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.1)),
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 32.sp, vertical: 16.h),
              padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 16.h),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(16.sp),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.storefront_outlined,
                    size: 38.sp,
                    color: Colors.grey[600] ?? Colors.grey,
                  ),
                  12.verticalSpace,
                  Text(
                    'Seller Account Required',
                    style: AppTextStyles.neueMontreal(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 18.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  8.verticalSpace,
                  Text(
                    'You need to be a verified seller to access the Circ Balance feature. Please update your profile to continue.',
                    style: AppTextStyles.neueMontreal(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[600] ?? Colors.grey,
                      fontSize: 14.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  18.verticalSpace,
                  CustomAppButtons.primaryButton(
                    text: 'Update Profile',
                    onTap: () {
                      final vm = getIt.get<HomeViewModel>();
                      vm.setIndex(2);
                      context.go('/navbar', extra: 2);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
