import 'package:atelie/helpers/resourses.dart';
import 'package:atelie/models/datasheet_model.dart';
import 'package:atelie/view/datasheets/details_datasheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

class DatasheetCard extends StatefulWidget {
  final String modeloEncomenda;
  final DatasheetModel model;
  final String uid;
  DatasheetCard({
    Key? key,
    required this.modeloEncomenda,
    required this.model,
    required this.uid,
  }) : super(key: key);

  @override
  State<DatasheetCard> createState() => _DatasheetCardState();
}

class _DatasheetCardState extends State<DatasheetCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: GestureDetector(
        onTap: () {
          EasyLoading.show(status: 'Carregando...');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailsDatasheet(model: widget.model),
            ),
          );
          EasyLoading.dismiss();
        },
        child: Container(
          width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Modelo: ${widget.model.modeloEncomenda}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Fio Utilizado: ${widget.model.fioUtilizado}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Preço do Produto: ${NumberFormat.currency(locale: 'pt').format(widget.model.precoEncomenda)}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
