import 'package:atelie/helpers/resourses.dart';
import 'package:atelie/models/datasheet_model.dart';
import 'package:atelie/view/datasheets/details_datasheet.dart';
import 'package:flutter/material.dart';

class DatasheetCard extends StatefulWidget {
  final String modeloEncomenda;
  final DatasheetModel model;
  DatasheetCard({
    Key? key,
    required this.modeloEncomenda,
    required this.model,
  }) : super(key: key);

  @override
  State<DatasheetCard> createState() => _DatasheetCardState();
}

class _DatasheetCardState extends State<DatasheetCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Container(
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12),
                    )),
                height: 150,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Text(
                        '${widget.modeloEncomenda}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                        child: IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailsDatasheet(model: widget.model),
                        ),
                      ),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      icon: Icon(
                        Icons.arrow_circle_right,
                        color: R.color.purplePrimary,
                        size: 28,
                      ),
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
