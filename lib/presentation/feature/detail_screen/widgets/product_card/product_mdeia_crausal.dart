import 'package:circ/core/constant/global.dart';
import 'package:circ/core/widgets/share_button.dart';
import 'package:circ/data/models/home/products_data.dart';
import 'package:circ/domain/services/secure_storage_services.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/custom_widgets/guest_restriction_dialog.dart';
import '../../view_model/details_view_model.dart';

class ProductMediaCarousel extends StatefulWidget {
  const ProductMediaCarousel({
    super.key,

    required this.onFavoriteToggle,
    required this.product,
  });

  final Function() onFavoriteToggle;
  final ProductsData product;

  @override
  State<ProductMediaCarousel> createState() => _ProductMediaCarouselState();
}

class _ProductMediaCarouselState extends State<ProductMediaCarousel> {
  int _currentPage = 0;
  late bool _isFavorite;
  late int _likeCount;
  // late VideoPlayerController _videoController;
  // final bool _videoInitialized = false;

  @override
  void initState() {
    super.initState();
    // Commented out video initialization logic for now
    /*
    final videoUrl =
        // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
        "https://circmarketplace.com:3000/stream/products/videos/4599fef6-1189-4e49-95c6-c31f7b8b9af0.mp4";
    _videoController = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
      ..initialize().then((_) {
        setState(() {
          _videoInitialized = true;
        });
      });
    */
    final profileVm = getIt.get<ProfileViewModel>();
    final currentUserId = profileVm.user?.id;
    final likes = widget.product.likes ?? [];

    _isFavorite = likes.any((like) => like.user?.id == currentUserId);
    _likeCount = widget.product.likeCount ?? 0;
  }

  @override
  void dispose() {
    // _videoController.dispose(); // Commented out video controller dispose for now
    super.dispose();
  }

  // int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    // Build media list: only images for now (ignore video)
    final List<String?> media = [];
    if (widget.product.photos != null && widget.product.photos!.isNotEmpty) {
      media.addAll(widget.product.photos!);
    }
    // final hasVideo =
    //     widget.product.video != null && widget.product.video!.isNotEmpty;
    // if (hasVideo) {
    //   media.add('VIDEO'); // Placeholder for video
    // }
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 375.w / 400.h,
          child: media.isNotEmpty
              ? PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: media.length,
                  itemBuilder: (context, index) {
                    if (index < media.length && media[index] != null) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 347.h,
                        child: InkWell(
                          onTap: () {
                            context.push('/viewImageList', extra: {
                              'images': media,
                              'index': index,
                            });
                          },
                          child: NetworkImageHelper(
                            imagePath: media[index] ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                )
              : const SizedBox.shrink(),
        ),
        media.length > 1
            ? Positioned(
                bottom: 15.h,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    media.length,
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
              )
            : const SizedBox.shrink(),
        Positioned(
          bottom: 20.h,
          right: 20.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<DetailsViewModel>(
                builder: (context, detailsVm, _) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(20),
                          blurRadius: 10.r,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 4.h,
                      children: [
                        InkWell(
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
                            setState(() {
                              _isFavorite = !_isFavorite;
                              _likeCount += _isFavorite ? 1 : -1;
                            });

                            widget.onFavoriteToggle();
                          },
                          child: Icon(
                            _isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: _isFavorite ? Colors.red : Colors.black,
                            size: 24.sp,
                          ),
                        ),
                        if (_likeCount > 0)
                          Text(
                            Formators.formatLikeCount(_likeCount),
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
                  );
                },
              ),
              8.verticalSpace,
              ShareButton(id: widget.product.id ?? '', type: 'product'),
            ],
          ),
        ),
      ],
    );
  }
}
