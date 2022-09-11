import 'package:atelie/core/domains.dart';
import 'package:atelie/core/services/datasheets_repository/datasheets_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../core/helpers/resourses.dart';
import 'package:atelie/models/datasheet_model.dart';
import 'package:flutter/material.dart';
import '../_components/components.dart';
import 'create_datasheet_form.dart';

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
              return Dialog(
                child: CreateDatasheetForm(),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
