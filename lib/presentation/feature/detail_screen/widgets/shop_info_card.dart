import 'package:circ/data/models/auth/auth_user_model.dart';
import 'package:circ/data/models/user_model/user_model.dart';
import 'package:circ/domain/services/secure_storage_services.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/app_images.dart';
import 'package:circ/utils/custom_widgets/guest_restriction_dialog.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../profile_screen/view_model/profile_view_model.dart';

class ShopInfoCard extends StatelessWidget {
  final AuthUserModel seller;
  final bool showReviews;
  final UserModel? user;
  final VoidCallback? onMessageTap;
  final VoidCallback? onShopTap;
  const ShopInfoCard({
    super.key,
    required this.seller,
    this.onShopTap,
    this.showReviews = true,
    this.user,
    this.onMessageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
      builder: (context, profileVM, _) {
        final bool isOwnProfile = profileVM.user?.id == seller.id;
        final isFollowing =
            profileVM.user?.following?.any((u) => u.id == seller.id) ?? false;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 17.h),
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
          decoration: BoxDecoration(
            color: AppColors.black.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(2.r),
          ),
          child: Column(
            spacing: 10.h,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: GestureDetector(
                      onTap: onShopTap,
                      child: NetworkImageHelper(
                        imagePath: seller.profilePic ?? '',
                        height: 36.h,
                        width: 36.w,
                        isCircular: true,
                      ),
                    ),
                  ),
                  14.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          seller.username ?? '',
                          style: AppTextStyles.neueMontreal(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryBlack,
                          ),
                        ),
                        4.verticalSpace,
                        if (showReviews)
                          Row(
                            children: [
                              ..._buildRatingStars(seller.averageReview ?? 0),
                              4.horizontalSpace,
                              Text(
                                "${seller.reviewCount ?? '0'} ",
                                style: AppTextStyles.neueMontreal(
                                  fontSize: 12.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  if (isFollowing || isOwnProfile)
                    Row(
                      spacing: 20.w,
                      children: [
                        if (!isOwnProfile)
                          GestureDetector(
                            onTap: onMessageTap,
                            child: SizedBox(
                              child: Icon(
                                Icons.email_outlined,
                                color: Color(0xFF696969),
                                size: 21.sp,
                              ),
                            ),
                          ),
                        if (!isOwnProfile)
                          GestureDetector(
                            onTap: onShopTap,
                            child: SizedBox(
                              child: Text(
                                'Visit Shop',
                                style: AppTextStyles.neueMontreal(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryBlack.withValues(
                                    alpha: 0.6,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
              if (!isFollowing && !isOwnProfile)
                Row(
                  spacing: 8.w,
                  children: [
                    if (seller.id != profileVM.user?.id)
                      Consumer<ProfileViewModel>(
                        builder: (context, viewModel, _) {
                          return CustomAppButtons.primaryIconButton(
                            text: 'Follow',
                            fontSize: 13.sp,
                            height: 36.h,
                            onTap: () async {
                              if (!viewModel.isLoading) {
                                if (await SecureStorageService.isGuestUser()) {
                                  if (context.mounted) {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) =>
                                          GuestRestrictionDialog(),
                                    );
                                  }
                                  return;
                                }
                                if (!context.mounted) return;
                                viewModel.followUser(
                                  id: seller.id ?? '',
                                  context: context,
                                );
                              }
                            },
                            borderRadius: 100.r,
                            backgroundColor: AppColors.primaryColor,
                            textColor: AppColors.white,
                            borderColor: Color(0xFFE4E4E7),
                            svg: SvgPicture.asset(
                              AppImages.addFollowIcon,
                              height: 15.h,
                              width: 15.w,
                            ),
                            iconColor: AppColors.white,
                          );
                        },
                      ),
                    CustomAppButtons.primaryIconButton(
                      text: 'Message',
                      height: 36.h,
                      onTap: () => onMessageTap?.call(),
                      backgroundColor: AppColors.white,
                      borderColor: Color(0xFFE4E4E7),
                      borderRadius: 100.r,
                      textColor: AppColors.primaryBlack.withValues(alpha: 0.6),
                      fontSize: 13.sp,
                      icon: Icons.mail_outline,
                      iconColor: AppColors.primaryBlack.withValues(alpha: 0.6),
                    ),

                    CustomAppButtons.primaryIconButton(
                      text: 'Visit Shop',
                      height: 36.h,
                      borderRadius: 100.r,
                      borderColor: Color(0xFFE4E4E7),
                      onTap: () => onShopTap?.call(),
                      backgroundColor: AppColors.white,
                      fontSize: 13.sp,
                      textColor: AppColors.primaryBlack.withValues(alpha: 0.6),
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildRatingStars(double rating) {
    List<Widget> stars = [];
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    for (int i = 0; i < fullStars; i++) {
      stars.add(Icon(Icons.star, color: AppColors.primaryColor, size: 16.sp));
    }

    if (hasHalfStar) {
      stars.add(
        Icon(Icons.star_half, color: AppColors.primaryColor, size: 16.sp),
      );
    }

    for (int i = 0; i < emptyStars; i++) {
      stars.add(
        Icon(Icons.star_border, color: AppColors.primaryColor, size: 16.sp),
      );
    }

    return stars;
  }
}
