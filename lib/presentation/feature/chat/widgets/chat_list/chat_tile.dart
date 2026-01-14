import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatTile extends StatelessWidget {
  final String name;
  final String subtitle;
  final String imagePath;
  final int unreadCount;
  final VoidCallback? onTap;
  final DateTime? tiemago;

  const ChatTile({
    super.key,
    required this.name,
    required this.subtitle,
    required this.imagePath,
    this.unreadCount = 0,
    this.onTap,
    this.tiemago,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        leading: NetworkImageHelper(
          imagePath: imagePath,
          isCircular: true,
          height: 50.h,
          width: 50.w,
        ),
        title: Text(
          name,
          style: AppTextStyles.neueMontreal(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 16.sp,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.neueMontreal(
            color: Colors.grey,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 4,
          children: [
            5.verticalSpace,
            Text(
              Formators.timeAgoSinceDate(tiemago ?? DateTime.now()),
              style: AppTextStyles.neueMontreal(
                color: Colors.black54,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            ?unreadCount > 0
                ? BuildUnreadBadge(unreadCount: unreadCount)
                : null,
          ],
        ),
      ),
    );
  }
}

class BuildUnreadBadge extends StatelessWidget {
  const BuildUnreadBadge({super.key, required this.unreadCount});

  final int unreadCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        shape: BoxShape.circle,
      ),
      child: Text(
        '$unreadCount',
        style: AppTextStyles.neueMontreal(
          color: Colors.white,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
