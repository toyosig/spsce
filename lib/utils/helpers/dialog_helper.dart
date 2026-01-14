import 'package:circ/utils/constants/app_buttons.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_colors.dart';
import '../custom_widgets/text_styles.dart';

class CustomDialog extends StatefulWidget {
  final String? title;
  final String? message;
  final String? btntext;
  final VoidCallback? onbtnPressed;

  const CustomDialog({
    super.key,
    this.title,
    this.message,
    this.btntext,
    this.onbtnPressed,
  });

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 430),
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void closeDialog() {
    _controller.reverse().then((_) {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      padding: EdgeInsets.all(20.r),
      child: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 320.w,
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.r,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.e,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title ?? '',
                    style: AppTextStyles.neueMontreal(
                      color: AppColors.btnTextblack,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Divider(thickness: 1.h),
                  SizedBox(height: 10.h),
                  Text(
                    widget.message ?? '',
                    textAlign: TextAlign.start,
                    style: AppTextStyles.neueMontreal(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: AppColors.btnTextblack,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomAppButtons.primaryButton(
                        text: widget.btntext ?? '',
                        onTap: widget.onbtnPressed ?? () {},
                      ),
                      SizedBox(width: 10.h),
                      CustomAppButtons.secondaryButton(
                        text: 'Cancel',
                        onTap: () => context.pop(),
                        borderColor: AppColors.black,
                        backgroundColor: AppColors.white,
                        textColor: AppColors.lightblack,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
