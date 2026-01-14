// ignore_for_file: use_build_context_synchronously, deprecated_member_use
import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/explore/view_model/explore_view_model.dart';
import 'package:circ/presentation/feature/explore/widgets/main_category_list.dart';
import 'package:circ/presentation/feature/explore/widgets/pick_vibe_list.dart';
import 'package:circ/presentation/feature/explore/widgets/searched_product_grid.dart';
import 'package:circ/presentation/feature/explore/widgets/shop_by_brands.dart';
import 'package:circ/utils/custom_widgets/explore_primary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});
  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  bool _isInitialized = false;
  late ExploreViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt.get<ExploreViewModel>();
    if (!_isInitialized) {
      _isInitialized = true;
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await viewModel.loadExploreData(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExploreViewModel>(
      builder: (context, viewModel, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 24.h,
              children: [
                ExplorePrimaryAppBar(
                  onSearchSubmit: (query) {
                    viewModel.searchProducts(context, isRefresh: true);
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.r),
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                      child: viewModel.currentState == 2
                          ? Column(
                              key: ValueKey('searchResults'),
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: SearchedProductGrid(
                                    viewModel: viewModel,
                                  ),
                                ),
                              ],
                            )
                          : SingleChildScrollView(
                              key: ValueKey('defaultExplore'),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MainCategoryList(),
                                  10.verticalSpace,
                                  ShopByBrands(),
                                  30.verticalSpace,
                                  PickVibeList(),
                                ],
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
