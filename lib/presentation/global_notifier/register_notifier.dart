import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/cart_screen/view_model/cart_view_model.dart';
import 'package:circ/presentation/feature/chat/view_model/chat_view_model.dart';
import 'package:circ/presentation/feature/checkout/view_model/check_out_vm.dart';
import 'package:circ/presentation/feature/cric_balance/cric_balance_vm.dart/circ_balance_view_model.dart';
import 'package:circ/presentation/feature/explore/view_model/explore_view_model.dart';
import 'package:circ/presentation/feature/home_screen/view_model/home_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/customer_support_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/presentation/feature/sell_screen/view_model/sell_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../feature/auth/view_model/auth_view_model.dart';
import '../feature/detail_screen/view_model/details_view_model.dart';

List<SingleChildWidget> registerGlobalNotifiers() {
  return [
    ChangeNotifierProvider(create: (_) => getIt.get<AuthViewModel>()),
    ChangeNotifierProvider(create: (_) => getIt.get<HomeViewModel>()),
    ChangeNotifierProvider(create: (_) => getIt.get<SellViewModel>()),
    ChangeNotifierProvider(create: (_) => getIt.get<CartViewModel>()),
    ChangeNotifierProvider(create: (_) => getIt.get<ChatViewModel>()),
    ChangeNotifierProvider(create: (_) => getIt.get<ProfileViewModel>()),
    ChangeNotifierProvider(create: (_) => getIt.get<CheckOutViewModel>()),
    ChangeNotifierProvider(create: (_) => getIt.get<CirBalanceViewModel>()),
    ChangeNotifierProvider(create: (_) => getIt.get<ExploreViewModel>()),
    ChangeNotifierProvider(
      create: (_) => getIt.get<CustomerSupportViewModel>(),
    ),
    ChangeNotifierProvider(create: (_) => getIt.get<DetailsViewModel>()),
  ];
}
