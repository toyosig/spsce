// ignore_for_file: invalid_use_of_protected_member

import 'package:circ/core/widgets/no_results_found.dart';
import 'package:circ/presentation/feature/home_screen/view_model/home_view_model.dart';
import 'package:circ/presentation/feature/home_screen/widgets/product_card.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FollowingTab extends StatefulWidget {
  const FollowingTab({super.key, required this.viewModel});
  final HomeViewModel viewModel;

  @override
  State<FollowingTab> createState() => _FollowingTabState();
}

class _FollowingTabState extends State<FollowingTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  ScrollController get _scrollController =>
      widget.viewModel.followingScrollController;

  @override
  initState() {
    super.initState();

    if (!_scrollController.hasClients) {
      _scrollController.addListener(_onScroll);
    }
  }

  @override
  void dispose() {
    if (_scrollController.hasListeners) {
      _scrollController.removeListener(_onScroll);
    }
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      widget.viewModel.getFollowingProducts(isLoadMore: true);
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
          backgroundColor: Colors.white,
          strokeWidth: 2,
          elevation: 5,
          onRefresh: () => viewModel.getFollowingProducts(isRefresh: true),
          child: Builder(
            builder: (context) {
              if (viewModel.isRefreshing ||
                  viewModel.followingProdModel == null) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              }
              if (viewModel.isLoading && viewModel.followingProducts.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              }
              if (viewModel.followingProducts.isEmpty &&
                  viewModel.isLoading == false) {
                return Center(child: NoResultsFound());
              }
              return ListView.builder(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: viewModel.hasMoreFollowing
                    ? viewModel.followingProducts.length + 1
                    : viewModel.followingProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index >= viewModel.followingProducts.length) {
                    return _buildBottomLoader(viewModel);
                  }
                  final product = viewModel.followingProducts[index];
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
