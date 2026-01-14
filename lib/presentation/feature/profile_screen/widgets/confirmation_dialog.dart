import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ConfirmationDialog extends StatefulWidget {
  final VoidCallback onSubmitTap;
  const ConfirmationDialog({
    super.key,
    required this.onSubmitTap,
  });

  @override
  State<ConfirmationDialog> createState() => _ConfirmationDialogState();
}

class _ConfirmationDialogState extends State<ConfirmationDialog> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.sp),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 150.h,
              width: 150.h,
              child: Lottie.asset(
                'assets/lotties/Animation-success.json',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.r),
              child: Column(
                children: [
                  Text(
                    "Mark as Delivered",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.neueMontreal(
                      color: AppColors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  12.verticalSpace,
                  Text(
                    "Are you sure you want to mark as Delivered this product?",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.neueMontreal(
                      color: AppColors.grey,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            34.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomAppButtons.primaryButton(
                    text: "Delivered",
                    onTap: widget.onSubmitTap,
                    width: 127.w,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    borderRadius: 10.r,
                  ),
                  CustomAppButtons.primaryButton(
                    text: "Cancel",
                    onTap: () => Navigator.of(context).pop(),
                    fontSize: 15.sp,
                    width: 127.w,
                    fontWeight: FontWeight.w500,
                    backgroundColor: Colors.white,
                    textColor: Colors.black87,
                    borderRadius: 10.r,
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
