import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EarningsTabBar extends StatelessWidget {
  final TabController controller;

  const EarningsTabBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffEFF3F8),
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: TabBar(
        dividerColor: Colors.transparent,
        controller: controller,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black,
        labelStyle: AppTextStyles.neueMontreal(
          fontSize: 17.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        indicatorColor: Colors.transparent,
        unselectedLabelStyle: AppTextStyles.neueMontreal(
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        indicator: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        tabs: const [Tab(text: 'Earnings'), Tab(text: 'Sold Item')],
      ),
    );
  }
}
