import 'package:atelie/core/domains.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:validators/validators.dart';

import '../../core/helpers/resourses.dart';
import '../view.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: ((context) {
        return Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: R.color.purplePrimary,
            toolbarHeight: 60,
            title: Text(
              'Cadastre-se para entrar',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.25,
              child: Center(
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
                      InputTextCustom(
                        controller: registerViewModel.nameController,
                        onChaged: registerViewModel.setName,
                        labelText: 'Nome',
                        prefix: Icon(
                          Icons.person,
                          color: R.color.purplePrimary,
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Seu nome';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      InputTextCustom(
                        controller: registerViewModel.emailController,
                        onChaged: registerViewModel.setEmail,
                        labelText: 'E-mail',
                        keyboard: TextInputType.emailAddress,
                        prefix: Icon(
                          Icons.email,
                          color: R.color.purplePrimary,
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Informe o e-mail';
                          } else if (!isEmail(value)) {
                            return 'Informe um e-mail válido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      InputTextCustom(
                        controller: registerViewModel.passwordController,
                        onChaged: registerViewModel.setPassword,
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
                      ),
                      const SizedBox(height: 30),
                      ButtonPrimary(
                        title: 'Registrar',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            registerViewModel.signUp(context);
                          }
                        },
                        loading: registerViewModel.loading,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
