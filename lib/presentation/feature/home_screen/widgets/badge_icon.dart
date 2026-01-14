import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class IconWithBadge extends StatelessWidget {
  final String icon;
  final int badgeCount;
  final VoidCallback onTap;

  const IconWithBadge({
    super.key,
    required this.icon,
    required this.badgeCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Badge(
          label: Text(
            '$badgeCount',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          offset: const Offset(3, -6),
          isLabelVisible: badgeCount > 0,
          largeSize: 10.r,
          smallSize: 10.r,
          backgroundColor: const Color(0xffED2024),
          child: SvgPicture.asset(
            icon,
            height: 24.h,
            width: 24.w,
            colorFilter: const ColorFilter.mode(
              Color(0xff6E6E6E),
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
