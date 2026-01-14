import 'package:circ/core/constant/global.dart';
import 'package:circ/domain/services/secure_storage_services.dart';
import 'package:circ/presentation/feature/cart_screen/view_model/cart_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/widgets/profile_widgets/profile_header_section.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/profile_widgets/profile_tab_bar.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ProfileViewModel profileViewModel;

  @override
  void initState() {
    super.initState();
    profileViewModel = getIt.get<ProfileViewModel>();
    tabController = TabController(length: 4, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (await SecureStorageService.isGuestUser()) {
        return;
      }
      if (mounted) {
        profileViewModel.init(context);
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartCount = context.watch<CartViewModel>().cartNumbers;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Consumer<ProfileViewModel>(
          builder: (context, viewModel, _) {
            final user = viewModel.user;

            if (user == null) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              );
            }

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: ProfileHeaderSection(
                    user: user,
                    cartCount: cartCount,
                    followers: user.followers ?? [],
                    following: user.following ?? [],
                  ),
                ),
                SliverStickyHeader(
                  header: Container(
                    color: AppColors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: ProfileTabBar(tabController: tabController),
                    ),
                  ),
                  sliver: SliverFillRemaining(
                    hasScrollBody: true,
                    child: TabBarViews(
                      viewModel: viewModel,
                      tabController: tabController,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
