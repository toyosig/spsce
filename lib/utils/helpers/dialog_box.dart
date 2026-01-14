import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onremove;
  final String btnText;
  final String image;

  const CustomConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onremove,
    required this.image,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      insetPadding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(image, height: 40.h, width: 40.w),
                SizedBox(height: 16.h),
                Text(
                title,
                style: AppTextStyles.neueMontreal(
                  color: AppColors.btnTextblack,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),
              Text(
                message,
                style: AppTextStyles.neueMontreal(
                  color: Colors.grey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              Row(
              children: [
                Expanded(
                  child: CustomAppButtons.primaryButton(
                    text: btnText,
                    onTap: onremove,
                    width: double.infinity,
                    borderRadius: 5.r,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: CustomAppButtons.primaryButton(
                    text: 'Cancel',
                    width: double.infinity,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    borderRadius: 5.r,
                    backgroundColor: AppColors.white,
                    textColor: AppColors.btnTextblack,
                    boarderSideColor: AppColors.black,
                  ),
                ),
              ],
            ),         
            ],
          ),
        Positioned(
            top: -15,
            right: -5,
            child: IconButton(
              icon: Icon(Icons.close, size: 24.sp, color:Colors.grey),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          ],

      ),
      ),
    );
  }
}
