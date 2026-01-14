import 'package:circ/core/constant/global.dart';
import 'package:circ/core/widgets/share_button.dart';
import 'package:circ/data/models/auth/auth_user_model.dart';
import 'package:circ/data/models/home/products_data.dart';
import 'package:circ/domain/services/secure_storage_services.dart';
import 'package:circ/presentation/feature/home_screen/view_model/home_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/guest_restriction_dialog.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatefulWidget {
  final ProductsData productModel;
  final List<String> imageUrl;
  final String username;
  final double price;
  final String? productName;
  final String size;
  final VoidCallback onproductTap;
  final Function() onFavoriteToggle;
  final AuthUserModel? seller;
  final String? productId;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.username,
    required this.price,
    required this.size,
    required this.onFavoriteToggle,
    required this.onproductTap,
    this.seller,
    this.productName,
    this.productId,
    required this.productModel,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final profileVm = getIt.get<ProfileViewModel>();
    final currentUserId = profileVm.user?.id;
    final isFavorite =
        widget.productModel.likes?.any(
          (like) => like.user?.id == currentUserId,
        ) ??
        false;
    final likeCount = widget.productModel.likeCount ?? 0;

    return GestureDetector(
      onTap: widget.onproductTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade200, width: 2),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GestureDetector(
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
                  if (widget.seller?.id == vm.user?.id) {
                    final navBarVm = getIt.get<HomeViewModel>();
                    navBarVm.setIndex(4);
                  } else {
                    vm.clearOtherUser();
                    if (!context.mounted) return;
                    context.push('/othersProfile', extra: widget.seller?.id);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 12.h, bottom: 15.h),
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
                          if (widget.seller?.id == vm.user?.id) {
                            final navBarVm = getIt.get<HomeViewModel>();
                            navBarVm.setIndex(4);
                          } else {
                            vm.clearOtherUser();
                            if (context.mounted) {
                              context.push(
                                '/othersProfile',
                                extra: widget.seller?.id,
                              );
                            }
                          }
                        },
                        child: Row(
                          spacing: 8.w,
                          children: [
                            NetworkImageHelper(
                              imagePath: widget.seller?.profilePic ?? '',
                              height: 30.h,
                              width: 30.w,
                              isCircular: true,
                            ),
                            Text(
                              widget.seller?.username ?? '',
                              style: AppTextStyles.neueMontreal(
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 375.w / 400.h,
                  child: widget.imageUrl.isNotEmpty
                      ? PageView.builder(
                          itemCount: widget.imageUrl.length,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            if (index < widget.imageUrl.length) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 347.h,
                                child: NetworkImageHelper(
                                  imagePath: widget.imageUrl[index],
                                  fit: BoxFit.cover,
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        )
                      : const SizedBox.shrink(),
                ),
                Positioned(
                  bottom: 20.h,
                  right: 20.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(20),
                              blurRadius: 10.r,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                if (await SecureStorageService.isGuestUser()) {
                                  if (!context.mounted) return;
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => GuestRestrictionDialog(),
                                  );
                                  return;
                                }

                                widget.onFavoriteToggle();
                              },
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.black,
                                size: 24.sp,
                              ),
                            ),
                            if (likeCount > 0)
                              Text(
                                Formators.formatLikeCount(likeCount),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                style: AppTextStyles.neueMontreal(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                              ),
                          ],
                        ),
                      ),
                      8.verticalSpace,
                      ShareButton(id: widget.productId ?? '', type: 'product', ),
                    ],
                  ),
                ),
                if (widget.imageUrl.length > 1)
                  Positioned(
                    bottom: 15.h,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.imageUrl.length,
                        (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                          width: 8.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? Colors.white
                                : Colors.white.withAlpha((255 * 0.5).toInt()),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 15.h, bottom: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Formators.formatCurrency(widget.price),
                    style: AppTextStyles.neueMontreal(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  4.verticalSpace,
                  if (widget.size.isNotEmpty &&
                      !widget.size.toLowerCase().startsWith('null'))
                    Text(
                      'Size : ${widget.size}',
                      style: AppTextStyles.neueMontreal(
                        fontSize: 14.sp,
                        color: const Color(0xFF101010).withAlpha(150),
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
