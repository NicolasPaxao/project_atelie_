import 'package:atelie/view/view.dart';
import 'package:flutter/material.dart';

import '../../core/domains.dart';

class CreateOrderForm extends StatefulWidget {
  const CreateOrderForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  State<CreateOrderForm> createState() => _CreateOrderFormState();
}

class _CreateOrderFormState extends State<CreateOrderForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            TextCustom(title: 'Criar ficha!', fontS: 18, isBold: true),
            Container(
              child: InputTextCustom(
                  labelText: 'Modelo',
                  validator: null,
                  controller: widget.controller,
                  onChaged: (String? value) {}),
            ),
            Container(
              child: InputTextCustom(
                  labelText: 'Fio Utilizado',
                  validator: null,
                  controller: widget.controller,
                  onChaged: (String? value) {}),
            ),
            Container(
              child: InputTextCustom(
                  labelText: 'Tamanho da peça',
                  validator: null,
                  controller: widget.controller,
                  onChaged: (String? value) {}),
            ),
            Container(
              child: InputTextCustom(
                  labelText: 'Tempo de Trabalho',
                  validator: null,
                  controller: widget.controller,
                  onChaged: (String? value) {}),
            ),
            Container(
              child: InputTextCustom(
                  labelText: 'Preço do Fio',
                  validator: null,
                  controller: widget.controller,
                  onChaged: (String? value) {}),
            ),
            Container(
              child: InputTextCustom(
                  labelText: 'Preço da encomenda',
                  validator: null,
                  controller: widget.controller,
                  onChaged: (String? value) {}),
            ),
            TextButton(
                onPressed: () {
                  datasheetRepository.createDatasheet();
                  Navigator.pop(context);
                },
                child: Text('TESTE'))
          ],
        ),
      ),
    );
  }
}
