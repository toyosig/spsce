import 'package:circ/core/widgets/no_results_found.dart';
import 'package:circ/utils/constants/custom_primary_app_bar.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({super.key});

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  ProfileViewModel? profileViewModel;

  @override
  void initState() {
    super.initState();
    profileViewModel = getIt.get<ProfileViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      profileViewModel?.getTermConditions(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomPrimaryAppBar(
        title: 'Terms & Conditions',
        isBackButtonVisible: true,
      ),
      body: Consumer<ProfileViewModel>(
        builder: (context, profileViewModel, child) {
          if (profileViewModel.termConditions?.isEmpty ?? true) {
            return Center(child: NoResultsFound());
          }
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Html(
              data: profileViewModel.termConditions?[0].content ?? '',
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
