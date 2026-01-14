import 'package:circ/core/widgets/no_results_found.dart';
import 'package:circ/presentation/feature/home_screen/view_model/home_view_model.dart';
import 'package:circ/presentation/feature/home_screen/widgets/product_card.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ForYouTab extends StatefulWidget {
  const ForYouTab({super.key, required this.viewModel});
  final HomeViewModel viewModel;

  @override
  State<ForYouTab> createState() => _ForYouTabState();
}

class _ForYouTabState extends State<ForYouTab>
    with AutomaticKeepAliveClientMixin {
  ScrollController get _scrollController =>
      widget.viewModel.forYouScrollController;

  @override
  bool get wantKeepAlive => true;
  @override
  initState() {
    super.initState();
    if (!_scrollController.hasClients) {
      _scrollController.addListener(_onScroll);
    }
  }

  void _onScroll() {
    if (_isBottom) {
      widget.viewModel.getForYouProducts(isLoadMore: true);
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
    super.build(context);
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, _) {
        return RefreshIndicator(
          color: AppColors.primaryColor,
          elevation: 5,
          backgroundColor: Colors.white,
          strokeWidth: 2,
          onRefresh: () => viewModel.getForYouProducts(isRefresh: true),
          child: Builder(
            builder: (context) {
              if (viewModel.isRefreshing || viewModel.forYouProdModel == null) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              }
              if (viewModel.isLoading && viewModel.forYouProducts.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              }
              if (viewModel.forYouProducts.isEmpty &&
                  viewModel.isLoading == false) {
                return Center(child: NoResultsFound());
              }
              return ListView.builder(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: viewModel.hasMoreForYou
                    ? viewModel.forYouProducts.length + 1
                    : viewModel.forYouProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index >= viewModel.forYouProducts.length) {
                    return _buildBottomLoader(viewModel);
                  }
                  final product = viewModel.forYouProducts[index];
                  return ProductCard(
                    productModel: product,
                    productName: product.title ?? '',
                    imageUrl: product.photos ?? [],
                    username: product.seller?.username ?? '',
                    price: product.price ?? 0,
                    size:
                        product.sizes?.entries
                            .expand(
                              (entry) => entry.value.map(
                                (v) => '${entry.key}-${v.value}',
                              ),
                            )
                            .join(', ') ??
                        '',
                    onFavoriteToggle: () =>
                        viewModel.toggleFavourite(context, id: product.id),
                    onproductTap: () {
                      context.push('/detail', extra: {'id': product.id});
                    },
                    seller: product.seller,
                    productId: product.id ?? '',
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildBottomLoader(HomeViewModel provider) {
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
