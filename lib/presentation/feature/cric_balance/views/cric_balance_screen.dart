import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/cric_balance/cric_balance_vm.dart/circ_balance_view_model.dart';
import 'package:circ/presentation/feature/cric_balance/widgets/earning_summary.dart';
import 'package:circ/presentation/feature/cric_balance/widgets/transaction_card.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/presentation/routes/routes.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/custom_primary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../widgets/blured_card.dart';

class CricBalanceScreen extends StatefulWidget {
  const CricBalanceScreen({super.key});

  @override
  State<CricBalanceScreen> createState() => _CricBalanceScreenState();
}

class _CricBalanceScreenState extends State<CricBalanceScreen>
    with TickerProviderStateMixin {
  late CirBalanceViewModel circBalanceVm;
  late ProfileViewModel profileVm;
  @override
  void initState() {
    super.initState();
    profileVm = getIt.get<ProfileViewModel>();
    circBalanceVm = getIt.get<CirBalanceViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await circBalanceVm.init(context);
    });
  }

  @override
  void dispose() {
    circBalanceVm.balanceData == null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSeller = profileVm.user?.seller != null;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomPrimaryAppBar(
            title: 'Circ Balance',
            isBackButtonVisible: true,
            showTrailing: false,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.sp),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16.sp,
                  children: [
                    if (!isSeller)
                      ClipRect(
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [const EarningsSummary()],
                            ),
                            const BlurredSellerWarningCard(),
                          ],
                        ),
                      )
                    else ...[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: const EarningsSummary(),
                      ),
                    ],
                    TransactionTable(),
                    if (isSeller)
                      CustomAppButtons.primaryButton(
                        height: 50.h,
                        width: double.infinity,
                        text: 'Withdraw Available Balance',
                        onTap: () {
                          context.pushNamed(Routes.withdrawalform.name);
                        },
                      ),
                    20.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
