import 'package:circ/core/constant/global.dart';
import 'package:circ/domain/services/socket_services.dart';
import 'package:circ/domain/services/dojah_service.dart';

void registerServicesDi() {
  getIt.registerLazySingleton<SocketService>(() => SocketService());
  getIt.registerLazySingleton<DojahService>(() => DojahService());
}
