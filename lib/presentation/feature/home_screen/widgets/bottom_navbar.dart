import 'package:circ/domain/services/secure_storage_services.dart';
import 'package:circ/presentation/feature/chat/view/chat_list_screen.dart';
import 'package:circ/presentation/feature/chat/view_model/chat_view_model.dart';
import 'package:circ/presentation/feature/explore/view/explore_screen.dart';
import 'package:circ/presentation/feature/home_screen/view_model/home_view_model.dart';
import 'package:circ/presentation/feature/home_screen/views/home_screen.dart';
import 'package:circ/presentation/feature/profile_screen/views/profile_screen.dart';
import 'package:circ/presentation/feature/sell_screen/views/sell_screens.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/app_images.dart';
import 'package:circ/utils/custom_widgets/guest_restriction_dialog.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class BottomNavScreen extends StatefulWidget {
  final int? screenIndex;
  const BottomNavScreen({super.key, this.screenIndex});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  @override
  void initState() {
    super.initState();
    final vm = Provider.of<HomeViewModel>(context, listen: false);
    vm.setIndex(widget.screenIndex ?? 0);
  }

  final titles = ['Home', 'Search', 'Sell', 'Message', 'Profile'];
  final List<String> icons = [
    AppImages.homeIcon,
    AppImages.searchIcon,
    AppImages.sellIcon,
    AppImages.messageIcon,
    AppImages.profileIcon,
  ];

  final List<Widget> screens = [
    HomeScreen(),
    ExploreScreen(),
    SellScreen(),
    ChatListScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, bottomNavBarVm, child) {
        return Scaffold(
          backgroundColor: AppColors.secondaryBgColor,
          body: bottomNavBarVm.currentIndex == 0
              ? IndexedStack(
                  index: bottomNavBarVm.currentIndex,
                  children: screens,
                )
              : screens[bottomNavBarVm.currentIndex],
          bottomNavigationBar: Container(
            height: 60.h,
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColors.secondaryBgColor),
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) {
                final isSelected = bottomNavBarVm.currentIndex == index;
                return GestureDetector(
                  onTap: () async {
                    if ((index == 3 || index == 4 || index == 2) &&
                        await SecureStorageService.isGuestUser()) {
                      if (!context.mounted) return;
                      showDialog(
                        context: context,
                        builder: (ctx) => GuestRestrictionDialog(),
                      );
                      return;
                    }
                    if (!context.mounted) return;
                    bottomNavBarVm.updateIndex(index, context);
                  },
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        index == 3
                            ? Consumer<ChatViewModel>(
                                builder: (context, chatViewModel, child) {
                                  final totalUnreadCount = chatViewModel
                                      .combinedConversations
                                      .fold(
                                        0,
                                        (sum, conversation) =>
                                            sum + (conversation.unreadCount),
                                      );
                                  return Tooltip(
                                    message: totalUnreadCount > 0
                                        ? '$totalUnreadCount unread message${totalUnreadCount > 1 ? 's' : ''}'
                                        : 'No unread messages',
                                    child: Badge(
                                      label: Text(
                                        '$totalUnreadCount',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      offset: const Offset(3, -6),
                                      isLabelVisible: totalUnreadCount > 0,
                                      largeSize: 8.r,
                                      smallSize: 8.r,
                                      backgroundColor: const Color(0xffED2024),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 3),
                                        child: SvgPicture.asset(
                                          icons[index],
                                          // width: 2.w,
                                          height: 19.h,
                                          colorFilter: ColorFilter.mode(
                                            isSelected
                                                ? AppColors.primaryColor
                                                : AppColors.inActiveIconColor,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : SvgPicture.asset(
                                icons[index],
                                width: 22.w,
                                height: index == 0 ? 19.h : 22.h,
                                colorFilter: ColorFilter.mode(
                                  isSelected
                                      ? AppColors.primaryColor
                                      : AppColors.inActiveIconColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                        4.verticalSpace,
                        Text(
                          titles[index],
                          style: AppTextStyles.neueMontreal(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? AppColors.primaryColor
                                : AppColors.inActiveIconColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
