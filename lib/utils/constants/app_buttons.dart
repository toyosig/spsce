import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppButtons {
  static Widget footerBtn({
    required String label,
    Color? color,
    Color? textColor,
    required VoidCallback onTap,
    double? width,
    String? image,
    double? height,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 40.h,
        width: width,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: image != null
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(image, width: 20.w, height: 22.h),
                    5.horizontalSpace,
                    Text(
                      label,
                      style: AppTextStyles.neueMontreal(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: textColor ?? Colors.black87,
                      ),
                    ),
                  ],
                )
              : Text(
                  label,
                  style: AppTextStyles.neueMontreal(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color: textColor ?? Colors.black87,
                  ),
                ),
        ),
      ),
    );
  }

  static Widget primaryFooterBtn({
    required String text,
    required VoidCallback onTap,
    String? iconPath,
    Color? textColor,
    Color? buttonColor,
    Color? borderColor,
    double? textSize,
    Color? iconColor,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.r),
          side: BorderSide(color: borderColor ?? Colors.transparent, width: 1),
        ),
        elevation: 0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconPath != null) ...[
            SvgPicture.asset(
              iconPath,
              height: 18.h,
              width: 18.w,
              colorFilter: ColorFilter.mode(
                iconColor ?? Color(0xff6E6E6E),
                BlendMode.srcIn,
              ),
            ),
            8.horizontalSpace,
          ],
          Text(
            text,
            style: AppTextStyles.neueMontreal(
              fontSize: textSize ?? 14.sp,
              fontWeight: FontWeight.w600,
              color: textColor ?? Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  static Widget primaryButton({
    Alignment? alignment,
    required String text,
    required VoidCallback onTap,
    Color backgroundColor = AppColors.black,
    Color? boarderSideColor,
    Color textColor = Colors.white,
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.w500,
    double borderRadius = 2,
    double? width,
    double? height,
    EdgeInsets padding = const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 12,
    ),
  }) {
    final Color effectiveBorderColor = boarderSideColor ?? AppColors.greyborder;
    return Align(
      alignment: alignment ?? Alignment.center,
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(color: effectiveBorderColor, width: 1),
            ),
            padding: padding,
            elevation: 0,
          ),
          child: Text(
            text,
            style: AppTextStyles.neueMontreal(
              fontSize: fontSize.sp,
              fontWeight: fontWeight,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  static Widget secondaryButton({
    required String text,
    required VoidCallback onTap,
    Color borderColor = AppColors.primaryColor,
    Color backgroundColor = Colors.white,
    Color textColor = AppColors.primaryColor,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w500,
    double borderRadius = 0,
    double? width,
    double? height,
    // EdgeInsets padding = const EdgeInsets.symmetric(
    //   vertical: 14,
    //   horizontal: 16,
    // ),
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          side: BorderSide(color: borderColor, width: 1),
          // padding: padding,
        ),
        child: Text(
          text,
          style: AppTextStyles.neueMontreal(
            fontSize: fontSize.sp,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
      ),
    );
  }

  static Widget primaryIconButton({
    required String text,
    required VoidCallback? onTap,
    Color? backgroundColor = AppColors.white,
    Widget? svg,
    Color? borderColor,
    Color textColor = AppColors.lightblack,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w500,
    double borderRadius = 0,
    double? width,
    double? height,
    IconData? icon,
    Color? iconColor,
  }) {
    final Color effectiveBorderColor = borderColor ?? AppColors.greyborder;

    final button = ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(color: effectiveBorderColor, width: 1),
        ),
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (svg != null)
            svg
          else if (icon != null)
            Icon(icon, color: iconColor, size: 17.sp),
          if ((icon != null || svg != null)) SizedBox(width: 5.w),
          SizedBox(
            // width: 100.w,
            child: Text(
              text,
              style: AppTextStyles.neueMontreal(
                fontSize: fontSize.sp,
                fontWeight: fontWeight,
                color: textColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
    if (width != null) {
      return SizedBox(width: width, height: height ?? 42.h, child: button);
    } else {
      return SizedBox(height: height ?? 42.h, child: button);
    }
  }

  static Widget customSocialButton({
    required double height,
    required double width,
    required String svgIconPath,
    required String title,
    int radus = 16,
    required FontWeight fontweight,
    required double fontSize,
    required VoidCallback? onpressed,
    Color? buttonColor,
    Color? textColor,
  }) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radus.r),
          color: buttonColor ?? AppColors.white,
          //boarder Side of 1
          border: Border.all(color: AppColors.lightgrey, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8.w,
          children: [
            SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(svgIconPath, fit: BoxFit.fill),
            ),
            Text(
              title,
              overflow: TextOverflow.visible,
              style: AppTextStyles.dmSons(
                color: textColor ?? AppColors.btnTextblack,
                fontSize: fontSize,
                fontWeight: fontweight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget trailingIconButton({
    required String text,
    required VoidCallback? onTap,
    Color backgroundColor = AppColors.white,
    Color? bordercolor,
    Color textColor = AppColors.lightblack,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w500,
    double borderRadius = 30,
    double? width,
    double? height,
    IconData? icon,
    Color? iconColor,
  }) {
    final Color effectiveBorderColor = bordercolor ?? AppColors.greyborder;

    final button = ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(color: effectiveBorderColor, width: 1),
        ),
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            text,
            style: AppTextStyles.neueMontreal(
              fontSize: fontSize.sp,
              fontWeight: fontWeight,
              color: textColor,
            ),
          ),
          if (icon != null) ...[
            const Spacer(),
            Icon(icon, color: iconColor ?? textColor, size: 15.sp),
          ],
        ],
      ),
    );

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 42.h,
      child: button,
    );
  }

  static Widget profileIconButton({
    required BuildContext context,
    required String label,
    required String image,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      height: 38.h,
      width: 107.w,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 12.sp),
          side: const BorderSide(color: Colors.black12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              image,
              height: 20.sp,
              colorFilter: const ColorFilter.mode(
                Colors.black87,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: 13.h),
            Text(
              label,
              textAlign: TextAlign.center,
              style: AppTextStyles.neueMontreal(
                color: Colors.black,
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget primaryImageButton({
    required String text,
    required VoidCallback onTap,
    Color? backgroundColor = AppColors.white,
    Color? bordercolor,
    Color textColor = AppColors.lightblack,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w400,
    double borderRadius = 2,
    double? width,
    String? image,
    Color? iconColor,
    EdgeInsets padding = const EdgeInsets.symmetric(
      vertical: 14,
      horizontal: 16,
    ),
  }) {
    final Color effectiveBorderColor = bordercolor ?? AppColors.greyborder;
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: effectiveBorderColor, width: 1),
          ),
          padding: padding,
          elevation: 0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null)
              Image.asset(image, color: iconColor, height: 22.h, width: 20.w),
            if (image != null) 10.horizontalSpace,
            Flexible(
              child: Text(
                text,
                overflow: TextOverflow.fade,
                softWrap: false,
                style: AppTextStyles.neueMontreal(
                  fontSize: fontSize.sp,
                  fontWeight: fontWeight,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
