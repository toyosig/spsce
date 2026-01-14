import 'package:circ/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

/// StatelessWidget for shimmer loading message
class ShimmerMessage extends StatelessWidget {
  final bool isMe;
  const ShimmerMessage({super.key, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              constraints: BoxConstraints(maxWidth: 0.7.sw),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: isMe ? AppColors.primaryColor : AppColors.authbgColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 16.h, width: 100.w, color: Colors.white),
                  SizedBox(height: 4.h),
                  Container(height: 12.h, width: 60.w, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
