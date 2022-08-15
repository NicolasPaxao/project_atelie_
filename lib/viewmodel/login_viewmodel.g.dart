// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewmodel on _LoginViewmodelBase, Store {
  Computed<String?>? _$emailComputed;

  @override
  String? get email => (_$emailComputed ??= Computed<String?>(() => super.email,
          name: '_LoginViewmodelBase.email'))
      .value;
  Computed<String?>? _$passwordComputed;

  @override
  String? get password =>
      (_$passwordComputed ??= Computed<String?>(() => super.password,
              name: '_LoginViewmodelBase.password'))
          .value;
  Computed<bool?>? _$loadingComputed;

  @override
  bool? get loading =>
      (_$loadingComputed ??= Computed<bool?>(() => super.loading,
              name: '_LoginViewmodelBase.loading'))
          .value;

  late final _$_emailAtom =
      Atom(name: '_LoginViewmodelBase._email', context: context);

  @override
  String? get _email {
    _$_emailAtom.reportRead();
    return super._email;
  }

  @override
  set _email(String? value) {
    _$_emailAtom.reportWrite(value, super._email, () {
      super._email = value;
    });
  }

  late final _$emailControllerAtom =
      Atom(name: '_LoginViewmodelBase.emailController', context: context);

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  late final _$_passwordAtom =
      Atom(name: '_LoginViewmodelBase._password', context: context);

  @override
  String? get _password {
    _$_passwordAtom.reportRead();
    return super._password;
  }

  @override
  set _password(String? value) {
    _$_passwordAtom.reportWrite(value, super._password, () {
      super._password = value;
    });
  }

  late final _$passwordControllerAtom =
      Atom(name: '_LoginViewmodelBase.passwordController', context: context);

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  late final _$_loadingAtom =
      Atom(name: '_LoginViewmodelBase._loading', context: context);

  @override
  bool? get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool? value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  late final _$signInAsyncAction =
      AsyncAction('_LoginViewmodelBase.signIn', context: context);

  @override
  Future<void> signIn(BuildContext context, {bool isLoading = true}) {
    return _$signInAsyncAction
        .run(() => super.signIn(context, isLoading: isLoading));
  }

  late final _$_LoginViewmodelBaseActionController =
      ActionController(name: '_LoginViewmodelBase', context: context);

  @override
  void setEmail(String? value) {
    final _$actionInfo = _$_LoginViewmodelBaseActionController.startAction(
        name: '_LoginViewmodelBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String? value) {
    final _$actionInfo = _$_LoginViewmodelBaseActionController.startAction(
        name: '_LoginViewmodelBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool? value) {
    final _$actionInfo = _$_LoginViewmodelBaseActionController.startAction(
        name: '_LoginViewmodelBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_LoginViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailController: ${emailController},
passwordController: ${passwordController},
email: ${email},
password: ${password},
loading: ${loading}
    ''';
  }
}
