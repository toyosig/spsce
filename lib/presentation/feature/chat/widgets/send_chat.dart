import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatInputField extends StatelessWidget {
  final VoidCallback? onCameraTap;
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback? onTap;
  final bool? chatAibar;

  const ChatInputField({
    super.key,
    required this.controller,
    required this.onSend,
    this.chatAibar = false,
    this.onCameraTap,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(2.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              alignment: Alignment.center,
              child: TextField(
                controller: controller,
                onTap: onTap,
                onSubmitted: (_) => onSend(),
                style: AppTextStyles.neueMontreal(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
                decoration: InputDecoration(
                  isCollapsed: true,
                  border: InputBorder.none,
                  hintText: "Type Message...",
                  hintStyle: AppTextStyles.neueMontreal(
                    color: Colors.grey,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            onTap: onSend,
            child: Container(
              height: 48.h,
              width: 48.h,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(2.r),
              ),
              child: Center(
                child: Image.asset(
                  "assets/images/send_icon.png",
                  width: 20.w,
                  height: 20.h,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
