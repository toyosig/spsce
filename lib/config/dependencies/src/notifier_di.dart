import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/auth/view_model/auth_view_model.dart';
import 'package:circ/presentation/feature/cart_screen/view_model/cart_view_model.dart';
import 'package:circ/presentation/feature/chat/view_model/chat_view_model.dart';
import 'package:circ/presentation/feature/checkout/view_model/check_out_vm.dart';
import 'package:circ/presentation/feature/cric_balance/cric_balance_vm.dart/circ_balance_view_model.dart';
import 'package:circ/presentation/feature/detail_screen/view_model/details_view_model.dart';
import 'package:circ/presentation/feature/explore/view_model/explore_view_model.dart';
import 'package:circ/presentation/feature/home_screen/view_model/home_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/customer_support_view_model.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/presentation/feature/sell_screen/view_model/sell_view_model.dart';

void registerNotifiersDi() {
  // getIt.registerLazySingleton<AuthViewModel>(() => AuthViewModel());

  // Then register other view models
  getIt
    ..registerLazySingleton<AuthViewModel>(() => AuthViewModel())
    ..registerLazySingleton<HomeViewModel>(() => HomeViewModel())
    ..registerLazySingleton<SellViewModel>(() => SellViewModel())
    ..registerLazySingleton<CartViewModel>(() => CartViewModel())
    ..registerLazySingleton<ProfileViewModel>(() => ProfileViewModel())
    ..registerLazySingleton<ChatViewModel>(() => ChatViewModel())
    ..registerLazySingleton<CirBalanceViewModel>(() => CirBalanceViewModel())
    ..registerLazySingleton<ExploreViewModel>(() => ExploreViewModel())
    ..registerLazySingleton<CheckOutViewModel>(() => CheckOutViewModel())
    ..registerLazySingleton<CustomerSupportViewModel>(
      () => CustomerSupportViewModel(),
    )
    ..registerLazySingleton<DetailsViewModel>(() => DetailsViewModel());
}
