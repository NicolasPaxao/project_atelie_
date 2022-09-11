import 'package:atelie/core/domains.dart';

import '../../core/helpers/resourses.dart';
import 'package:atelie/models/datasheet_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/services/services.dart';
import '../_components/components.dart';
import 'create_ordem_form.dart';

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
        stream: datasheetRepository.readDatasheet(),
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
                child: CreateOrderForm(controller: controller),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
