import 'package:circ/presentation/feature/explore/view_model/explore_view_model.dart';
import 'package:circ/presentation/feature/explore/widgets/filter_row.dart';
import 'package:circ/presentation/feature/explore/widgets/search_product_card.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/app_images.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SearchedProductGrid extends StatefulWidget {
  final ExploreViewModel viewModel;
  const SearchedProductGrid({super.key, required this.viewModel});

  @override
  State<SearchedProductGrid> createState() => _SearchedProductGridState();
}

class _SearchedProductGridState extends State<SearchedProductGrid> {
  late ScrollController _scrollController;

  @override
  initState() {
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
      if (widget.viewModel.exploreBrandId != null) {
        widget.viewModel.getProductsByBrand(context, isLoadMore: true);
      } else if (widget.viewModel.exploreCatId != null) {
        widget.viewModel.getProductsByCategory(context, isLoadMore: true);
      } else {
        widget.viewModel.searchProducts(context, isLoadMore: true);
      }
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentPosition = _scrollController.position.pixels;
    return currentPosition >= maxScroll;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primaryColor,
      backgroundColor: Colors.white,
      strokeWidth: 2,
      elevation: 5,
      onRefresh: () async {
        if (widget.viewModel.exploreBrandId != null) {
          await widget.viewModel.getProductsByBrand(context, isRefresh: true);
        } else if (widget.viewModel.exploreCatId != null) {
          await widget.viewModel.getProductsByCategory(
            context,
            isRefresh: true,
          );
        } else {
          await widget.viewModel.searchProducts(context, isRefresh: true);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          FilterRow(viewModel: widget.viewModel),
          Text(
            '${widget.viewModel.filteredResults.length} results',
            style: AppTextStyles.neueMontreal(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          Expanded(
            child: Builder(
              builder: (context) {
                if (widget.viewModel.isLoading &&
                    widget.viewModel.filteredResults.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  );
                }
                if (widget.viewModel.filteredResults.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppImages.searchPlaceHolder,
                          height: 73.h,
                          width: 73.w,
                        ),
                        30.verticalSpace,
                        Text(
                          "No results found",
                          style: AppTextStyles.neueMontreal(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return GridView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: 163.5.w / 228.h,
                  ),
                  controller: _scrollController,
                  itemCount:
                      widget.viewModel.filteredResults.length +
                      (widget.viewModel.isLoadingMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index >= widget.viewModel.filteredResults.length) {
                      return _buildBottomLoader(widget.viewModel);
                    }
                    final product = widget.viewModel.filteredResults[index];
                    final imageUrl = (product.photos?.isNotEmpty ?? false)
                        ? product.photos!.first
                        : '';
                    return GestureDetector(
                      onTap: () {
                        context.push('/detail', extra: {'id': product.id});
                      },
                      child: SearchProductCard(
                        imageUrl: imageUrl,

                        size:
                            product.sizes?.entries
                                .expand(
                                  (entry) => entry.value.map(
                                    (v) => '${entry.key}-${v.value}',
                                  ),
                                )
                                .join(', ') ??
                            '',
                        price: Formators.formatCurrency(product.price ?? 0.0),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomLoader(ExploreViewModel provider) {
    if (provider.isLoadingMore) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: const Center(
          child: CircularProgressIndicator(color: AppColors.primaryColor),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
