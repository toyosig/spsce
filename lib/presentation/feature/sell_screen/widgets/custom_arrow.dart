import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomArrowButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? text;
  final double height;
  final double width;
  final bool? isicon;
  final String? icon;
  final String? trailingText;
  final bool? isBorder;
  final double? imageheight;
  final double? imagewidth;

  const CustomArrowButton({
    super.key,
    required this.onTap,
    required this.text,
    this.height = 35,
    this.width = double.infinity,
    this.isicon,
    this.icon,
    this.trailingText,
    this.isBorder,
    this.imageheight,
    this.imagewidth,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
          border: (isBorder ?? true)
              ? Border.all(color: Colors.grey.shade300)
              : null,
        ),
        child: Row(
          children: [
            isicon == true
                ? Image.asset(
                    icon!,
                    width: imagewidth ?? 24.w,
                    height: imageheight ?? 24.h,
                  )
                : Container(),
            8.horizontalSpace,
            Text(
              text ?? '',
              style: AppTextStyles.neueMontreal(
                color: AppColors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            if (trailingText != null)
              Text(
                trailingText!,
                style: AppTextStyles.neueMontreal(
                  color: Colors.grey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            5.horizontalSpace,
            Icon(Icons.arrow_forward_ios, size: 14.sp, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
