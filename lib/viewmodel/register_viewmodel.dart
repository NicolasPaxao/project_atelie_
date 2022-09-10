import 'package:atelie/core/domains.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import '../../core/services/services.dart';
import '../core/exceptions/exceptions.dart';
part 'register_viewmodel.g.dart';

class RegisterViewmodel = _RegisterViewmodelBase with _$RegisterViewmodel;

abstract class _RegisterViewmodelBase with Store {
  clear() {
    _email = null;
    _password = null;
    _name = null;
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
  String? _name;
  @action
  void setName(String? value) => _name = value!.trim();
  @computed
  String? get name => _name;
  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  bool? _loading;
  @action
  void setLoading(bool? value) => _loading = value;
  @computed
  bool? get loading => _loading;

  @action
  Future<void> signUp(BuildContext context, {bool isLoading = true}) async {
    try {
      setLoading(isLoading);
      await authRepository.signUp(name!, email!, password!);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Conta criada com sucesso, artesão $name!'),
          backgroundColor: Colors.green,
        ),
      );
      Future.delayed(Duration(milliseconds: 500));
      Navigator.pop(context);
      clear();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        nameController.clear();
        passwordController.clear();
        emailController.clear();
      });
    } on AuthException catch (e) {
      setLoading(!isLoading);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
