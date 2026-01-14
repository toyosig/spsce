import 'package:circ/config/dependencies/di.dart';

class AppConfig {
  static final AppConfig _singleton = AppConfig._internal();

  factory AppConfig() {
    return _singleton;
  }

  AppConfig._internal();

  String? _configStatus;

  void setup() {
    try {
      registerGetItDependencies();
      _configStatus = 'Configured';
    } catch (e) {
      _configStatus = 'Not Configured: $e';
    }
  }

  Future<void> initialize() async {
    try {
      _configStatus = 'Initialized';
    } catch (e) {
      _configStatus = 'Not Initialized';
    }
  }

  @override
  String toString() => 'AppConfig:\n -Config Status: $_configStatus';
}
