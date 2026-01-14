import 'package:circ/core/constant/global.dart';
import 'package:circ/core/widgets/no_results_found.dart';
import 'package:circ/data/models/user_model/follow_user_model.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/constants/app_images.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FollowersFollowingScreen extends StatefulWidget {
  final int initialTab;
  final String userId;
  const FollowersFollowingScreen({
    super.key,
    this.initialTab = 0,
    required this.userId,
  });

  @override
  State<FollowersFollowingScreen> createState() =>
      _FollowersFollowingScreenState();
}

class _FollowersFollowingScreenState extends State<FollowersFollowingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _followersScrollController;
  late ScrollController _followingScrollController;
  ProfileViewModel? viewModel;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialTab,
    );
    _followersScrollController = ScrollController();
    _followingScrollController = ScrollController();
    viewModel = getIt.get<ProfileViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel?.getFollowersPaginated(
        context,
        isLoadMore: false,
        userId: widget.userId,
      );
      viewModel?.getFollowingPaginated(
        context,
        isLoadMore: false,
        userId: widget.userId,
      );
    });

    _followersScrollController.addListener(() {
      final viewModel = getIt.get<ProfileViewModel>();
      if (_followersScrollController.position.pixels >=
              _followersScrollController.position.maxScrollExtent &&
          !viewModel.isLoadingMoreFollowers) {
        viewModel.getFollowersPaginated(
          context,
          isLoadMore: true,
          userId: widget.userId,
        );
      }
    });

    _followingScrollController.addListener(() {
      final viewModel = getIt.get<ProfileViewModel>();
      if (_followingScrollController.position.pixels >=
              _followingScrollController.position.maxScrollExtent &&
          !viewModel.isLoadingMoreFollowing) {
        viewModel.getFollowingPaginated(
          context,
          isLoadMore: true,
          userId: widget.userId,
        );
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    viewModel?.paginatedFollowers == null;
    viewModel?.paginatedFollowing == null;
    _followersScrollController.dispose();
    _followingScrollController.dispose();
    super.dispose();
  }

  Future<void> _refreshList(int tabIndex) async {
    final viewModel = getIt.get<ProfileViewModel>();
    if (tabIndex == 0) {
      await Future.wait([
        viewModel.getFollowersPaginated(
          context,
          isLoadMore: false,
          userId: widget.userId,
        ),
        Future.delayed(const Duration(milliseconds: 600)),
      ]);
    } else {
      await Future.wait([
        viewModel.getFollowingPaginated(
          context,
          isLoadMore: false,
          userId: widget.userId,
        ),
        Future.delayed(const Duration(milliseconds: 600)),
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
      builder: (context, viewModel, _) {
        final followers = viewModel.paginatedFollowers ?? [];
        final following = viewModel.paginatedFollowing ?? [];
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            title: Text(
              'Followers & Following',
              style: AppTextStyles.neueMontreal(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 18.sp,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: TabBar(
              controller: _tabController,
              labelColor: AppColors.primaryColor,
              unselectedLabelColor: AppColors.greyText,
              indicatorColor: AppColors.primaryColor,
              tabs: [
                Tab(
                  text:
                      'Followers (${Formators.formatLikeCount(followers.length)})',
                ),
                Tab(
                  text:
                      'Following (${Formators.formatLikeCount(following.length)})',
                ),
              ],
            ),
          ),
          body: viewModel.user == null
              ? Center(child: CircularProgressIndicator())
              : TabBarView(
                  controller: _tabController,
                  children: [
                    FollowersListSection(
                      followers: followers,
                      isLoadingMore: viewModel.isLoadingMoreFollowers,
                      onRefresh: () => _refreshList(0),
                      scrollController: _followersScrollController,
                    ),
                    FollowingListSection(
                      following: following,
                      isLoadingMore: viewModel.isLoadingMoreFollowing,
                      onRefresh: () => _refreshList(1),
                      scrollController: _followingScrollController,
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class FollowersListSection extends StatefulWidget {
  final List<FollowingUserModel> followers;
  final bool isLoadingMore;
  final Future<void> Function() onRefresh;
  final ScrollController scrollController;

  const FollowersListSection({
    super.key,
    required this.followers,
    required this.isLoadingMore,
    required this.onRefresh,
    required this.scrollController,
  });

  @override
  State<FollowersListSection> createState() => _FollowersListSectionState();
}

class _FollowersListSectionState extends State<FollowersListSection> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
      builder: (context, vm, _) {
        if (vm.paginatedFollowers != null && vm.paginatedFollowers!.isEmpty) {
          return Column(
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
          );
        }
        if (vm.paginatedFollowers == null && vm.isLoading == true) {
          return Expanded(
            child: Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: widget.onRefresh,
          child: ListView.separated(
            controller: widget.scrollController,
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
            itemCount: widget.followers.length + (widget.isLoadingMore ? 1 : 0),
            separatorBuilder: (_, __) => SizedBox(height: 12.h),
            itemBuilder: (context, i) {
              if (i >= widget.followers.length) {
                return const BottomLoader();
              }
              final user = widget.followers[i];
              return UserListTile(
                user: user,
                onUnfollow: () {
                  final viewModel = context.read<ProfileViewModel>();
                  viewModel.toggleFollowLocally(user);
                  viewModel.followUser(id: user.id, context: context);
                },
              );
            },
          ),
        );
      },
    );
  }
}

class FollowingListSection extends StatefulWidget {
  final List<FollowingUserModel> following;
  final bool isLoadingMore;
  final Future<void> Function() onRefresh;
  final ScrollController scrollController;

  const FollowingListSection({
    super.key,
    required this.following,
    required this.isLoadingMore,
    required this.onRefresh,
    required this.scrollController,
  });

  @override
  State<FollowingListSection> createState() => _FollowingListSectionState();
}

class _FollowingListSectionState extends State<FollowingListSection> {
  @override
  Widget build(BuildContext context) {
    if (widget.following.isEmpty) {
      return Center(child: NoResultsFound());
    }
    return Consumer<ProfileViewModel>(
      builder: (context, vm, _) {
        if (vm.paginatedFollowing != null && vm.paginatedFollowing!.isEmpty) {
          return Column(
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
          );
        }
        if (vm.paginatedFollowing == null && vm.isLoading == true) {
          return Expanded(
            child: Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
          );
        }
        return RefreshIndicator(
          color: AppColors.primaryColor,
          backgroundColor: Colors.white,
          strokeWidth: 2,
          elevation: 5,
          onRefresh: widget.onRefresh,
          child: ListView.separated(
            controller: widget.scrollController,
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
            itemCount: widget.following.length + (widget.isLoadingMore ? 1 : 0),
            separatorBuilder: (_, __) => SizedBox(height: 12.h),
            itemBuilder: (context, i) {
              if (i >= widget.following.length) {
                return const BottomLoader();
              }
              final user = widget.following[i];
              return UserListTile(
                user: user,
                onUnfollow: () {
                  final viewModel = context.read<ProfileViewModel>();
                  viewModel.toggleFollowLocally(user);
                  viewModel.followUser(id: user.id, context: context);
                },
              );
            },
          ),
        );
      },
    );
  }
}

class UserListTile extends StatelessWidget {
  final FollowingUserModel user;
  final VoidCallback? onUnfollow;
  const UserListTile({super.key, required this.user, this.onUnfollow});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.backgrey,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (user.id.isNotEmpty) {
                context.push('/othersProfile', extra: user.id);
              }
            },
            child: NetworkImageHelper(
              imagePath: user.profilePic ?? '',
              isCircular: true,
              fit: BoxFit.cover,
              height: 48.h,
              width: 48.w,
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (user.id.isNotEmpty) {
                  context.push('/othersProfile', extra: user.id);
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.username,
                    style: AppTextStyles.neueMontreal(
                      fontSize: 16.sp,
                      height: 1.3,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    "${Formators.formatLikeCount(user.followersCount ?? 0)} Followers",
                    style: AppTextStyles.neueMontreal(
                      fontSize: 14.sp,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryBlack.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
          12.horizontalSpace,
          _FollowButton(user: user, onUnfollow: onUnfollow),
        ],
      ),
    );
  }
}

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Center(
        child: CircularProgressIndicator(color: AppColors.primaryColor),
      ),
    );
  }
}

class _FollowButton extends StatelessWidget {
  final FollowingUserModel user;
  final VoidCallback? onUnfollow;
  const _FollowButton({required this.user, this.onUnfollow});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProfileViewModel>();
    final isFollowing =
        viewModel.user?.following?.any((u) => u.id == user.id) ?? false;
    final isCurrentUser = viewModel.user?.id == user.id;
    if (isCurrentUser) return SizedBox.shrink();
    return CustomAppButtons.primaryButton(
      text: isFollowing ? 'Unfollow' : 'Follow',
      textColor: isFollowing ? AppColors.black : AppColors.white,
      // width: 77.w,
      borderRadius: 10.r,
      backgroundColor: isFollowing ? AppColors.white : AppColors.primaryBlack,
      boarderSideColor: AppColors.primaryBlack,
      fontSize: 14.sp,
      onTap: onUnfollow ?? () {},
    );
  }
}
