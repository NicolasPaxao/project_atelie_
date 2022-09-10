import 'package:atelie/core/domains.dart';

import '../../core/helpers/resourses.dart';
import 'package:atelie/view/view.dart';
import 'package:flutter/material.dart';

class AuthCheckPage extends StatefulWidget {
  AuthCheckPage({Key? key}) : super(key: key);

  @override
  State<AuthCheckPage> createState() => _AuthCheckPageState();
}

class _AuthCheckPageState extends State<AuthCheckPage> {
  @override
  Widget build(BuildContext context) {
    if (authRepository.isLoading)
      return loading();
    else if (authRepository.user == null)
      return LoginPage();
    else
      return HomePage();
  }

  loading() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: R.color.purplePrimary,
        ),
      ),
    );
  }
}
