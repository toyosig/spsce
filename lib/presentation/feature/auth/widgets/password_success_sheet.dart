import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordUpdatedBottomSheet extends StatelessWidget {
  final VoidCallback onBackToLogin;

  const PasswordUpdatedBottomSheet({super.key, required this.onBackToLogin});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/success.png", width: 100.w, height: 100.h),
          SizedBox(height: 24.h),
          Text(
            "Password Update Successfully",
            style: AppTextStyles.neueMontreal(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              height: 1.2,
            ),

            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.h),
          Text(
            "Your password has been\nupdated successfully",
            style: AppTextStyles.neueMontreal(
              fontSize: 14.sp,
              color: Colors.black54,
              fontWeight: FontWeight.w400,
              height: 1,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 28.h),
          CustomAppButtons.primaryButton(
            height: 50.h,
            width: double.infinity,
            text: "Back to Login",
            onTap: onBackToLogin,
          ),
        ],
      ),
    );
  }
}
