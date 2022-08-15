import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

import '../../helpers/resourses.dart';
import '../../viewmodel/viewmodel.dart';
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
    return Observer(
      builder: ((context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: R.color.purplePrimary,
            toolbarHeight: 120,
            title: Text(
              'Bem-vindo ao seu Atêlie!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InputTextCustom(
                      controller:
                          context.read<LoginViewmodel>().emailController,
                      onChaged: context.read<LoginViewmodel>().setEmail,
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
                    ),
                    const SizedBox(height: 10),
                    Observer(builder: ((context) {
                      return InputTextCustom(
                        controller:
                            context.read<LoginViewmodel>().passwordController,
                        onChaged: context.read<LoginViewmodel>().setPassword,
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
                    const SizedBox(height: 10),
                    Observer(builder: ((context) {
                      return Padding(
                        padding: const EdgeInsets.all(24),
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<LoginViewmodel>().signIn(context);
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                                (context.read<LoginViewmodel>().loading == true)
                                    ? [
                                        Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                              ),
                                            ))
                                      ]
                                    : [
                                        Icon(Icons.check),
                                        SizedBox(width: 5),
                                        Text(
                                          'Entrar',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: R.color.purplePrimary),
                        ),
                      );
                    })),
                    Observer(builder: ((context) {
                      return Padding(
                        padding: const EdgeInsets.all(24),
                        child: ElevatedButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => RegisterPage()))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Criar uma conta!',
                                style: TextStyle(
                                    color: R.color.purplePrimary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              side: BorderSide(
                                  width: 1, color: R.color.purplePrimary)),
                        ),
                      );
                    })),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
