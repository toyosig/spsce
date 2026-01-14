import 'package:circ/core/widgets/no_results_found.dart';
import 'package:circ/data/models/home/products_data.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/bottom_loader.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CustomGridView extends StatefulWidget {
  final List<ProductsData> products;
  final bool hasMore;
  final List<ProductsData> soldProducts;
  final VoidCallback onLoadMore;
  final Future<void> Function() onRefresh;

  const CustomGridView({
    super.key,
    required this.products,
    required this.onLoadMore,
    required this.onRefresh,
    this.soldProducts = const [],
    this.hasMore = false,
  });

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      widget.onLoadMore();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentPosition = _scrollController.position.pixels;
    return currentPosition >= (maxScroll - 100);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
      builder: (context, viewModel, _) {
        if (viewModel.isLoading && widget.products.isEmpty) {
          return Column(
            children: [
              80.verticalSpace,
              CircularProgressIndicator(color: AppColors.primaryColor),
            ],
          );
        }

        if (widget.products.isEmpty) {
          return Column(children: [80.verticalSpace, NoResultsFound()]);
        }

        return RefreshIndicator(
          color: AppColors.primaryColor,
          backgroundColor: Colors.white,
          strokeWidth: 2,
          elevation: 5,
          onRefresh: widget.onRefresh,
          child: CustomScrollView(
            controller: _scrollController,
            primary: false,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final product = widget.products[index];
                    final imageUrl = (product.photos?.isNotEmpty ?? false)
                        ? product.photos!.first
                        : '';
                    return ProductThumbnail(
                      isSold: false,
                      product: product,
                      imageUrl: imageUrl,
                    );
                  }, childCount: widget.products.length),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 1,
                    childAspectRatio: 112.w / 130.h,
                  ),
                ),
              ),
              if (viewModel.isLoadingMore)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: BottomLoader(isLoadingMore: true)),
                  ),
                ),

              if (widget.soldProducts.isNotEmpty && widget.hasMore == false)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                      bottom: 15.h,
                      left: 16.w,
                    ),
                    child: Text(
                      "Sold Items:",
                      style: AppTextStyles.neueMontreal(
                        color: AppColors.primaryBlack,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

              if (widget.soldProducts.isNotEmpty && widget.hasMore == false)
                SliverPadding(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                    bottom: 20.h,
                  ),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final product = widget.soldProducts[index];
                      final imageUrl = (product.photos?.isNotEmpty ?? false)
                          ? product.photos!.first
                          : '';
                      return ProductThumbnail(
                        isSold: true,
                        product: product,
                        imageUrl: imageUrl,
                      );
                    }, childCount: viewModel.soldProducts.length),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 1,
                      childAspectRatio: 112.w / 130.h,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class ProductThumbnail extends StatelessWidget {
  const ProductThumbnail({
    super.key,
    required this.product,
    required this.imageUrl,
    required this.isSold,
  });
  final bool isSold;
  final ProductsData product;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/detail', extra: {'id': product.id});
      },
      child: Stack(
        children: [
          NetworkImageHelper(imagePath: imageUrl, height: 130.h, width: 112.w),
          if (isSold)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryBlack.withValues(alpha: 0.6),
                ),
                child: Center(
                  child: Text(
                    'SOLD',
                    style: AppTextStyles.neueMontreal(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ),
          if (!isSold && (product.isDraft == true || product.quantity == 0))
            Positioned(
              top: 6,
              right: 6,
              child: Column(
                spacing: 5.h,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (product.isDraft == true)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Draft',
                        style: AppTextStyles.neueMontreal(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  if (product.quantity == 0)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        // 'Out of Stock',
                        'Marked As Sold',
                        style: AppTextStyles.neueMontreal(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
