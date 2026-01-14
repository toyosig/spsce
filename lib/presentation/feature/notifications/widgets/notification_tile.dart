import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationTile extends StatelessWidget {
  final String title;
  final String message;
  final String date;
  final bool isRead;
  final VoidCallback? onTap;

  const NotificationTile({
    super.key,
    required this.title,
    required this.message,
    required this.date,
    required this.isRead,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.0),
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: isRead
                ? Colors.white
                : AppColors.lightgrey.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: isRead
                ? [
                    BoxShadow(
                      color: AppColors.primaryBlack.withValues(alpha: 0.08),
                      blurRadius: 10,
                    ),
                  ]
                : null,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: isRead ? AppColors.lightgrey : AppColors.white,
                      shape: BoxShape.circle,
                      border: isRead
                          ? null
                          : Border.all(
                              color: AppColors.black.withValues(alpha: 0.1),
                              width: 1,
                            ),
                    ),
                    child: Icon(
                      Icons.notifications_none_rounded,
                      size: 22.sp,
                      color: isRead
                          ? AppColors.grey.withValues(alpha: 0.7)
                          : AppColors.black,
                    ),
                  ),
                  if (!isRead)
                    Positioned(
                      right: 2.5,
                      top: 2.5,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: AppTextStyles.neueMontreal(
                              fontWeight: isRead
                                  ? FontWeight.w500
                                  : FontWeight.w600,
                              fontSize: 14.sp,
                              color: AppColors.primaryBlack,
                            ),
                          ),
                        ),
                        Text(
                          date,
                          style: AppTextStyles.neueMontreal(
                            fontSize: 13.sp,
                            color: AppColors.primaryBlack.withValues(
                              alpha: 0.8,
                            ),
                            fontWeight: isRead
                                ? FontWeight.w400
                                : FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    4.verticalSpace,
                    Text(
                      message,
                      style: AppTextStyles.neueMontreal(
                        fontSize: 13.sp,
                        color: AppColors.primaryBlack.withValues(alpha: 0.6),
                        fontWeight: FontWeight.w400,
                      ),
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
