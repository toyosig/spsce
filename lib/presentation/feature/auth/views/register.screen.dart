import 'package:circ/presentation/feature/auth/view_model/auth_view_model.dart';
import 'package:circ/presentation/feature/auth/widgets/custom_text_field.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/app_images.dart';
import 'package:circ/utils/custom_widgets/custom_date_picker.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:circ/utils/validators/form_validators.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Consumer<AuthViewModel>(
      builder: (context, viewModel, _) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20,
                    children: [
                      SizedBox(height: 5.h),
                      Image.asset(
                        AppImages.circfilledlogo,
                        height: 50.h,
                        width: 100.w,
                      ),
                      Text(
                        'Sign Up',
                        style: AppTextStyles.neueMontreal(
                          fontSize: 24.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Enter your details to create your account',
                        style: AppTextStyles.neueMontreal(
                          fontSize: 15.sp,
                          color: AppColors.greyText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      LabelTextField(
                        textInputType: TextInputType.name,
                        label: 'Full Name',
                        hintText: 'Enter your name',
                        controller: viewModel.nameController,
                        readOnly: false,
                        maxLines: 1,
                        isTitleVisible: true,
                      ),
                      LabelTextField(
                        textInputType: TextInputType.name,
                        label: 'User Name',
                        hintText: 'Enter your user name',
                        controller: viewModel.usernameController,
                        readOnly: false,
                        maxLines: 1,
                        isTitleVisible: true,
                      ),
                      LabelTextField(
                        textInputType: TextInputType.emailAddress,
                        label: 'Date of Birth (Optional)',
                        hintText: 'Enter your date of birth',
                        controller: viewModel.dobController,
                        readOnly: true,
                        maxLines: 1,
                        isTitleVisible: true,
                        validator: (value) {
                          return null;
                        }, // Make this field truly optional
                        suffixIcon: Icons.calendar_month_rounded,
                        onSuffixIconTap: () {
                          DatePickerHelper().showReusableDatePicker(
                            context: context,
                            controller: viewModel.dobController,
                            onDateSelected: (date) {
                              viewModel.dob = date;
                            },
                          );
                        },
                        isSuffixIconVisible: true,
                      ),

                      LabelTextField(
                        textInputType: TextInputType.emailAddress,
                        label: 'Email Address',
                        hintText: 'Enter your email',
                        controller: viewModel.emailController,
                        readOnly: false,
                        maxLines: 1,
                        isTitleVisible: true,
                        validator: FormValidators.validateEmail,
                      ),

                      // Password
                      LabelTextField(
                        textInputType: TextInputType.visiblePassword,
                        label: 'Password',
                        hintText: 'Enter your Password',
                        controller: viewModel.passwordController,
                        readOnly: false,
                        maxLines: 1,
                        isTitleVisible: true,
                        validator: FormValidators.validatePassword,
                        isObscureText: viewModel.isObscureText,
                        onSuffixIconTap: () {
                          viewModel.toggleObscureText();
                        },
                        isSuffixIconVisible: true,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: viewModel.tcAccepted,
                            onChanged: (value) {
                              viewModel.setTermConditions(value ?? false);
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
                          RichText(
                            text: TextSpan(
                              text: 'I Accept the ',
                              style: AppTextStyles.neueMontreal(
                                fontSize: 14.sp,
                                color: AppColors.black,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Terms and Conditions',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.push('/terms');
                                    },
                                  style: AppTextStyles.neueMontreal(
                                    fontSize: 14.sp,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      CustomAppButtons.primaryButton(
                        text: 'Next',
                        onTap: () {
                          if (!viewModel.tcAccepted) {
                            MessageHelper.showErrorMessage(
                              context,
                              'Please Accept Terms and Conditions',
                            );
                            return;
                          }
                          if (formKey.currentState?.validate() == true) {
                            context.push('/user_register');
                          } else {
                            MessageHelper.showErrorMessage(
                              context,
                              'Please fill all required fields correctly',
                            );
                          }
                        },
                        width: double.infinity,
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Already have an account? ",
                            style: AppTextStyles.neueMontreal(
                              fontSize: 15.sp,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign in',
                                style: AppTextStyles.neueMontreal(
                                  fontSize: 15.sp,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    viewModel.clear();
                                    viewModel.setTermConditions(false);
                                    context.go('/login');
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
          ),
        );
      },
    );
  }
}
