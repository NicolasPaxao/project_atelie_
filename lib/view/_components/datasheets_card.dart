import 'package:atelie/models/datasheet_model.dart';
import 'package:atelie/view/datasheets/details_datasheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/helpers/resourses.dart';

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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailsDatasheet(model: widget.model),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(width: 1, color: R.color.purplePrimary),
                  bottom: BorderSide(width: 1, color: R.color.purplePrimary))),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    color: R.color.purplePrimary,
                    borderRadius: BorderRadius.circular(600)),
              ),
              SizedBox(width: 16),
              Text(
                '${widget.model.modeloEncomenda}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Icon(Icons.keyboard_double_arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}
