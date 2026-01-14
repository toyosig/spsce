import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MsgAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? imagePath;
  final String userId;

  const MsgAppBar({
    super.key,
    required this.title,
    this.imagePath,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 6.h),
          child: Row(
            spacing: 10.w,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20.sp,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.push('/othersProfile', extra: userId);
                },
                child: Row(
                  spacing: 10.w,
                  children: [
                    NetworkImageHelper(
                      imagePath: imagePath ?? '',
                      isCircular: true,
                    ),
                    Text(
                      title,
                      style: AppTextStyles.neueMontreal(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1, color: Colors.grey.shade300),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
