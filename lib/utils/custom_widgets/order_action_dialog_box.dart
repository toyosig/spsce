import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderActionDialogBox extends StatefulWidget {
  final String title;
  final String subTitle;
  final bool isSuccess;
  final VoidCallback onSubmitTap;
  final VoidCallback onCancelTap;
  final String? buttonText;
  final String onSubmitText;
  final String onCancelText;
  final bool showButtons;

  // NEW: Add these two parameters
  final bool showAmountText;
  final String? amountText;

  const OrderActionDialogBox({
    super.key,
    required this.onSubmitTap,
    this.buttonText = "Buyer pays for delivery",
    this.isSuccess = true,
    required this.title,
    required this.subTitle,
    required this.onCancelTap,
    required this.onSubmitText,
    required this.onCancelText,
    this.showButtons = true,
    this.showAmountText = false,
    this.amountText,
  });

  @override
  State<OrderActionDialogBox> createState() => _OrderActionDialogBoxState();
}

class _OrderActionDialogBoxState extends State<OrderActionDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(16.r),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  padding: EdgeInsets.all(15.r),
                  decoration: BoxDecoration(
                    color: widget.isSuccess
                        ? AppColors.lightgreen
                        : AppColors.splashColor.withValues(alpha: 0.6),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      widget.isSuccess
                          ? Icons.check_circle_outline_rounded
                          : Icons.cancel_outlined,
                      size: 30.sp,
                      color: AppColors.primaryBlack,
                    ),
                  ),
                ),
                20.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.r),
                  child: Column(
                    children: [
                      if (widget.showAmountText && widget.amountText != null)
                        Text(
                          widget.amountText!,
                          style: AppTextStyles.neueMontreal(
                            color: AppColors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      if (widget.showAmountText) 10.verticalSpace,
                      Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.neueMontreal(
                          color: AppColors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      12.verticalSpace,
                      Text(
                        widget.subTitle,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.neueMontreal(
                          color: AppColors.grey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      10.verticalSpace,
                      Text(
                        widget.buttonText ?? '',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.neueMontreal(
                          color: AppColors.grey,
                          fontStyle: FontStyle.italic,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                34.verticalSpace,
                if (widget.showButtons)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomAppButtons.primaryButton(
                        text: widget.onSubmitText,
                        onTap: widget.onSubmitTap,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        borderRadius: 3.r,
                        width: 140.w,
                        height: 45.h,
                      ),
                      10.horizontalSpace,
                      CustomAppButtons.primaryButton(
                        text: widget.onCancelText,
                        onTap: widget.onCancelTap,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        backgroundColor: Colors.white,
                        textColor: Colors.black87,
                        borderRadius: 2.r,
                        width: 145.w,
                        height: 45.h,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: IconButton(
            icon: Icon(Icons.close, size: 24.sp, color: Colors.black54),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
        ),
      ],
    );
  }
}

class ActionDialogBox extends StatefulWidget {
  final String title;
  final String subTitle;
  final bool isSuccess;
  final VoidCallback onSubmitTap;
  final String onSubmitText;
  final Widget? field;

  // NEW: Add these two parameters
  final bool showAmountText;
  final String? amountText;

  const ActionDialogBox({
    super.key,
    required this.onSubmitTap,
    this.isSuccess = true,
    required this.title,
    required this.subTitle,
    required this.onSubmitText,
    this.showAmountText = false,
    this.amountText,
    this.field,
  });

  @override
  State<ActionDialogBox> createState() => _ActionDialogBoxState();
}

class _ActionDialogBoxState extends State<ActionDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(16.r),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  padding: EdgeInsets.all(15.r),
                  decoration: BoxDecoration(
                    color: widget.isSuccess
                        ? AppColors.lightgreen
                        : AppColors.splashColor.withValues(alpha: 0.6),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      widget.isSuccess
                          ? Icons.check_circle_outline_rounded
                          : Icons.cancel_outlined,
                      size: 30.sp,
                      color: AppColors.primaryBlack,
                    ),
                  ),
                ),
                20.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.r),
                  child: Column(
                    spacing: 12.h,
                    children: [
                      Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.neueMontreal(
                          color: AppColors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        widget.subTitle,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.neueMontreal(
                          color: AppColors.grey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.field != null) ...[
                  16.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.r),
                    child: widget.field,
                  ),
                ],

                34.verticalSpace,
                CustomAppButtons.primaryButton(
                  text: widget.onSubmitText,
                  onTap: widget.onSubmitTap,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  borderRadius: 3.r,
                  height: 45.h,
                  width: 280.w,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: IconButton(
            icon: Icon(Icons.close, size: 24.sp, color: Colors.black54),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
        ),
      ],
    );
  }
}
