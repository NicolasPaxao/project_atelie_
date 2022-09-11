import 'package:atelie/models/datasheet_model.dart';
import 'package:atelie/view/datasheets/details_datasheet.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

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
  FirebaseStorage storage = FirebaseStorage.instance;
  String ref = '';
  bool loading = true;
  String image = '';

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  loadImage() async {
    ref = await storage
        .ref('images/img-${widget.model.uid}.jpg')
        .getDownloadURL();
    setState(() {
      image = ref;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailsDatasheet(
                model: widget.model,
                path: image,
              ),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: R.color.purplePrimary),
              bottom: BorderSide(width: 1, color: R.color.purplePrimary),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: R.color.purplePrimary,
                  borderRadius: BorderRadius.circular(600),
                ),
                child: image == ""
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(image, fit: BoxFit.fitWidth)),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Modelo: ${widget.model.modeloEncomenda}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Fio: ${widget.model.fioUtilizado}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Icon(Icons.keyboard_double_arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}
