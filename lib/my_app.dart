import 'package:atelie/view/datasheets/datashees.dart';
import 'package:atelie/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ateliê',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: AuthCheckPage(),
      routes: {
        '/datasheets': (context) => DatasheetPage(),
      },
      builder: EasyLoading.init(),
    );
  }
}
