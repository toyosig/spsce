import 'package:circ/config/dependencies/src/ds_di.dart';
import 'package:circ/config/dependencies/src/notifier_di.dart';
import 'package:circ/config/dependencies/src/repo_di.dart';
import 'package:circ/config/dependencies/src/services_di.dart';

void registerGetItDependencies() {
  // First register data sources
  registerDataSourcesDi();

  // Then register repositories that depend on data sources
  registerRepositoriesDi();

  // Then register services
  registerServicesDi();

  // Finally register view models that depend on repositories and services
  registerNotifiersDi();
}
