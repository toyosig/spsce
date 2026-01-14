import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabTitle extends StatelessWidget {
  final String title;

  const TabTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        5.horizontalSpace,
        Text(title, style: tabTextStyle()),
      ],
    );
  }

  TextStyle tabTextStyle() {
    return AppTextStyles.neueMontreal(
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );
  }
}
