import 'package:circ/presentation/feature/auth/widgets/custom_text_field.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/custom_primary_app_bar.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProfileViewModel>(context, listen: true);
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomPrimaryAppBar(title: '', isBackButtonVisible: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Change Password',
                  style: AppTextStyles.neueMontreal(
                    color: AppColors.primaryBlack,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              10.verticalSpace,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Change password',
                  style: AppTextStyles.neueMontreal(
                    color: AppColors.primaryBlack.withValues(alpha: 0.6),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              24.verticalSpace,
              LabelTextField(
                textInputType: TextInputType.visiblePassword,
                label: 'Password',
                hintText: 'Enter Current Password',
                controller: viewModel.currentPasswordController,
                readOnly: false,
                maxLines: 1,
                isTitleVisible: true,
                isObscureText: viewModel.isObscureText,
                onSuffixIconTap: () {
                  viewModel.toggleObscureText();
                },
                isSuffixIconVisible: true,
              ),
              16.verticalSpace,
              LabelTextField(
                textInputType: TextInputType.visiblePassword,
                label: 'Password',
                hintText: 'Enter New Password',
                controller: viewModel.newPasswordController,
                readOnly: false,
                maxLines: 1,
                isTitleVisible: true,
                isObscureText: viewModel.isConfirmObscureText,
                onSuffixIconTap: () {
                  viewModel.toggleConfirmObscureText();
                },
                isSuffixIconVisible: true,
              ),
              16.verticalSpace,

              // Confirm Password
              LabelTextField(
                textInputType: TextInputType.visiblePassword,
                label: 'Confirm Password',
                hintText: 'Confirm password again',
                controller: viewModel.confirmPasswordController,
                readOnly: false,
                maxLines: 1,
                isTitleVisible: true,
                isObscureText: viewModel.isConfirmObscureText,
                onSuffixIconTap: () {
                  viewModel.toggleConfirmObscureText();
                },
                isSuffixIconVisible: true,
              ),
              SizedBox(height: 60.h),
              CustomAppButtons.primaryButton(
                text: 'Change Password',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    viewModel.changePassword(context).then((value) {
                      if (value) {
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      }
                    });
                  }
                },
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
