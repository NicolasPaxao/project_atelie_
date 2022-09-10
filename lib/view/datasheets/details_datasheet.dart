import 'dart:async';

import 'package:atelie/core/domains.dart';
import 'package:atelie/models/datasheet_model.dart';
import 'package:atelie/view/view.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailsDatasheet extends StatefulWidget {
  final DatasheetModel model;
  DetailsDatasheet({Key? key, required this.model}) : super(key: key);

  @override
  State<DetailsDatasheet> createState() => _DetailsDatasheetState();
}

class _DetailsDatasheetState extends State<DetailsDatasheet> {
  TextEditingController editingController = TextEditingController();
  _editField(String label, String path, String model, bool isDouble) {
    showDialog(
      context: context,
      builder: (context) {
        editingController.text = model;
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: TextFormField(
                controller: editingController,
                decoration: InputDecoration(labelText: label),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    if (isDouble == false) {
                      datasheetRepository.editDatasheet(widget.model.uid!,
                          {"${path}": editingController.text});
                    } else {
                      datasheetRepository.editDatasheet(widget.model.uid!,
                          {"${path}": double.parse(editingController.text)});
                    }
                    Navigator.pop(context);
                  },
                  child: Text('Ok'),
                )
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutCustom(
      title: 'Detalhes do produto',
      actions: [
        PopupMenuButton(
          offset: Offset(0, 70),
          itemBuilder: (_) => <PopupMenuItem>[
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(
                    Icons.copy,
                    color: Colors.black,
                    size: 24,
                  ),
                  SizedBox(width: 5),
                  TextCustom(title: 'Copiar', fontS: 14, isBold: true)
                ],
              ),
              value: 'Copiar',
              onTap: () {
                FlutterClipboard.copy('''
Produto - ${widget.model.modeloEncomenda}
Fio Utilizado - ${widget.model.fioUtilizado}
Tempo de Produção: - ${widget.model.tempoProducao}
Tamanho da Peça - ${widget.model.tamanhoPeca} cm
Preço do fio - ${NumberFormat.currency(locale: 'pt').format(widget.model.precoFio)}
Preço da encomenda - ${NumberFormat.currency(locale: 'pt').format(widget.model.precoEncomenda)}
Peso 1 Unid - ${widget.model.pesoUm} Kg
Peso 4 Unid - ${widget.model.pesoQuatro} kg
Peso 6 Unid - ${widget.model.pesoSeis} Kg
Peso 8 Unid - ${widget.model.pesoOito} Kg
''').then(
                  (value) => ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Dados copiádos!'))),
                );
              },
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 24,
                  ),
                  SizedBox(width: 5),
                  TextCustom(title: 'Deletar', fontS: 14, isBold: true)
                ],
              ),
              value: 'Deletar',
              onTap: () {
                Future.delayed(
                  const Duration(seconds: 0),
                  () => showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(builder: ((context, setState) {
                        return AlertDialog(
                          title: Text('Realmente quer deletar essa ficha?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                datasheetRepository
                                    .deleteDatasheet(widget.model.uid!);

                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Produto excluído com sucesso!')));
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: Text('Ok'),
                            )
                          ],
                        );
                      }));
                    },
                  ),
                );
              },
            ),
          ],
        )
      ],
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Center(
                  child: TextCustom(
                    title: 'Detalhes',
                    fontS: 22,
                    isBold: true,
                  ),
                ),
                const SizedBox(height: 10),
                EditField(
                  onTap: () {
                    _editField('Modelo', 'modeloEncomenda',
                        widget.model.modeloEncomenda, false);
                  },
                  title: 'Crochê: ',
                  text: widget.model.modeloEncomenda,
                ),
                const SizedBox(height: 20),
                EditField(
                  onTap: () {
                    _editField('Fio Utilizado', 'fioUtilizado',
                        widget.model.fioUtilizado, false);
                  },
                  title: 'Fio Utilizado: ',
                  text: widget.model.fioUtilizado,
                ),
                const SizedBox(height: 20),
                EditField(
                  onTap: () {
                    _editField('Tempo de produção', 'tempoProducao',
                        widget.model.tempoProducao, false);
                  },
                  title: 'Tempo de produção: ',
                  text: widget.model.tempoProducao,
                ),
                const SizedBox(height: 20),
                EditField(
                  onTap: () {
                    _editField('Tamanho', 'tamanhoPeca',
                        widget.model.tamanhoPeca, false);
                  },
                  title: 'Tamanho: ',
                  text: '${widget.model.tamanhoPeca} cm',
                ),
                const SizedBox(height: 10),
                Center(
                  child: TextCustom(title: 'Preços', fontS: 22, isBold: true),
                ),
                const SizedBox(height: 10),
                EditField(
                  onTap: () {
                    _editField('Preço do Fio', 'precoFio',
                        widget.model.precoFio.toString(), true);
                  },
                  title: 'Preço do Fio: ',
                  text:
                      '${NumberFormat.currency(locale: 'pt').format(widget.model.precoFio)}',
                ),
                const SizedBox(height: 20),
                EditField(
                  onTap: () {
                    _editField('Preço da Encomenda', 'precoEncomenda',
                        widget.model.precoEncomenda.toString(), true);
                  },
                  title: 'Preço da Encomenda: ',
                  text:
                      '${NumberFormat.currency(locale: 'pt').format(widget.model.precoEncomenda)}',
                ),
                const SizedBox(height: 10),
                Center(
                  child: TextCustom(title: 'Pesos', fontS: 22, isBold: true),
                ),
                const SizedBox(height: 10),
                EditField(
                  onTap: () {
                    _editField('Peso 1 Unid', 'pesoUm',
                        widget.model.pesoUm.toString(), true);
                  },
                  title: 'Peso 1 Unid: ',
                  text: '${widget.model.pesoUm} Kg',
                ),
                const SizedBox(height: 20),
                EditField(
                  onTap: () {
                    _editField('Peso 4 Unids', 'pesoQuatro',
                        widget.model.pesoQuatro.toString(), true);
                  },
                  title: 'Peso 4 Unids: ',
                  text: '${widget.model.pesoQuatro} Kg',
                ),
                const SizedBox(height: 20),
                EditField(
                  onTap: () {
                    _editField('Peso 6 Unids', 'pesoSeis',
                        widget.model.pesoSeis.toString(), true);
                  },
                  title: 'Peso 6 Unids: ',
                  text: '${widget.model.pesoSeis} Kg',
                ),
                const SizedBox(height: 20),
                EditField(
                  onTap: () {
                    _editField('Peso 8 Unids', 'pesoOito',
                        widget.model.pesoOito.toString(), true);
                  },
                  title: 'Peso 8 Unids: ',
                  text: '${widget.model.pesoOito} Kg',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
