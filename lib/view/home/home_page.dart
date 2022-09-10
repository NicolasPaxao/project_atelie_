import 'package:atelie/core/domains.dart';
import 'package:atelie/view/auth/auth_check_page.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../core/helpers/resourses.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';

class HomePage extends StatefulWidget {
  static final String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: R.color.purplePrimary,
        toolbarHeight: 100,
        title: Text('Mãos a obra!'),
        centerTitle: true,
        actions: [
          Observer(builder: (_) {
            return Consumer(
              builder: (context, value, child) {
                return IconButton(
                    onPressed: () {
                      loginViewModel.signOut(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => AuthCheckPage())));
                    },
                    icon: Icon(Icons.exit_to_app));
              },
            );
          })
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text('${authRepository.user!.email}'),
            Container(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: R.color.purplePrimary,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    )),
                onPressed: () => Navigator.pushNamed(context, '/datasheets'),
                child: Text('Ir para ficha técnica'),
              ),
            ),
            TextButton(
              onPressed: () {
                final list = [
                  ProductModel(
                      quantidade: 1,
                      descricao: 'Kit de Supla',
                      valorUnit: 80,
                      valorTotal: 80),
                  ProductModel(
                      quantidade: 2,
                      descricao: 'Kit de Supla 2',
                      valorUnit: 180,
                      valorTotal: 180),
                ];
                orderRepository.createOrder(
                  OrderModel(
                    cliente: 'Nicolas',
                    email: 'nicolaspaxao@gmail.com',
                    telefone: '(11)988323723',
                    dataEntrega: DateTime(2022, 11, 17),
                    endereco: 'Rua Cajarana nº45',
                    produtos: list,
                    anotacoes: 'Anotações',
                    valorTotal: 5000.0,
                    valorFrete: 50.0,
                    status: false,
                    queue: true,
                  ),
                );
              },
              child: Text('Criar Ficha Pedido'),
            ),
          ],
        ),
      ),
    );
  }
}
