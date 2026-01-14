import 'package:circ/core/constant/global.dart';
import 'package:circ/data/repo_impl/auth_repo_impl.dart';
import 'package:circ/data/repo_impl/chat_repo_impl.dart';
import 'package:circ/data/repo_impl/earning_repo_impl.dart';
import 'package:circ/data/repo_impl/explore_repo_impl.dart';
import 'package:circ/data/repo_impl/help_repo_impl.dart';
import 'package:circ/data/repo_impl/home_repo_impl.dart';
import 'package:circ/data/repo_impl/product_details_repo_impl.dart';
import 'package:circ/data/repo_impl/profile_repository_imp.dart';
import 'package:circ/data/repo_impl/sell_product_repo_impl.dart';
import 'package:circ/domain/repository/auth_repositry.dart';
import 'package:circ/domain/repository/chat_repository.dart';
import 'package:circ/domain/repository/earning_repositry.dart';
import 'package:circ/domain/repository/explore_repositry.dart';
import 'package:circ/domain/repository/help_repository.dart';
import 'package:circ/domain/repository/home_repository.dart';
import 'package:circ/domain/repository/product_details_repository.dart';
import 'package:circ/domain/repository/profile_repository.dart';
import 'package:circ/domain/repository/sell_product_repository.dart';

import '../../../data/repo_impl/place_order_repo_impl.dart';
import '../../../domain/repository/place_order_repository.dart';

void registerRepositoriesDi() {
  getIt
    ..registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl())
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl())
    ..registerLazySingleton<HomeRepository>(() => HomeRepoImpl())
    ..registerLazySingleton<ProductDetailsRepository>(
      () => ProductDetailsRepoImpl(),
    )
    ..registerLazySingleton<ChatRepository>(() => ChatRepoImpl())
    ..registerLazySingleton<BalanceRepository>(() => BalanceRepositoryImpl())
    ..registerLazySingleton<ExploreRepository>(() => ExploreRepositoryImpl())
    ..registerLazySingleton<SellProductRepository>(() => SellProductRepoImpl())
    ..registerLazySingleton<PlaceOrderRepository>(() => PlaceOrderRepoImpl())
    ..registerLazySingleton<HelpRepository>(() => HelpRepoImpl());
}
