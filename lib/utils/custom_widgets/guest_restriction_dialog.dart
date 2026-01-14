import 'package:circ/domain/services/secure_storage_services.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_lotties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class GuestRestrictionDialog extends StatelessWidget {
  // final VoidCallback onCancel;
  // final VoidCallback onLogin;
  final String? title;
  final String? message;

  const GuestRestrictionDialog({
    super.key,
    // required this.onCancel,
    // required this.onLogin,
    this.title,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(20.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 10.r,
            children: [
              Text(
                title ?? 'Login Required',
                style: AppTextStyles.poppins(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                message ?? 'Please login or sign up to use this feature.',
                style: AppTextStyles.poppins(
                  color: Colors.black38,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              Lottie.asset(
                AppLotties.guestRestriction,
                width: 200.w,
                height: 200.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                    10.horizontalSpace,
                    CustomAppButtons.primaryButton(
                      text: 'Login / Sign Up',
                      backgroundColor: AppColors.primaryColor,
                      textColor: AppColors.white,
                      onTap: () {
                        Navigator.of(context).pop();
                        context.go('/login');
                        // clear the things too
                        SecureStorageService.clearAll();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
