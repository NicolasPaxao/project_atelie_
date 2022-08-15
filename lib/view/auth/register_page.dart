import 'package:atelie/viewmodel/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

import '../../helpers/resourses.dart';
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
            backgroundColor: R.color.purplePrimary,
            toolbarHeight: 120,
            title: Text(
              'Cadastre-se para entrar',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
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
                      controller:
                          context.read<RegisterViewmodel>().nameController,
                      onChaged: context.read<RegisterViewmodel>().setName,
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
                      controller:
                          context.read<RegisterViewmodel>().emailController,
                      onChaged: context.read<RegisterViewmodel>().setEmail,
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
                      controller:
                          context.read<RegisterViewmodel>().passwordController,
                      onChaged: context.read<RegisterViewmodel>().setPassword,
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
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<RegisterViewmodel>().signUp(context);
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              (context.read<RegisterViewmodel>().loading ==
                                      true)
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
                                        'Registrar',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: R.color.purplePrimary),
                      ),
                    ),
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
