import 'package:circ/utils/constants/app_images.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoResultsFound extends StatelessWidget {
  final String message;
  final String? assetPath;
  final double? iconSize;

  const NoResultsFound({
    super.key,
    this.message = "No results found",
    this.assetPath,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          assetPath ?? AppImages.searchPlaceHolder,
          height: iconSize ?? 73.h,
          width: iconSize ?? 73.w,
        ),
        30.verticalSpace,
        Text(
          message,
          style: AppTextStyles.neueMontreal(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
