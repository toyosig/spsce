// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:circ/presentation/feature/cart_screen/view_model/cart_view_model.dart';
import 'package:circ/presentation/feature/home_screen/widgets/badge_icon.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/app_images.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:circ/utils/custom_widgets/guest_restriction_dialog.dart';
import 'package:circ/domain/services/secure_storage_services.dart';

class CustomPrimaryAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool? showTrailing;
  final int? notiNumber;
  final bool? isBackButtonVisible;
  final bool? showSetting;
  final bool? showPopupMenu;
  final Function(String)? onPopupMenuSelected;
  final bool? isMarkingAllAsRead;
  final bool? hasUnreadNotifications;
  final void Function()? onTap;

  const CustomPrimaryAppBar({
    super.key,
    required this.title,
    this.showTrailing,
    this.notiNumber,
    this.isBackButtonVisible,
    this.showSetting = false,
    this.showPopupMenu = false,
    this.onPopupMenuSelected,
    this.isMarkingAllAsRead = false,
    this.hasUnreadNotifications = false,
    this.onTap 
  });

  @override
  Size get preferredSize => Size.fromHeight(80.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      centerTitle: !title.contains("\""),
      forceMaterialTransparency: true,
      leading: isBackButtonVisible == true
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 18.sp,
              ),
              onPressed: () {
                if (onTap != null) {
                  onTap!();
                } else {
                  context.pop();
                }
              },
            )
          : null,
      title: Text(
        title,
        style: AppTextStyles.neueMontreal(
          color: AppColors.primaryBlack,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
        ),
      ),
      actions: [
        if (showPopupMenu == true)
          PopupMenuButton<String>(
            icon: Container(
              padding: EdgeInsets.all(8.r),
              child: Icon(
                Icons.more_horiz,
                color: AppColors.primaryBlack,
                size: 24.sp,
              ),
            ),
            offset: Offset(0, 50.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.r),
              side: BorderSide(
                color: AppColors.primaryBlack.withValues(alpha: 0.01),
                width: 1,
              ),
            ),
            elevation: 1,
            color: AppColors.backgrey,
            onSelected: onPopupMenuSelected,
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'mark_all_read',
                enabled:
                    (hasUnreadNotifications ?? false) &&
                    !(isMarkingAllAsRead ?? false),
                height: 38.h,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    children: [
                      Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          color:
                              (hasUnreadNotifications ?? false) &&
                                  !(isMarkingAllAsRead ?? false)
                              ? AppColors.primaryColor.withValues(alpha: 0.09)
                              : AppColors.primaryBlack.withValues(alpha: 0.06),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: isMarkingAllAsRead == true
                              ? SizedBox(
                                  width: 16.sp,
                                  height: 16.sp,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: AppColors.primaryColor,
                                  ),
                                )
                              : Icon(
                                  Icons.mark_email_read,
                                  color:
                                      (hasUnreadNotifications ?? false) &&
                                          !(isMarkingAllAsRead ?? false)
                                      ? AppColors.primaryColor
                                      : AppColors.grey,
                                  size: 18.sp,
                                ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          isMarkingAllAsRead == true
                              ? 'Marking as read...'
                              : 'Mark all as read',
                          style: TextStyle(
                            color:
                                (hasUnreadNotifications ?? false) &&
                                    !(isMarkingAllAsRead ?? false)
                                ? AppColors.primaryBlack
                                : AppColors.primaryBlack.withValues(alpha: 0.6),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        if ((showTrailing ?? false)) ...[
          Row(
            children: [
              showSetting == true
                  ? IconWithBadge(
                      icon: AppImages.settingIcon,
                      badgeCount: 0,
                      onTap: () => context.push('/settings'),
                    )
                  : Consumer<ProfileViewModel>(
                      builder: (context, profileViewModel, _) {
                        return IconWithBadge(
                          icon: AppImages.notiBell,
                          badgeCount: profileViewModel.notifications
                              .where((n) => !(n.isRead ?? false))
                              .length,
                          onTap: () async {
                            if (await SecureStorageService.isGuestUser()) {
                              if (context.mounted) {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => GuestRestrictionDialog(),
                                );
                                return;
                              }
                            }
                            if (context.mounted) {
                              context.push('/notificationScreen');
                            }
                          },
                        );
                      },
                    ),
              20.horizontalSpace,
              Consumer<CartViewModel>(
                builder: (context, cartViewModel, _) {
                  return IconWithBadge(
                    icon: AppImages.cart,
                    badgeCount: cartViewModel.cartNumbers,
                    onTap: () async {
                      if (await SecureStorageService.isGuestUser()) {
                        if (context.mounted) {
                          showDialog(
                            context: context,
                            builder: (ctx) => GuestRestrictionDialog(),
                          );
                          return;
                        }
                      }
                      if (context.mounted) {
                        context.push('/cart');
                      }
                    },
                  );
                },
              ),
            ],
          ),
          SizedBox(width: 16.w),
        ],
      ],
    );
  }
}
