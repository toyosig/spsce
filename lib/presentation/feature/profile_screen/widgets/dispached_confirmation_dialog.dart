import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DispachedConfirmationDialog extends StatefulWidget {
  final String imgUrl;
  final VoidCallback onSubmitTap;
  const DispachedConfirmationDialog({super.key, required this.onSubmitTap, required this.imgUrl});

  @override
  State<DispachedConfirmationDialog> createState() =>
      _DispachedConfirmationDialogState();
}

class _DispachedConfirmationDialogState
    extends State<DispachedConfirmationDialog> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.sp),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: NetworkImageHelper(
                imagePath: widget.imgUrl,
                height: 55.sp,
                width: 55.sp,
                fit: BoxFit.cover,
              ),
            ),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.r),
              child: Column(
                children: [
                  Text(
                    "Mark as Dispached",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.neueMontreal(
                      color: AppColors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  12.verticalSpace,
                  Text(
                    "Are you sure you want to mark as Dispached this product?",
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
                    text: "Dispached",
                    onTap: widget.onSubmitTap,
                    // height: 40.h,
                    width: 127.w,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    borderRadius: 10.r,
                  ),
                  CustomAppButtons.primaryButton(
                    text: "Cancel",
                    onTap: () => Navigator.of(context).pop(),
                    // height: 40.h,
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
