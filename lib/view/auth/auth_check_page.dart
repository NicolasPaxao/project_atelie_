import 'package:atelie/helpers/resourses.dart';
import 'package:atelie/services/services.dart';
import 'package:atelie/view/view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthCheckPage extends StatefulWidget {
  AuthCheckPage({Key? key}) : super(key: key);

  @override
  State<AuthCheckPage> createState() => _AuthCheckPageState();
}

class _AuthCheckPageState extends State<AuthCheckPage> {
  @override
  Widget build(BuildContext context) {
    AuthRepository auth = Provider.of<AuthRepository>(context);

    if (auth.isLoading)
      return loading();
    else if (auth.user == null)
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
