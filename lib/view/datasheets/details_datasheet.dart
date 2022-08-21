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
                  (value) => print('copied'),
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
              onTap: () {},
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
                  child: TextCustom(title: 'Detalhes', fontS: 22, isBold: true),
                ),
                const SizedBox(height: 10),
                EditField(
                  onTap: () {},
                  title: 'Crochê: ',
                  text: widget.model.fioUtilizado,
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
