import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/detail_screen/widgets/product_card/custom_detail_card.dart';
import 'package:circ/presentation/feature/home_screen/view_model/home_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../domain/services/secure_storage_services.dart';
import '../../../../../utils/custom_widgets/guest_restriction_dialog.dart';

class ProductSellerHeader extends StatelessWidget {
  const ProductSellerHeader({super.key, required this.widget});

  final ProductDetailCard widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          GestureDetector(
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
              final vm = getIt.get<ProfileViewModel>();
              if (widget.product.seller?.id == vm.user?.id) {
                final navBarVm = getIt.get<HomeViewModel>();
                navBarVm.setIndex(4);
              } else {
                vm.clearOtherUser();
                if (context.mounted) {
                  context.push(
                    '/othersProfile',
                    extra: widget.product.seller?.id,
                  );
                }
              }
            },
            child: Row(
              spacing: 8.w,
              children: [
                NetworkImageHelper(
                  imagePath: widget.product.seller?.profilePic ?? '',
                  height: 30.h,
                  width: 30.w,
                  isCircular: true,
                ),
                Text(
                  widget.product.seller?.username ?? '',
                  style: AppTextStyles.neueMontreal(
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          if (widget.isSellerProduct ?? false)
            GestureDetector(
              onTap: () {
                widget.onSellerProductPress!();
              },
              child: Icon(Icons.more_vert, size: 25.sp, color: AppColors.black),
            ),
        ],
      ),
    );
  }
}
