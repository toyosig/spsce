import 'package:circ/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class BottomCursorPinput extends StatelessWidget {
  final void Function(String)? onCompleted;
  final TextEditingController? controller;

  const BottomCursorPinput({super.key, this.onCompleted, this.controller});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: TextStyle(
        fontSize: 20.sp,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade400, width: 2),
        ),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.primaryColor, width: 2),
        ),
      ),
    );

    return Pinput(
      length: 6,
      closeKeyboardWhenCompleted: true,
      controller: controller,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      showCursor: true,
      onCompleted: onCompleted,
      keyboardType: TextInputType.number,
    );
  }
}
