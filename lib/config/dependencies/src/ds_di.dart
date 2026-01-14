import 'package:circ/core/constant/global.dart';
import 'package:circ/data/data_sources/remote/auth_rds.dart';
import 'package:circ/data/data_sources/remote/chat_rds.dart';
import 'package:circ/data/data_sources/remote/earning_rds.dart';
import 'package:circ/data/data_sources/remote/help_rds.dart';
import 'package:circ/data/data_sources/remote/place_order_rds.dart';
import 'package:circ/data/data_sources/remote/product_details_rds.dart';
import 'package:circ/data/data_sources/remote/home_rds.dart';
import 'package:circ/data/data_sources/remote/profile_rds.dart';
import 'package:circ/data/data_sources/remote/sell_product_rds.dart';

void registerDataSourcesDi() {
  getIt
    ..registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource())
    ..registerLazySingleton<PlaceOrderRemoteDataSource>(
      () => PlaceOrderRemoteDataSource(),
    )
    ..registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSource())
    ..registerLazySingleton<ProductDetailsRds>(() => ProductDetailsRds())
    ..registerLazySingleton<ChatRDS>(() => ChatRDS())
    ..registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSource(),
    )
    ..registerLazySingleton<SellProductRemoteDataSource>(
      () => SellProductRemoteDataSource(),
    )
    ..registerLazySingleton<BalanceRemoteDataSource>(
      () => BalanceRemoteDataSource(),
    )
    ..registerLazySingleton<HelpRemoteDataSource>(() => HelpRemoteDataSource());
  // ..registerLazySingleton<PlaceOrderRemoteDataSource>(
  //     () => PlaceOrderRemoteDataSource());
}
