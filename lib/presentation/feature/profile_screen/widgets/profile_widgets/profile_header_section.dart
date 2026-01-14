import 'package:circ/data/models/user_model/user_model.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/profile_widgets/hero_profile.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/profile_widgets/stat_item.dart'
    show StatItem;
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/app_images.dart';
import 'package:circ/utils/constants/custom_primary_app_bar.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/share_button.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({
    super.key,
    required this.user,
    required this.cartCount,
    required this.followers,
    required this.following,
  });
  final UserModel user;
  final int cartCount;
  final List followers;
  final List following;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPrimaryAppBar(
          title: 'Profile',
          showTrailing: true,
          isBackButtonVisible: false,
          showSetting: true,
        ),
        6.verticalSpace,
        ProfileImageSection(user: user),
        10.verticalSpace,
        ProfileInfoSection(user: user),
        ProfileStatsSection(
          user: user,
          followers: followers,
          following: following,
        ),
        ProfileButtonsSection(user: user),
      ],
    );
  }
}

class ProfileImageSection extends StatelessWidget {
  final dynamic user;

  const ProfileImageSection({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(HeroProfile.route, extra: user.profilePic);
      },
      child: NetworkImageHelper(
        imagePath: user.profilePic ?? '',
        isCircular: true,
        fit: BoxFit.cover,
        height: 90.h,
        width: 90.w,
      ),
    );
  }
}

class ProfileInfoSection extends StatelessWidget {
  final dynamic user;

  const ProfileInfoSection({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Text(
            '@ ${user.username}',
            style: AppTextStyles.neueMontreal(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          10.verticalSpace,
          Text(
            user.bio ?? '',
            textAlign: TextAlign.center,
            style: AppTextStyles.neueMontreal(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
          ),
          10.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppImages.locationIcon,
                height: 16.h,
                width: 13.w,
              ),
              5.horizontalSpace,
              Text(
                user.location ?? '',
                style: AppTextStyles.neueMontreal(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
          10.verticalSpace,
          Text(
            '0 item sold',
            style: AppTextStyles.neueMontreal(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileStatsSection extends StatelessWidget {
  final UserModel user;
  final List followers;
  final List following;

  const ProfileStatsSection({
    required this.user,
    required this.followers,
    required this.following,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.h, vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StatItem(
            value: Formators.formatLikeCount(user.followerCount ?? 0),
            label: 'Followers',
            onTap: () {
              context.push(
                '/followers_following',
                extra: {'userId': user.id, 'initialTab': 0},
              );
            },
          ),
          StatItem(
            value: Formators.formatLikeCount(user.followingCount ?? 0),
            label: 'Following',
            onTap: () {
              context.push(
                '/followers_following',
                extra: {'userId': user.id, 'initialTab': 1},
              );
            },
          ),
          StatItem(
            textcolor: AppColors.primaryColor,
            value: user.averageRating.toString(),
            label: '${user.totalReviews} reviews',
            showStar: true,
            onTap: () {
              context.push(
                '/reviews',
                extra: {
                  'userId': user.id,
                  'avgRating': user.averageRating?.toInt(),
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProfileButtonsSection extends StatelessWidget {
  final dynamic user;

  const ProfileButtonsSection({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomAppButtons.profileIconButton(
            context: context,
            label: 'Edit Profile',
            image: AppImages.editProfile,
            onTap: () => context.push('/edit_profile'),
          ),
          ShareButton(id: user.id ?? '', type: 'profile'),
          CustomAppButtons.profileIconButton(
            context: context,
            label: 'Balance',
            image: AppImages.walletBalence,
            onTap: () => context.push('/cric_balance'),
          ),
        ],
      ),
    );
  }
}
