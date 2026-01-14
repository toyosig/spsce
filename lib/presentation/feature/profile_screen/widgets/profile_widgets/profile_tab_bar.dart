import 'package:circ/core/widgets/no_results_found.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/grid_view.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/purchase_list.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/sold_tab/sold_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/custom_widgets/tab_title.dart';
import '../../view_model/profile_view_model.dart';

class ProfileTabBar extends StatelessWidget {
  final TabController tabController;

  const ProfileTabBar({required this.tabController, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TabBar(
        controller: tabController,
        indicatorColor: AppColors.black,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: AppColors.black,
        labelPadding: const EdgeInsets.all(0),
        tabs: [
          Tab(child: TabTitle(title: 'My Shop')),
          Tab(child: TabTitle(title: 'Likes')),
          Tab(child: TabTitle(title: 'Purchases')),
          Tab(child: TabTitle(title: 'Sold')),
        ],
      ),
    );
  }
}

class TabBarViews extends StatelessWidget {
  const TabBarViews({
    super.key,
    required this.tabController,
    required this.viewModel,
  });
  final TabController tabController;
  final ProfileViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        CustomGridView(
          soldProducts: viewModel.mySoldProducts,
          hasMore: viewModel.hasMoreMyProd,
          products: viewModel.myProducts,
          onLoadMore: () => viewModel.getMyProducts(context, isLoadMore: true),
          onRefresh: () => viewModel.getMyProducts(context, isRefresh: true),
        ),
        CustomGridView(
          products: viewModel.myFavProducts,
          onLoadMore: () =>
              viewModel.getMyFavProducts(context, isLoadMore: true),
          onRefresh: () => viewModel.getMyFavProducts(context, isRefresh: true),
        ),
        viewModel.myPurchases.isEmpty
            ? Column(children: [80.verticalSpace, NoResultsFound()])
            : PurchasesList(orders: viewModel.myPurchases),
        viewModel.soldList.isEmpty
            ? Column(children: [80.verticalSpace, NoResultsFound()])
            : SoldList(orders: viewModel.soldList),
      ],
    );
  }
}
