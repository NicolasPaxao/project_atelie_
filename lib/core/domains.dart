import 'package:get_it/get_it.dart';

import '../viewmodel/viewmodel.dart';
import 'services/services.dart';

final LoginViewmodel loginViewModel = GetIt.I<LoginViewmodel>();
final RegisterViewmodel registerViewModel = GetIt.I<RegisterViewmodel>();
final AuthRepository authRepository = GetIt.I<AuthRepository>();
final DatasheetRepository datasheetRepository = GetIt.I<DatasheetRepository>();
final OrderRepository orderRepository = GetIt.I<OrderRepository>();
