import 'package:atelie/models/datasheet_model.dart';
import 'package:atelie/services/datasheets_repository/datasheets_repository.dart';
import 'package:atelie/view/view.dart';
import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailsDatasheet extends StatefulWidget {
  final DatasheetModel model;
  DetailsDatasheet({Key? key, required this.model}) : super(key: key);

  @override
  State<DetailsDatasheet> createState() => _DetailsDatasheetState();
}

class _DetailsDatasheetState extends State<DetailsDatasheet> {
  TextEditingController editingController = TextEditingController();

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
|\tProduto - ${widget.model.modeloEncomenda}
|\tFio Utilizado - ${widget.model.fioUtilizado}
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
                                context
                                    .read<DatasheetRepository>()
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
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 300,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          'https://imagens-revista.vivadecora.com.br/uploads/2018/03/modelo-de-sousplat-colorido.jpg',
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                    showDialog(
                      context: context,
                      builder: (context) {
                        editingController.text = widget.model.modeloEncomenda;
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              content: TextFormField(
                                controller: editingController,
                                decoration: InputDecoration(labelText: 'Name'),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context
                                        .read<DatasheetRepository>()
                                        .editDatasheet(widget.model.uid!, {
                                      "modeloEncomenda": editingController.text
                                    });
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
                  },
                  title: 'Crochê: ',
                  text: widget.model.modeloEncomenda,
                ),
                const SizedBox(height: 20),
                EditField(
                  onTap: () {},
                  title: 'Fio Utilizado: ',
                  text: widget.model.fioUtilizado,
                ),
                const SizedBox(height: 20),
                EditField(
                  onTap: () {},
                  title: 'Tempo de produção: ',
                  text: widget.model.tempoProducao,
                ),
                const SizedBox(height: 20),
                EditField(
                  onTap: () {},
                  title: 'Tamanho: ',
                  text: '${widget.model.tamanhoPeca} cm',
                ),
                const SizedBox(height: 10),
                Center(
                  child: TextCustom(title: 'Preços', fontS: 22, isBold: true),
                ),
                const SizedBox(height: 10),
                EditField(
                  onTap: () {},
                  title: 'Preço do Fio: ',
                  text:
                      '${NumberFormat.currency(locale: 'pt').format(widget.model.precoFio)}',
                ),
                const SizedBox(height: 20),
                EditField(
                  onTap: () {},
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
                  onTap: () {},
                  title: 'Peso 1 Unids: ',
                  text: '${NumberFormat('').format(widget.model.pesoUm)} Kg',
                ),
                const SizedBox(height: 20),
                EditField(
                  onTap: () {},
                  title: 'Pese 4 Unids: ',
                  text:
                      '${NumberFormat('').format(widget.model.pesoQuatro)} Kg',
                ),
                const SizedBox(height: 20),
                EditField(
                  onTap: () {},
                  title: 'Pese 6 Unids: ',
                  text: '${NumberFormat('').format(widget.model.pesoSeis)} Kg',
                ),
                const SizedBox(height: 20),
                EditField(
                  onTap: () {},
                  title: 'Pese 8 Unids: ',
                  text: '${NumberFormat('').format(widget.model.pesoOito)} Kg',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
