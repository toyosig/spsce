import 'package:circ/core/constant/global.dart';
import 'package:circ/core/widgets/no_results_found.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/grid_view.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/review_list.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/custom_primary_app_bar.dart';
import 'package:circ/utils/custom_widgets/tab_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../widgets/profile_widgets/profile_header_section.dart';

class OthersProfileScreen extends StatefulWidget {
  final String userId;
  const OthersProfileScreen({super.key, required this.userId});

  @override
  State<OthersProfileScreen> createState() => _OthersProfileScreenState();
}

class _OthersProfileScreenState extends State<OthersProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  late ProfileViewModel profileViewModel;

  @override
  void initState() {
    super.initState();
    profileViewModel = getIt.get<ProfileViewModel>();
    tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await profileViewModel.otherProfileInit(context, userId: widget.userId);
    });
  }

  @override
  dispose() {
    super.dispose();
    tabController?.dispose();
    // profileViewModel.otherProfileInit(context, userId: widget.userId);
    profileViewModel.otherUser = null;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<ProfileViewModel>(
        builder: (context, viewModel, _) {
          final otherUser = viewModel.otherUser;
          return otherUser == null
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomPrimaryAppBar(
                        title: otherUser.username ?? '',
                        showTrailing: true,
                        isBackButtonVisible: true,
                        showSetting: true,
                        onTap: () {
                          context.go('/navbar', extra: 0);
                        },
                      ),
                      8.verticalSpace,
                      Column(
                        children: [
                          ProfileImageSection(user: otherUser),
                          10.verticalSpace,
                          ProfileInfoSection(user: otherUser),
                          ProfileStatsSection(
                            user: otherUser,
                            followers: otherUser.followers ?? [],
                            following: otherUser.following ?? [],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomAppButtons.primaryButton(
                                text: viewModel.followButtonText,
                                backgroundColor: AppColors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                textColor: AppColors.white,
                                borderRadius: 8,
                                width: 160.w,
                                height: 42.h,
                                onTap: () {
                                  if (viewModel.isLoading == false) {
                                    viewModel.followUser(
                                      id: otherUser.id ?? '',
                                      context: context,
                                    );
                                  } else {
                                    return;
                                  }
                                },
                              ),
                              10.horizontalSpace,
                              CustomAppButtons.primaryButton(
                                text: 'Message',
                                backgroundColor: AppColors.white,
                                textColor: AppColors.black,
                                boarderSideColor: AppColors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                borderRadius: 8,
                                width: 160.w,
                                height: 42.h,
                                onTap: () {
                                  context.push(
                                    '/chatInbox',
                                    extra: {
                                      "other_user_id": otherUser.id,
                                      "name": otherUser.username,
                                      "imagePath": otherUser.profilePic,
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 10.h,
                            ),
                            child: TabBar(
                              controller: tabController,
                              indicatorColor: AppColors.black,
                              indicatorSize: TabBarIndicatorSize.tab,
                              labelColor: AppColors.black,
                              labelPadding: const EdgeInsets.all(0),
                              tabs: [
                                Tab(child: TabTitle(title: 'Shop')),
                                Tab(child: TabTitle(title: 'Reviews')),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.7,
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            Consumer<ProfileViewModel>(
                              builder: (context, viewModel, _) {
                                return CustomGridView(
                                  hasMore: viewModel.hasMoreUsersProd,
                                  soldProducts: viewModel.soldProducts,
                                  products: viewModel.usersProducts,
                                  onLoadMore: () =>
                                      viewModel.getProductsByUserId(
                                        context,
                                        userId: viewModel.otherUser?.id,
                                        isLoadMore: true,
                                      ),
                                  onRefresh: () =>
                                      viewModel.getProductsByUserId(
                                        context,
                                        userId: viewModel.otherUser?.id,
                                        isRefresh: true,
                                      ),
                                );
                              },
                            ),
                            Consumer<ProfileViewModel>(
                              builder: (context, viewModel, _) {
                                return viewModel
                                            .profileReviews
                                            ?.reviews
                                            ?.isEmpty ==
                                        true
                                    ? Column(
                                        children: [
                                          80.verticalSpace,
                                          NoResultsFound(),
                                        ],
                                      )
                                    : ReviewsList(
                                        reviews:
                                            viewModel.profileReviews?.reviews ??
                                            [],
                                      );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
