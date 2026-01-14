import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/home_screen/widgets/badge_icon.dart';
import 'package:circ/utils/constants/app_images.dart';
import 'package:circ/utils/custom_widgets/guest_restriction_dialog.dart'
    show GuestRestrictionDialog;
import 'package:circ/utils/custom_widgets/suggestion_search_field.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../domain/services/secure_storage_services.dart';
import '../../presentation/feature/cart_screen/view_model/cart_view_model.dart';
import '../../presentation/feature/explore/view_model/explore_view_model.dart';
import '../../presentation/feature/home_screen/view_model/home_view_model.dart';
import '../../presentation/feature/profile_screen/view_model/profile_view_model.dart';

class ExplorePrimaryAppBar extends StatefulWidget {
  final void Function(String)? onSearchSubmit;
  const ExplorePrimaryAppBar({super.key, this.onSearchSubmit});

  @override
  State<ExplorePrimaryAppBar> createState() => _ExplorePrimaryAppBarState();
}

class _ExplorePrimaryAppBarState extends State<ExplorePrimaryAppBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ExploreViewModel>(
      builder: (context, vm, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: vm.currentState == 2
                        ? Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  vm.setCurrentState(1);
                                  vm.setExploreBrandId(id: null);
                                  vm.setExploreBrandId(id: null);
                                  vm.searchController.clear();
                                  vm.setSelectedCategory(
                                    mainCategoryId: null,
                                    subCategoryId: null,
                                    name: null,
                                  );
                                  vm.removeAppliedBrand();
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                  size: 17.sp,
                                ),
                              ),
                              4.horizontalSpace,
                              Flexible(
                                child: Text(
                                  vm.searchController.text.isNotEmpty
                                      ? 'Search Results for "${vm.searchController.text}"'
                                      : 'Products in "${vm.exploreBrandName ?? vm.exploreCatName ?? 'Type something'}"',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: AppTextStyles.neueMontreal(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : GestureDetector(
                            onTap: () {
                              final vm = getIt.get<HomeViewModel>();
                              vm.setIndex(0);
                            },
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Image.asset(
                                AppImages.circfilledlogo,
                                height: 38.h,
                                width: 76.w,
                              ),
                            ),
                          ),
                  ),
                  10.horizontalSpace,
                  Row(
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
                      SizedBox(width: 20.w),
                      // Consumer<CartViewModel>(
                      //   builder: (context, cartViewModel, _) {
                      //     return IconWithBadge(
                      //       icon: AppImages.cart,
                      //       badgeCount: cartViewModel.cartNumbers,
                      //       onTap: () => context.push('/cart'),
                      //     );
                      //   },
                      // ),
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
            SuggestionSearchField(onSearchSubmit: widget.onSearchSubmit),
          ],
        );
      },
    );
  }
}
