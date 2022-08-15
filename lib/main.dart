import 'package:atelie/services/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_app.dart';
import 'viewmodel/viewmodel.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        Provider<LoginViewmodel>(create: ((context) => LoginViewmodel())),
        Provider<RegisterViewmodel>(create: ((context) => RegisterViewmodel())),
        ChangeNotifierProvider<AuthRepository>(
            create: ((context) => AuthRepository())),
        ChangeNotifierProvider<OrderRepository>(
            create: ((context) => OrderRepository())),
        ChangeNotifierProvider<DatasheetRepository>(
            create: ((context) => DatasheetRepository()))
      ],
      child: MyApp(),
    ),
  );
}
