import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/home_screen/view_model/home_view_model.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../domain/services/secure_storage_services.dart';
import '../../../../utils/constants/app_images.dart';
import '../../../../utils/custom_widgets/guest_restriction_dialog.dart';
import '../../cart_screen/view_model/cart_view_model.dart';
import '../../home_screen/widgets/badge_icon.dart';

class CircAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onNotificationTap;

  const CircAppBar({
    super.key,
    required this.title,
    required this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: Column(
        children: [
          AppBar(
            forceMaterialTransparency: true,
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              title,
              style: AppTextStyles.neueMontreal(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: Colors.black,
              ),
            ),
            leading: GestureDetector(
              onTap: () {
                context.go('/navbar', extra: 0);
                final vm = getIt.get<HomeViewModel>();
                vm.setIndex(0);
              },
              child: SvgPicture.asset('assets/svg/Circ_logo.svg', height: 20.h),
            ),
            actions: [
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
              // context.watch<CartViewModel>().cartNumbers == 0
              //     ? GestureDetector(
              //         onTap: () => context.push('/cart'),
              //         child: SvgPicture.asset(
              //           'assets/svg/shopping.svg',
              //           height: 23,
              //           colorFilter:
              //               const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
              //         ),
              //       )
              //     : GestureDetector(
              //         onTap: () => context.push('/cart'),
              //         child: Padding(
              //           padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //           child: Badge(
              //             label: Text(
              //               context.watch<CartViewModel>().cartNumbers == 0
              //                   ? '0'
              //                   : context
              //                         .watch<CartViewModel>()
              //                         .cartNumbers
              //                         .toString(),
              //               style: TextStyle(fontSize: 10),
              //             ),
              //             smallSize: 16,
              //             backgroundColor: Colors.red,
              //             child: SvgPicture.asset(
              //               'assets/svg/shopping.svg',
              //               height: 23,
              //               colorFilter: const ColorFilter.mode(
              //                 AppColors.black,
              //                 BlendMode.srcIn,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
            ],
          ),
          10.verticalSpace,
          Divider(height: 1, color: Colors.grey.shade300),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
