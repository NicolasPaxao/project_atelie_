import 'package:atelie/core/domains.dart';
import 'package:atelie/view/auth/auth_check_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../core/helpers/resourses.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../_components/components.dart';

class HomePage extends StatefulWidget {
  static final String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.purplePrimary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        title: Image.asset(
          'assets/novelo.png',
          width: 50,
          height: 50,
          fit: BoxFit.fitWidth,
        ),
        centerTitle: true,
        actions: [
          Observer(builder: (_) {
            return Consumer(
              builder: (context, value, child) {
                return IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            content: TextCustom(
                              title: 'Deseja realmente sair?',
                              fontS: 22,
                              isBold: false,
                            ),
                            actionsAlignment: MainAxisAlignment.spaceBetween,
                            actions: [
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  loginViewModel.signOut(context);
                                },
                                icon: Icon(
                                  Icons.check,
                                  color: R.color.purplePrimary,
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.exit_to_app));
              },
            );
          })
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCustom(
                  title: 'Bem vinda(o)!',
                  fontS: 32,
                  color: Colors.white,
                  isBold: true),
              SizedBox(height: 10),
              TextCustom(
                  title:
                      'Aqui você tem as opções para gerênciar suas encomendas!',
                  fontS: 16,
                  color: Colors.white,
                  isBold: false),
              SizedBox(height: 56),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UtilsButton(
                      onTap: () => Navigator.pushNamed(context, '/agendadas'),
                      title: 'Encomendas',
                      image: Icons.domain_verification_rounded),
                  UtilsButton(
                      onTap: () => Navigator.pushNamed(context, '/realizadas'),
                      title: 'Histórico',
                      image: Icons.history_edu_rounded),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UtilsButton(
                      onTap: () {},
                      title: 'Fila de Espera',
                      image: Icons.queue_rounded),
                  UtilsButton(
                    onTap: () {
                      Navigator.pushNamed(context, '/datasheets');
                    },
                    title: 'Ficha Técnica',
                    image: Icons.description,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
