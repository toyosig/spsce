import 'package:circ/presentation/feature/home_screen/widgets/badge_icon.dart';
import 'package:circ/utils/constants/app_images.dart';
import 'package:circ/utils/custom_widgets/suggestion_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:circ/presentation/feature/cart_screen/view_model/cart_view_model.dart';
import 'package:circ/presentation/feature/explore/view_model/explore_view_model.dart';
import 'package:circ/presentation/feature/home_screen/view_model/home_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/utils/custom_widgets/guest_restriction_dialog.dart';
import 'package:circ/domain/services/secure_storage_services.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.vm, required this.exploreVm});

  final HomeViewModel vm;
  final ExploreViewModel exploreVm;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppImages.circfilledlogo, height: 38.h, width: 76.w),
              Row(
                spacing: 20.w,
                children: [
                  Consumer<ProfileViewModel>(
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
                          // Navigate to notification screen
                          if (context.mounted) {
                            context.push('/notificationScreen');
                          }
                        },
                      );
                    },
                  ),
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
                            }
                            return;
                          }
                          if (!context.mounted) return;
                          context.push('/cart');
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        10.verticalSpace,
        SuggestionSearchField(
          onSearchSubmit: (query) {
            exploreVm.searchProducts(context, isRefresh: true);
          },
          isHomeScreen: true,
        ),
      ],
    );
  }
}
