import 'package:circ/presentation/feature/home_screen/view_model/home_view_model.dart';
import 'package:circ/presentation/feature/home_screen/widgets/following_tab.dart';
import 'package:circ/presentation/feature/home_screen/widgets/for_you_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:circ/domain/services/secure_storage_services.dart';

class HomeTabViews extends StatefulWidget {
  final TabController? tabController;
  const HomeTabViews({super.key, required this.tabController});

  @override
  State<HomeTabViews> createState() => _HomeTabViewsState();
}

class _HomeTabViewsState extends State<HomeTabViews> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        return FutureBuilder<bool>(
          future: SecureStorageService.isGuestUser(),
          builder: (context, snapshot) {
            final isGuest = snapshot.data ?? false;
            if (isGuest) {
              return Expanded(child: ForYouTab(viewModel: viewModel));
            }
            return Expanded(
              child: TabBarView(
                controller: widget.tabController,
                physics: const BouncingScrollPhysics(),
                children: [
                  ForYouTab(viewModel: viewModel),
                  FollowingTab(viewModel: viewModel),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
