import 'package:get_it/get_it.dart';

import '../../viewmodel/viewmodel.dart';
import '../services/services.dart';

abstract class DependencyInjection {
  static void initialize() {
    GetIt.instance.registerSingleton<AuthRepository>(AuthRepository());
    GetIt.instance
        .registerSingleton<DatasheetRepository>(DatasheetRepository());
    GetIt.instance.registerSingleton<OrderRepository>(OrderRepository());
    GetIt.instance.registerSingleton<LoginViewmodel>(LoginViewmodel());
    GetIt.instance.registerSingleton<RegisterViewmodel>(RegisterViewmodel());
    GetIt.instance.registerSingleton<DatasheetViewModel>(DatasheetViewModel());
  }
}
