import 'dart:io';
import 'package:atelie/core/helpers/resourses.dart';
import 'package:atelie/view/_components/input_text_form.dart';
import 'package:atelie/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/domains.dart';

class CreateDatasheetForm extends StatefulWidget {
  const CreateDatasheetForm({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateDatasheetForm> createState() => _CreateDatasheetFormState();
}

class _CreateDatasheetFormState extends State<CreateDatasheetForm> {
  late ImageProvider backgroundImage = AssetImage('assets/no_image.png');
  File? imageBase;

  Future<Null> getImageGallery() async {
    final picker = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    imageBase = picker != null ? File(picker.path) : null;
    if (imageBase != null) {
      setState(() {
        backgroundImage = FileImage(imageBase!);
      });
    }
  }

  Future<Null> getImageCamera() async {
    final picker = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
    );
    imageBase = picker != null ? File(picker.path) : null;
    if (imageBase != null) {
      setState(() {
        backgroundImage = FileImage(imageBase!);
      });
    }
  }

  _showPickerType() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: TextCustom(
              title: 'Escolha uma opção',
              fontS: 18,
              isBold: true,
              color: R.color.purplePrimary,
            ),
            content: Container(
              height: 120,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () => getImageCamera(),
                          icon: Icon(Icons.photo_camera,
                              color: R.color.purplePrimary)),
                      TextCustom(
                        title: 'Câmera',
                        fontS: 18,
                        isBold: true,
                        color: R.color.purplePrimary,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () => getImageGallery(),
                          icon:
                              Icon(Icons.photo, color: R.color.purplePrimary)),
                      TextCustom(
                        title: 'Galeria',
                        fontS: 18,
                        isBold: true,
                        color: R.color.purplePrimary,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            TextCustom(
              title: 'Crie uma ficha nova!',
              fontS: 20,
              isBold: true,
              color: R.color.purplePrimary,
            ),
            SizedBox(height: 20),
            Center(
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                    ),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: backgroundImage,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: R.color.purplePrimary,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      onPressed: () => _showPickerType(),
                      icon: Icon(
                        Icons.photo,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Observer(builder: (_) {
              return Column(
                children: [
                  const SizedBox(height: 10),
                  Center(
                    child: TextCustom(
                      title: 'Detalhes',
                      fontS: 18,
                      isBold: true,
                    ),
                  ),
                  InputTextCustomForm(
                      labelText: 'Modelo',
                      validator: null,
                      controller: datasheetViewModel.modeloController,
                      onChaged: datasheetViewModel.setModelo),
                  InputTextCustomForm(
                      labelText: 'Fio Utilizado',
                      validator: null,
                      controller: datasheetViewModel.fioUtilizadoController,
                      onChaged: datasheetViewModel.setFioUtilizado),
                  InputTextCustomForm(
                      labelText: 'Tamanho da peça',
                      validator: null,
                      controller: datasheetViewModel.tamanhoController,
                      onChaged: datasheetViewModel.setTamanho),
                  InputTextCustomForm(
                      labelText: 'Tempo de Trabalho',
                      validator: null,
                      controller: datasheetViewModel.tempoProducaoController,
                      onChaged: datasheetViewModel.setTempoProducao),
                  const SizedBox(height: 10),
                  Center(
                    child: TextCustom(
                      title: 'Preços',
                      fontS: 18,
                      isBold: true,
                    ),
                  ),
                  InputTextCustomForm(
                      labelText: 'Preço do Fio',
                      keyboard: TextInputType.number,
                      validator: null,
                      controller: datasheetViewModel.precoFioController,
                      onChaged: datasheetViewModel.setPrecoFio),
                  InputTextCustomForm(
                      labelText: 'Preço da encomenda',
                      keyboard: TextInputType.number,
                      validator: null,
                      controller: datasheetViewModel.precoEncomendaController,
                      onChaged: datasheetViewModel.setPrecoEncomenda),
                  const SizedBox(height: 10),
                  Center(
                    child: TextCustom(
                      title: 'Pesos',
                      fontS: 18,
                      isBold: true,
                    ),
                  ),
                  InputTextCustomForm(
                      labelText: 'Peso 1 Unid',
                      keyboard: TextInputType.number,
                      validator: null,
                      controller: datasheetViewModel.peso1Controller,
                      onChaged: datasheetViewModel.setPeso1),
                  InputTextCustomForm(
                      labelText: 'Peso 4 Unids',
                      keyboard: TextInputType.number,
                      validator: null,
                      controller: datasheetViewModel.peso4Controller,
                      onChaged: datasheetViewModel.setPeso4),
                  InputTextCustomForm(
                      labelText: 'Peso 6 Unids',
                      keyboard: TextInputType.number,
                      validator: null,
                      controller: datasheetViewModel.peso6Controller,
                      onChaged: datasheetViewModel.setPeso6),
                  InputTextCustomForm(
                      labelText: 'Peso 8 Unids',
                      keyboard: TextInputType.number,
                      validator: null,
                      controller: datasheetViewModel.peso8Controller,
                      onChaged: datasheetViewModel.setPeso8),
                ],
              );
            }),
            SizedBox(height: 20),
            Observer(builder: (_) {
              return ButtonPrimary(
                title: 'Enviar',
                onPressed: () {
                  datasheetViewModel.createDatasheet(context, imageBase!.path);
                  Navigator.pop(context);
                },
              );
            }),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
