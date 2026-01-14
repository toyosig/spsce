import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/auth/view_model/auth_view_model.dart';
import 'package:circ/presentation/feature/auth/widgets/custom_text_field.dart';
import 'package:circ/presentation/feature/auth/widgets/login_text_row.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/app_images.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:circ/utils/validators/form_validators.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthViewModel? authViewModel;

  @override
  void initState() {
    super.initState();
    authViewModel = getIt.get<AuthViewModel>();
    authViewModel?.setControllers();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Consumer<AuthViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    Image.asset(
                      AppImages.circfilledlogo,
                      height: 50.h,
                      width: 100.w,
                    ),
                    20.verticalSpace,
                    Text(
                      'Login',
                      style: AppTextStyles.neueMontreal(
                        fontSize: 24.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      'Login to your account below',
                      style: AppTextStyles.neueMontreal(
                        fontSize: 15.sp,
                        color: AppColors.greyText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    20.verticalSpace,
                    LabelTextField(
                      textInputType: TextInputType.emailAddress,
                      label: 'Email Address',
                      hintText: 'Enter your Username Or email',
                      controller: viewModel.emailController,
                      readOnly: false,
                      maxLines: 1,
                      isTitleVisible: true,
                    ),
                    20.verticalSpace,
                    LabelTextField(
                      textInputType: TextInputType.visiblePassword,
                      label: 'Password',
                      hintText: 'Enter your Password',
                      controller: viewModel.passwordController,
                      readOnly: false,
                      maxLines: 1,
                      validator: FormValidators.validatePassword,
                      isTitleVisible: true,
                      isObscureText: viewModel.isConfirmObscureText,
                      onSuffixIconTap: () {
                        viewModel.toggleConfirmObscureText();
                      },
                      isSuffixIconVisible: true,
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: viewModel.rememberMe,
                              onChanged: (value) {
                                viewModel.setRememberMe(value ?? false);
                              },
                              activeColor: AppColors.primaryColor,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity(
                                horizontal: -2,
                                vertical: -4,
                              ),
                            ),
                            SizedBox(width: 0.w),
                            Text(
                              'Remember me',
                              style: AppTextStyles.neueMontreal(
                                fontSize: 14.sp,
                                color: AppColors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            viewModel.clear();
                            context.push('/forget-password');
                          },
                          child: Text(
                            'Forgot Password?',
                            style: AppTextStyles.neueMontreal(
                              fontSize: 14.sp,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),

                    10.verticalSpace,
                    CustomAppButtons.primaryButton(
                      height: 50,
                      text: 'Log In',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          viewModel.login(context);
                        } else {
                          MessageHelper.showErrorMessage(
                            context,
                            'Please fill all the fields',
                          );
                        }
                      },
                      width: double.infinity,
                    ),
                    20.verticalSpace,
                    LoginTextRow(),
                    20.verticalSpace,
                    CustomAppButtons.primaryImageButton(
                      text: 'Login with Google',
                      onTap: viewModel.isSocialLoading
                          ? () {}
                          : () => viewModel.signInWithGoogle(context),
                      image: AppImages.google,
                      width: double.infinity,
                    ),
                    15.verticalSpace,
                    CustomAppButtons.primaryIconButton(
                      text: 'Login with Apple',
                      onTap: viewModel.isSocialLoading
                          ? () {}
                          : () => viewModel.signInWithApple(context),
                      icon: Icons.apple,
                      iconColor: AppColors.black,
                      width: double.infinity,
                    ),
                    15.verticalSpace,
                    CustomAppButtons.primaryIconButton(
                      backgroundColor: AppColors.green,
                      text: 'Continue as guest',
                      onTap: () => viewModel.loginAsGuest(context),
                      icon: Icons.person_pin,
                      iconColor: AppColors.black,
                      width: double.infinity,
                    ),
                    30.verticalSpace,
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: AppTextStyles.neueMontreal(
                            fontSize: 15.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign up',
                              style: AppTextStyles.neueMontreal(
                                fontSize: 15.sp,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  viewModel.clear();
                                  viewModel.setTermConditions(false);
                                  viewModel.emailController.clear();
                                  viewModel.passwordController.clear();
                                  context.go('/register');
                                },
                            ),
                          ],
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
