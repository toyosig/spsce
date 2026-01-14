import 'dart:io';

import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/custom_text_field.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/custom_primary_app_bar.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfie extends StatefulWidget {
  const EditProfie({super.key});

  @override
  State<EditProfie> createState() => _EditProfieState();
}

class _EditProfieState extends State<EditProfie> {
  void _showImageSourceDialog({
    required BuildContext context,
    required VoidCallback onCameraTap,
    required VoidCallback onGalleryTap,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take Photo'),
                onTap: () {
                  Navigator.pop(ctx);
                  onCameraTap();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library, color: Colors.black),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(ctx);
                  onGalleryTap();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // context.read<ProfileViewModel>().getUserProfile();
      final profileViewModel = getIt<ProfileViewModel>();
      setState(() {
        profileViewModel.userNameController.text =
            profileViewModel.user?.username ?? '';
        profileViewModel.bioController.text = profileViewModel.user?.bio ?? '';
        profileViewModel.locationController.text =
            profileViewModel.user?.location ?? '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomPrimaryAppBar(
        title: 'Edit Profile',
        isBackButtonVisible: true,
      ),
      body: Consumer<ProfileViewModel>(
        builder: (context, profileViewModel, child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade300,
                        radius: 45,
                        child: profileViewModel.pickedImage != null
                            ? ClipOval(
                                child: Image.file(
                                  File(profileViewModel.pickedImage!.path),
                                  width: 90,
                                  height: 90,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : (profileViewModel.user?.profilePic?.isNotEmpty ??
                                  false)
                            ? NetworkImageHelper(
                                imagePath: profileViewModel.user!.profilePic!,
                                fit: BoxFit.cover,
                                height: 90,
                                width: 90,
                                isCircular: true,
                                errorWidget: Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                                placeholderWidget: const ColoredBox(
                                  color: Colors.transparent,
                                ),
                              )
                            : const Icon(
                                Icons.person,
                                size: 40,
                                color: Colors.grey,
                              ),
                      ),
                      Positioned(
                        right: -2,
                        bottom: -2,
                        child: Container(
                          height: 35.sp,
                          width: 35.sp,
                          decoration: BoxDecoration(
                            color: AppColors.black.withValues(alpha: 0.6),
                            shape: BoxShape.circle,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              _showImageSourceDialog(
                                context: context,
                                onCameraTap: () {
                                  profileViewModel.pickImage(
                                    context: context,
                                    source: ImageSource.camera,
                                  );
                                },
                                onGalleryTap: () {
                                  profileViewModel.pickImage(
                                    context: context,
                                    source: ImageSource.gallery,
                                  );
                                },
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.all(3.r),
                              child: Icon(
                                Icons.edit,
                                size: 20,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  15.verticalSpace,
                  Text(
                    'Click to change profile picture',
                    style: AppTextStyles.neueMontreal(
                      color: AppColors.primaryBlack.withValues(alpha: 0.5),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  32.verticalSpace,
                  LabeledTextField(
                    label: 'UserName',
                    hintText: '@username',
                    controller: profileViewModel.userNameController,
                    maxLines: 1,
                    isTitleVisible: true,
                    controller1: profileViewModel.userNameController,
                  ),
                  24.verticalSpace,
                  LabeledTextField(
                    label: 'Bio',
                    hintText: '200 Characters maximum',
                    controller: profileViewModel.bioController,
                    maxLines: 7,
                    isTitleVisible: true,
                    controller1: profileViewModel.bioController,
                  ),
                  24.verticalSpace,
                  LabeledTextField(
                    label: 'Location',
                    hintText: 'Enter your location',
                    controller: profileViewModel.locationController,
                    maxLines: 1,
                    isTitleVisible: true,
                    controller1: profileViewModel.locationController,
                  ),
                  120.verticalSpace,
                  CustomAppButtons.primaryButton(
                    text: 'Save Changes',
                    onTap: () {
                      profileViewModel.editProfile(context).then((value) {
                        if (value) {
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        }
                      });
                    },
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
