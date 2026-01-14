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

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
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
              icon: Icon(Icons.arrow_back_ios, size: 20.sp),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    10.verticalSpace,
                    Text(
                      'Forgot Password',
                      style: AppTextStyles.neueMontreal(
                        fontSize: 24.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      'Enter your email address  to reset your password',
                      style: AppTextStyles.neueMontreal(
                        fontSize: 14.sp,
                        color: AppColors.greyText,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    40.verticalSpace,
                    if (!viewModel.isResetCodeSent) ...[
                      LabelTextField(
                        textInputType: TextInputType.emailAddress,
                        label: 'Email Address',
                        hintText: 'Enter your email address',
                        controller: viewModel.emailController,
                        readOnly: false,
                        maxLines: 1,
                        isTitleVisible: true,
                      ),
                      30.verticalSpace,
                      CustomAppButtons.primaryButton(
                        height: 50.h,
                        text: 'Send Otp',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            final email = viewModel.emailController.text.trim();
                            viewModel.sendPasswordResetCode(context).then((
                              val,
                            ) {
                              if (val && context.mounted) {
                                context.push(
                                  '/forget_otp',
                                  extra: {"email": email},
                                );
                              }
                            });
                          } else {
                            MessageHelper.showErrorMessage(
                              context,
                              'Please enter a valid email address',
                            );
                          }
                        },
                        width: double.infinity,
                      ),
                    ] else ...[
                      LabelTextField(
                        textInputType: TextInputType.emailAddress,
                        label: 'Email Address',
                        hintText: 'Enter your Username Or email',
                        controller: viewModel.emailController,
                        readOnly: false,
                        maxLines: 1,
                        isTitleVisible: true,
                      ),
                      30.verticalSpace,
                      CustomAppButtons.primaryButton(
                        text: 'Send Otp',
                        height: 50.h,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            final email = viewModel.emailController.text.trim();
                            viewModel.sendPasswordResetCode(context).then((
                              val,
                            ) {
                              if (val && context.mounted) {
                                context.push(
                                  '/forget_otp',
                                  extra: {"email": email},
                                );
                              }
                            });
                          } else {
                            MessageHelper.showErrorMessage(
                              context,
                              'Please enter a valid email address',
                            );
                          }
                        },
                        width: double.infinity,
                      ),
                    ],
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
