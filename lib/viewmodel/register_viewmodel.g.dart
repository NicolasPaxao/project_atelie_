// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterViewmodel on _RegisterViewmodelBase, Store {
  Computed<String?>? _$emailComputed;

  @override
  String? get email => (_$emailComputed ??= Computed<String?>(() => super.email,
          name: '_RegisterViewmodelBase.email'))
      .value;
  Computed<String?>? _$passwordComputed;

  @override
  String? get password =>
      (_$passwordComputed ??= Computed<String?>(() => super.password,
              name: '_RegisterViewmodelBase.password'))
          .value;
  Computed<String?>? _$nameComputed;

  @override
  String? get name => (_$nameComputed ??= Computed<String?>(() => super.name,
          name: '_RegisterViewmodelBase.name'))
      .value;
  Computed<bool?>? _$loadingComputed;

  @override
  bool? get loading =>
      (_$loadingComputed ??= Computed<bool?>(() => super.loading,
              name: '_RegisterViewmodelBase.loading'))
          .value;

  late final _$_emailAtom =
      Atom(name: '_RegisterViewmodelBase._email', context: context);

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
      Atom(name: '_RegisterViewmodelBase.emailController', context: context);

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
      Atom(name: '_RegisterViewmodelBase._password', context: context);

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
      Atom(name: '_RegisterViewmodelBase.passwordController', context: context);

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

  late final _$_nameAtom =
      Atom(name: '_RegisterViewmodelBase._name', context: context);

  @override
  String? get _name {
    _$_nameAtom.reportRead();
    return super._name;
  }

  @override
  set _name(String? value) {
    _$_nameAtom.reportWrite(value, super._name, () {
      super._name = value;
    });
  }

  late final _$nameControllerAtom =
      Atom(name: '_RegisterViewmodelBase.nameController', context: context);

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  late final _$_loadingAtom =
      Atom(name: '_RegisterViewmodelBase._loading', context: context);

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

  late final _$signUpAsyncAction =
      AsyncAction('_RegisterViewmodelBase.signUp', context: context);

  @override
  Future<void> signUp(BuildContext context, {bool isLoading = true}) {
    return _$signUpAsyncAction
        .run(() => super.signUp(context, isLoading: isLoading));
  }

  late final _$_RegisterViewmodelBaseActionController =
      ActionController(name: '_RegisterViewmodelBase', context: context);

  @override
  void setEmail(String? value) {
    final _$actionInfo = _$_RegisterViewmodelBaseActionController.startAction(
        name: '_RegisterViewmodelBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_RegisterViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String? value) {
    final _$actionInfo = _$_RegisterViewmodelBaseActionController.startAction(
        name: '_RegisterViewmodelBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_RegisterViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String? value) {
    final _$actionInfo = _$_RegisterViewmodelBaseActionController.startAction(
        name: '_RegisterViewmodelBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_RegisterViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool? value) {
    final _$actionInfo = _$_RegisterViewmodelBaseActionController.startAction(
        name: '_RegisterViewmodelBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_RegisterViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailController: ${emailController},
passwordController: ${passwordController},
nameController: ${nameController},
email: ${email},
password: ${password},
name: ${name},
loading: ${loading}
    ''';
  }
}
