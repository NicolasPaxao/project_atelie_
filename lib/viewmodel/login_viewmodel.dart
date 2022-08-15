import 'package:atelie/services/services.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../exceptions/exceptions.dart';
part 'login_viewmodel.g.dart';

class LoginViewmodel = _LoginViewmodelBase with _$LoginViewmodel;

abstract class _LoginViewmodelBase with Store {
  clear() {
    _email = null;
    _password = null;
    _loading = false;
  }

  @observable
  String? _email;
  @action
  void setEmail(String? value) => _email = value!.trim();
  @computed
  String? get email => _email;
  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  String? _password;
  @action
  void setPassword(String? value) => _password = value!.trim();
  @computed
  String? get password => _password;
  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  bool? _loading;
  @action
  void setLoading(bool? value) => _loading = value;
  @computed
  bool? get loading => _loading;

  @action
  Future<void> signIn(BuildContext context, {bool isLoading = true}) async {
    setLoading(isLoading);
    try {
      await context.read<AuthRepository>().signIn(email!, password!);

      setLoading(!isLoading);
    } on AuthException catch (e) {
      setLoading(!isLoading);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
