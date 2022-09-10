import 'package:atelie/core/domains.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:validators/validators.dart';

import '../../core/helpers/resourses.dart';
import '../view.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => false as Future<bool>,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/novelo.png',
                    width: 120,
                    height: 120,
                    fit: BoxFit.fitWidth,
                  ),
                  Text(
                    'Bem-vindo ao seu Atêlie!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Observer(builder: (_) {
                    return InputTextCustom(
                      controller: loginViewModel.emailController,
                      onChaged: loginViewModel.setEmail,
                      labelText: 'E-mail',
                      prefix: Icon(
                        Icons.email,
                        color: R.color.purplePrimary,
                      ),
                      keyboard: TextInputType.emailAddress,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Informe o email';
                        } else if (!isEmail(value)) {
                          return 'Informe um e-mail válido';
                        }
                        return null;
                      },
                    );
                  }),
                  const SizedBox(height: 10),
                  Observer(builder: ((context) {
                    return InputTextCustom(
                      controller: loginViewModel.passwordController,
                      onChaged: loginViewModel.setPassword,
                      labelText: 'Senha',
                      prefix: Icon(
                        Icons.lock,
                        color: R.color.purplePrimary,
                      ),
                      obscureText: isObscure,
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        icon: Icon(
                          isObscure ? Icons.visibility_off : Icons.visibility,
                          color: R.color.purplePrimary,
                        ),
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Informe a senha';
                        } else if (value.length < 6) {
                          return 'Sua senha tem que ter mais de 6 digitos';
                        }
                        return null;
                      },
                    );
                  })),
                  const SizedBox(height: 30),
                  Observer(
                    builder: (_) {
                      return ButtonPrimary(
                        title: 'Entrar',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            loginViewModel.signIn(context);
                          }
                        },
                        loading: loginViewModel.loading,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ButtonSecondary(
                    title: 'Criar uma conta!',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => RegisterPage())));
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
