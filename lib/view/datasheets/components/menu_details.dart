import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/domains.dart';
import '../../../models/models.dart';
import '../../_components/components.dart';

class MenuDetails extends StatefulWidget {
  const MenuDetails({
    Key? key,
    required this.model,
    required this.color,
  }) : super(key: key);

  final Color color;
  final DatasheetModel model;

  @override
  State<MenuDetails> createState() => _MenuDetailsState();
}

class _MenuDetailsState extends State<MenuDetails> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: Offset(0, 50),
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

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    Text('Produto excluído com sucesso!')));
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
    );
  }
}
