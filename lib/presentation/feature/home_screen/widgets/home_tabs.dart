import 'package:circ/domain/services/secure_storage_services.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/guest_restriction_dialog.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTabs extends StatelessWidget {
  final TabController tabController;
  const HomeTabs({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      dividerColor: AppColors.primaryColor.withAlpha(51),
      dividerHeight: 2,
      labelColor: Color(0xff101010),
      unselectedLabelColor: Color(0xff101010).withValues(alpha: 0.6),
      labelStyle: AppTextStyles.neueMontreal(
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontSize: 15.sp,
      ),
      unselectedLabelStyle: AppTextStyles.neueMontreal(
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontSize: 15.sp,
      ),
      indicatorColor: AppColors.black,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 2,
      automaticIndicatorColorAdjustment: true,
      // overlayColor: WidgetStateProperty.all(
      //   Color(0xFFFF2F40).withValues(alpha: 0.2),
      // ),
      tabs: const [
        Tab(text: 'For You'),
        Tab(text: 'Following'),
      ],
      onTap: (index) async {
        if (index == 1 && await SecureStorageService.isGuestUser()) {
          // Prevent tab switch
          if (context.mounted) {
            showDialog(
              context: context,
              builder: (ctx) => GuestRestrictionDialog(),
            );
          }
          tabController.index = 0;
        }
      },
    );
  }
}
