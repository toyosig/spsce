import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';

class ContactSupportDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final String messageTitle;
  final String messageBody;

  const ContactSupportDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.messageTitle,
    required this.messageBody,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 30.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.r)),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16.h),
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  padding: EdgeInsets.all(15.r),
                  decoration: BoxDecoration(
                    color: AppColors.lightgreen,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check_circle_outline_rounded,
                      size: 30.sp,
                      color: AppColors.primaryBlack,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  title,
                  style: AppTextStyles.neueMontreal(
                    color: AppColors.primaryBlack,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
                Text(
                  subtitle,
                  style: AppTextStyles.neueMontreal(
                    color: Colors.black54,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.all(12.r),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.headset_mic,
                        size: 20.sp,
                        color: Colors.black54,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              messageTitle,
                              style: AppTextStyles.neueMontreal(
                                color: AppColors.primaryBlack,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              messageBody,
                              style: AppTextStyles.neueMontreal(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp,
                                fontStyle: FontStyle.italic,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.close, size: 22.sp, color: Colors.black45),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
