import 'package:atelie/helpers/resourses.dart';
import 'package:atelie/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        backgroundColor: R.color.purplePrimary,
        toolbarHeight: 120,
        title: Text('Olá, Artesão\nMãos a obra!'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => context.read<AuthRepository>().signOut(),
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text('${context.watch<AuthRepository>().user!.email}'),
            TextButton(
              onPressed: () =>
                  context.read<DatasheetRepository>().createDatasheet(),
              child: Text('Criar Ficha Técnica'),
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
                context.read<OrderRepository>().createOrder(
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
              child: Text('Criar Ficha Pedid'),
            ),
          ],
        ),
      ),
    );
  }
}
