import 'package:atelie/helpers/resourses.dart';
import 'package:atelie/models/datasheet_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/services.dart';
import '../_components/components.dart';

class DatasheetPage extends StatefulWidget {
  DatasheetPage({Key? key}) : super(key: key);

  @override
  State<DatasheetPage> createState() => _DatasheetPageState();
}

class _DatasheetPageState extends State<DatasheetPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutCustom(
      title: 'Fichas Técnicas',
      appBarBottom: PreferredSize(
        preferredSize: Size(double.infinity, 50),
        child: SearchTextField(),
      ),
      body: StreamBuilder<List<DatasheetModel>>(
        stream: context.read<DatasheetRepository>().readDatasheet(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Alguma coisa deu errado: ${snapshot.error}');
          } else if (snapshot.hasData) {
            final ds = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: ds.map(((e) {
                  return DatasheetCard(
                    uid: e.uid!,
                    modeloEncomenda: e.modeloEncomenda,
                    model: e,
                  );
                })).toList(),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatButton: FloatingActionButton(
        backgroundColor: R.color.purplePrimary,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              final controller = TextEditingController();
              return Dialog(
                child: Container(
                  height: 500,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        TextCustom(
                            title: 'Criar ficha!', fontS: 18, isBold: true),
                        Container(
                          child: InputTextCustom(
                              labelText: 'Modelo',
                              validator: null,
                              controller: controller,
                              onChaged: (String? value) {}),
                        ),
                        Container(
                          child: InputTextCustom(
                              labelText: 'Fio Utilizado',
                              validator: null,
                              controller: controller,
                              onChaged: (String? value) {}),
                        ),
                        Container(
                          child: InputTextCustom(
                              labelText: 'Tamanho da peça',
                              validator: null,
                              controller: controller,
                              onChaged: (String? value) {}),
                        ),
                        Container(
                          child: InputTextCustom(
                              labelText: 'Tempo de Trabalho',
                              validator: null,
                              controller: controller,
                              onChaged: (String? value) {}),
                        ),
                        Container(
                          child: InputTextCustom(
                              labelText: 'Preço do Fio',
                              validator: null,
                              controller: controller,
                              onChaged: (String? value) {}),
                        ),
                        Container(
                          child: InputTextCustom(
                              labelText: 'Preço da encomenda',
                              validator: null,
                              controller: controller,
                              onChaged: (String? value) {}),
                        ),
                        TextButton(
                            onPressed: () {
                              context
                                  .read<DatasheetRepository>()
                                  .createDatasheet();
                              Navigator.pop(context);
                            },
                            child: Text('TESTE'))
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
