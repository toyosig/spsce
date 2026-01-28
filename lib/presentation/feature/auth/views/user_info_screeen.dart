import 'package:circ/presentation/feature/auth/view_model/auth_view_model.dart';
import 'package:circ/presentation/feature/auth/widgets/nigeria_state_dropdown.dart';
import 'package:circ/presentation/feature/auth/widgets/location_cities_data.dart';
import 'package:circ/presentation/feature/auth/widgets/location_areas_data.dart';
import 'package:circ/presentation/feature/explore/widgets/custom_dropdown.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/app_images.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';


class UserInfoScreeen extends StatefulWidget {
  const UserInfoScreeen({super.key});

  @override
  State<UserInfoScreeen> createState() => _UserInfoScreeenState();
}

class _UserInfoScreeenState extends State<UserInfoScreeen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, viewModel, _) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  controller: _scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 16.0,
                        ),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 20,
                            children: [
                              SizedBox(height: 5.h),
                              // Back button
                              Align(
                                alignment: Alignment.topLeft,
                                child: GestureDetector(
                                  onTap: () {
                                    context.pop();
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: AppColors.black,
                                    size: 24.sp,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h),

                              Image.asset(
                                AppImages.circfilledlogo,
                                height: 50.h,
                                width: 100.w,
                              ),
                              Text(
                                'Almost Done',
                                style: AppTextStyles.neueMontreal(
                                  fontSize: 24.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Enter your details below to create your account',
                                style: AppTextStyles.neueMontreal(
                                  fontSize: 15.sp,
                                  color: AppColors.greyText,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              NigeriaStateDropdown(
                                title: 'Location (Select Lagos or Abuja)',
                                selectedState: viewModel.state,
                                onChanged: (state) {
                                  if (state != null) {
                                    viewModel.setCurrentState(state);
                                  }
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'State is required';
                                  }
                                  return null;
                                },
                              ),
// City dropdown - only show if state is selected
                              if (viewModel.state.isNotEmpty)
                                CustomDropdown(
                                  title: 'Select Area',
                                  width: double.infinity,
                                  height: 55.h,
                                  items: LocationAreasData.areas[viewModel.state] ?? [],
                                  selectedValue: viewModel.area,
                                  onChanged: (value) {
                                    viewModel.setCurrentArea(value);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Area is required';
                                    }
                                    return null;
                                  },
                                ),
                              Text('Please Select Gender (Optional)'),
                              CustomDropdown(
                                width: double.infinity,
                                height: 55.h,
                                items: ['Male', 'Female', 'Other'],
                                selectedValue: viewModel.selectedGender,
                                onChanged: (value) {
                                  viewModel.setGender(value);
                                },
                              ),

                              CustomAppButtons.primaryButton(
                                width: double.infinity,
                                height: 50.h,
                                text: 'Continue',
                                onTap: () {
                                  if (formKey.currentState!.validate() && viewModel.area.isNotEmpty) { 
                                    viewModel.register(context);
                                  } else {
                                    MessageHelper.showErrorMessage(
                                      context,
                                      'Please fill in all required fields',
                                    );
                                  }
                                },
                              ),
                              SizedBox(height: 50.h), // Extra bottom padding
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}