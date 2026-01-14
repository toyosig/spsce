import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/explore/view_model/explore_view_model.dart';
import 'package:circ/presentation/feature/home_screen/view_model/home_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/presentation/feature/home_screen/widgets/home_app_bar.dart';
import 'package:circ/presentation/feature/home_screen/widgets/home_tab_views.dart';
import 'package:circ/presentation/feature/home_screen/widgets/home_tabs.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:circ/utils/custom_widgets/guest_restriction_dialog.dart';
import 'package:circ/domain/services/secure_storage_services.dart';

class HomeScreen extends StatefulWidget {
  final ScrollController? scrollController;
  const HomeScreen({super.key, this.scrollController});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late TabController _tabController;
  late HomeViewModel vm;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() async {
      if (_tabController.indexIsChanging) return;
      if (_tabController.index == 1 &&
          await SecureStorageService.isGuestUser()) {
        _tabController.index = 0;
        setState(() {});
        if (mounted) {
          showDialog(
            context: context,
            builder: (ctx) => GuestRestrictionDialog(),
          );
        }
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewModel>().init(context);
      // Initialize ProfileViewModel to get notifications
      final profileViewModel = getIt.get<ProfileViewModel>();
      profileViewModel.getAllNotifications(isRefresh: true);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _tabController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // Refresh notifications when app becomes active
      final profileViewModel = getIt.get<ProfileViewModel>();
      profileViewModel.getAllNotifications(isRefresh: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final HomeViewModel vm = context.watch<HomeViewModel>();
    final ExploreViewModel exploreVm = getIt.get<ExploreViewModel>();
    final ProfileViewModel profileViewModel = getIt.get<ProfileViewModel>();

    return ChangeNotifierProvider.value(
      value: profileViewModel,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Column(
            children: [
              HomeAppBar(vm: vm, exploreVm: exploreVm),
              Consumer<HomeViewModel>(
                builder: (context, vm, child) {
                  return Expanded(
                    child: Column(
                      key: const ValueKey('tabs'),
                      children: [
                        HomeTabs(tabController: _tabController),
                        HomeTabViews(tabController: _tabController),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
