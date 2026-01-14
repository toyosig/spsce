import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageHelper {
  static void showSuccessMessage(
    BuildContext context,
    String message, {
    String? subTitle,
    String? bottomText,
    String? svgIconUrl,
  }) {
    _showCustomSnackBar(
      context,
      title: 'Success',
      message: message,
      bottomText: bottomText,
      subtitle: subTitle,
      isError: false,
      leading: SvgPicture.asset(
        svgIconUrl ?? AppImages.successIcon,
        errorBuilder: (context, error, stackTrace) =>
            Icon(Icons.check_circle, color: Colors.white),
      ),
    );
  }

  static void showErrorMessage(
    BuildContext context,
    String message, {
    String? subTitle,
  }) {
    _showCustomSnackBar(
      context,
      title: 'Error',
      message: message,
      subtitle: subTitle,
      isError: true,
      leading: Icon(Icons.error, color: Colors.white),
    );
  }

  static void _showCustomSnackBar(
    BuildContext context, {
    required bool isError,
    required String title,
    String? subtitle,
    String? bottomText,
    required String message,
    required Widget leading,
  }) {
    final snackBar = SnackBar(
      backgroundColor: isError
          ? const Color.fromARGB(143, 255, 0, 4)
          : AppColors.green,
      behavior: SnackBarBehavior.fixed,
      elevation: 0,
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(7.r),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: leading,
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              spacing: 4.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppTextStyles.neueMontreal(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: isError ? AppColors.white : AppColors.primaryBlack,
                  ),
                ),
                Text(
                  message,
                  style: AppTextStyles.neueMontreal(
                    fontSize: 14.sp,
                    color: isError
                        ? AppColors.white.withValues(alpha: 0.6)
                        : AppColors.primaryBlack.withValues(alpha: 0.6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle,
                    style: AppTextStyles.neueMontreal(
                      fontSize: 14.sp,
                      color: isError
                          ? AppColors.white.withValues(alpha: 0.6)
                          : AppColors.primaryBlack.withValues(alpha: 0.6),
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                if (bottomText != null && bottomText.isNotEmpty)
                  Text(
                    bottomText,
                    style: AppTextStyles.neueMontreal(
                      fontSize: 14.sp,
                      color: isError
                          ? AppColors.white.withValues(alpha: 0.6)
                          : AppColors.primaryBlack.withValues(alpha: 0.6),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            child: Icon(
              Icons.close,
              color: isError ? AppColors.white : AppColors.primaryBlack,
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
