// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:atelie/core/domains.dart';
import 'package:atelie/core/helpers/resourses.dart';
import 'package:atelie/models/datasheet_model.dart';
import 'package:atelie/view/view.dart';

import 'components/menu_details.dart';

class DetailsDatasheet extends StatefulWidget {
  final DatasheetModel model;
  final String path;
  DetailsDatasheet({
    Key? key,
    required this.model,
    required this.path,
  }) : super(key: key);

  @override
  State<DetailsDatasheet> createState() => _DetailsDatasheetState();
}

class _DetailsDatasheetState extends State<DetailsDatasheet> {
  TextEditingController editingController = TextEditingController();
  late ScrollController _scrollController;
  Color? _textColor = Colors.white;
  Color? _colorIcons = Colors.white;
//----------
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _textColor =
              _isSliverAppBarExpanded ? Colors.white : Colors.transparent;
          _colorIcons = _isSliverAppBarExpanded ? Colors.white : Colors.black;
        });
      });
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

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
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            foregroundColor: _colorIcons,
            pinned: true,
            backgroundColor: R.color.purplePrimary,
            expandedHeight: 250,
            actions: [
              MenuDetails(
                model: widget.model,
                color: _colorIcons!,
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'image',
                child: Image.network(
                  widget.path,
                  fit: BoxFit.fitWidth,
                ),
              ),
              title: Text(
                'Detalhes do produto',
                style: TextStyle(color: _textColor),
              ),
              expandedTitleScale: 1.1,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      child:
                          TextCustom(title: 'Preços', fontS: 22, isBold: true),
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
                      child:
                          TextCustom(title: 'Pesos', fontS: 22, isBold: true),
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
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
