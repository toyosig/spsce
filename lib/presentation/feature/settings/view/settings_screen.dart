import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/auth/view_model/auth_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/custom_arrow.dart';
import 'package:circ/presentation/feature/settings/widgets/notification_tile.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/custom_primary_app_bar.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../utils/helpers/dialog_helper.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<AuthViewModel>();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomPrimaryAppBar(title: 'Settings', isBackButtonVisible: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Settings',
              style: AppTextStyles.neueMontreal(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 20),
            CustomArrowButton(
              onTap: () {
                context.push('/edit_profile');
              },
              text: 'Edit profile',
              isicon: true,
              icon: 'assets/images/user.png',
              imageheight: 18.h,
              isBorder: false,
            ),
            12.verticalSpace,
            CustomArrowButton(
              onTap: () {
                context.push('/changePassword');
              },
              text: 'Change password',
              isicon: true,
              icon: 'assets/images/lock.png',
              isBorder: false,
            ),
            12.verticalSpace,
            CustomArrowButton(
              onTap: () {
                context.push('/terms');
              },
              text: 'Terms & Conditions',
              isicon: true,
              icon: 'assets/images/terms_cond.png',
              imageheight: 18.h,
              isBorder: false,
            ),
            12.verticalSpace,
            CustomArrowButton(
              onTap: () {
                context.push('/privacy');
              },
              text: 'Privacy Policy',
              isicon: true,
              icon: 'assets/images/privacy-policy.png',
              isBorder: false,
            ),
            const SizedBox(height: 30),
            Text(
              'Notifications',
              style: AppTextStyles.neueMontreal(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 8),
            Consumer<ProfileViewModel>(
              builder: (context, viewModel, child) {
                return NotificationToggleTile(
                  title: 'Email Notifications',
                  subtitle: 'Get emails about your activity',
                  value: viewModel.user?.emailNotification ?? false,
                  onChanged: (val) {
                    viewModel.toggleEmailNotification(context);
                  },
                );
              },
            ),
            Consumer<ProfileViewModel>(
              builder: (context, viewModel, child) {
                return NotificationToggleTile(
                  title: 'Push Notifications',
                  subtitle: 'Get notified about new messages',
                  value: viewModel.user?.pushNotification ?? false,
                  onChanged: (val) {
                    viewModel.togglePushNotification(context);
                  },
                );
              },
            ),
            70.verticalSpace,
            CustomAppButtons.primaryIconButton(
              height: 50.h,
              width: double.infinity,
              text: 'Logout',
              backgroundColor: AppColors.black,
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierColor: Colors.black.withAlpha((255 * 0.5).toInt()),
                  builder: (context) => CustomDialog(
                    title: "Logout",
                    message: "Are you sure you want to log out?",
                    btntext: "Logout",
                    onbtnPressed: () => viewModel.logout(context),
                  ),
                );
              },
              textColor: AppColors.white,
              icon: Icons.logout_outlined,
              iconColor: AppColors.white,
            ),
            16.verticalSpace,
            Consumer<ProfileViewModel>(
              builder: (context, profileViewModel, child) {
                return CustomAppButtons.primaryIconButton(
                  height: 50.h,
                  width: double.infinity,
                  text: 'Delete Account',
                  backgroundColor: Colors.red,
                  onTap: () async {
                    final mainContext = context;
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      barrierColor: Colors.black.withAlpha((255 * 0.5).toInt()),
                      builder: (context) => CustomDialog(
                        title: "Delete Account",
                        message:
                            "Are you sure you want to delete your account? This action cannot be undone.",
                        btntext: "Delete",
                        onbtnPressed: () async {
                          await profileViewModel.deactivateAccount(mainContext);
                        },
                      ),
                    );
                  },
                  textColor: AppColors.white,
                  icon: Icons.delete_forever,
                  iconColor: AppColors.white,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
