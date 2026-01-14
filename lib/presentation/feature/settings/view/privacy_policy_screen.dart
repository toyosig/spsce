import 'package:circ/core/constant/global.dart';
import 'package:circ/core/widgets/no_results_found.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/custom_primary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  ProfileViewModel? profileViewModel;

  @override
  void initState() {
    super.initState();
    profileViewModel = getIt.get<ProfileViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      profileViewModel?.getPrivacyPolicy(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomPrimaryAppBar(
        title: 'Privacy Policy',
        isBackButtonVisible: true,
      ),
      body: Consumer<ProfileViewModel>(
        builder: (context, profileViewModel, child) {
          if (profileViewModel.isLoading) {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.all(10.r),
              ),
            );
          }
          if (profileViewModel.privacyPolicy?.isEmpty ?? true) {
            return Center(child: NoResultsFound());
          }
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Html(
              data: profileViewModel.privacyPolicy?[0].content ?? '',
              style: {
                "body": Style(
                  fontSize: FontSize(14.sp),
                  color: AppColors.black,
                  fontFamily: 'NeueMontreal',
                ),
              },
            ),
          );
        },
      ),
    );
  }
}
