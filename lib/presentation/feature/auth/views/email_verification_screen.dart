import 'package:circ/presentation/feature/auth/view_model/auth_view_model.dart';
import 'package:circ/presentation/feature/auth/widgets/bottom_cursor_point.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.black,
                size: 20.sp,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Enter Verification code',
                      style: AppTextStyles.neueMontreal(
                        fontSize: 30.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      'We\'ve sent a verification code to your email address',
                      style: AppTextStyles.neueMontreal(
                        fontSize: 16.sp,
                        color: AppColors.black.withValues(alpha: 0.7),
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    40.verticalSpace,
                    BottomCursorPinput(
                      controller: viewModel.emailVerificationCodeController,
                    ),

                    40.verticalSpace,
                    CustomAppButtons.primaryButton(
                      height: 50.h,
                      text: 'Verify Email',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          viewModel.verifyEmail(context);
                        } else {
                          MessageHelper.showErrorMessage(
                            context,
                            'Please enter the verification code',
                          );
                        }
                      },
                      width: double.infinity,
                    ),
                    10.verticalSpace,
                    Center(
                      child: viewModel.isResendEnabled
                          ? TextButton(
                              onPressed: () {
                                viewModel.reSendVerifyEmailOtp(context);
                              },
                              child: Text(
                                'Resend Code',
                                style: AppTextStyles.neueMontreal(
                                  fontSize: 16.sp,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          : Text(
                              'Resend in ${viewModel.resendCooldownSeconds ~/ 60}:${(viewModel.resendCooldownSeconds % 60).toString().padLeft(2, '0')}',
                              style: AppTextStyles.neueMontreal(
                                fontSize: 16.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
