import 'package:circ/presentation/feature/auth/view_model/auth_view_model.dart';
import 'package:circ/presentation/feature/auth/widgets/custom_text_field.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  final dynamic otp;
  final String email;
  const ResetPasswordScreen({
    super.key,
    required this.otp,
    required this.email,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
                      'Enter Your New Password',
                      style: AppTextStyles.neueMontreal(
                        fontSize: 30.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      'Enter your new password',
                      style: AppTextStyles.neueMontreal(
                        fontSize: 16.sp,
                        color: AppColors.black.withValues(alpha: 0.7),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    20.verticalSpace,
                    LabelTextField(
                      textInputType: TextInputType.visiblePassword,
                      label: 'Password',
                      hintText: 'Enter your new password',
                      controller: viewModel.newPasswordController,
                      readOnly: false,
                      maxLines: 1,
                      isTitleVisible: true,
                      isObscureText: viewModel.isNewPasswordObscureText,
                      onSuffixIconTap: () {
                        viewModel.toggleNewPasswordObscureText();
                      },
                      isSuffixIconVisible: true,
                    ),
                    20.verticalSpace,
                    // Confirm New Password Input
                    LabelTextField(
                      textInputType: TextInputType.visiblePassword,
                      label: 'Confirm Password',
                      hintText: 'Confirm your new password',
                      controller: viewModel.confirmNewPasswordController,
                      readOnly: false,
                      maxLines: 1,
                      isTitleVisible: true,
                      isObscureText: viewModel.isConfirmNewPasswordObscureText,
                      onSuffixIconTap: () {
                        viewModel.toggleConfirmNewPasswordObscureText();
                      },
                      isSuffixIconVisible: true,
                    ),

                    40.verticalSpace,
                    CustomAppButtons.primaryButton(
                      height: 50.h,
                      text: 'Save',
                      onTap: () {
                        final newpassword = viewModel.newPasswordController.text
                            .trim();
                        if (_formKey.currentState!.validate()) {
                          viewModel.resetPassword(
                            context,
                            widget.email,
                            widget.otp,
                            newpassword,
                          );
                        } else {
                          MessageHelper.showErrorMessage(
                            context,
                            'Please enter the verification code',
                          );
                        }
                      },
                      width: double.infinity,
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
