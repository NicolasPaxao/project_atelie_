import 'package:atelie/core/domains.dart';
import 'package:atelie/models/datasheet_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

import '../core/exceptions/exceptions.dart';
part 'datasheet_viewmodel.g.dart';

class DatasheetViewModel = _DatasheetViewModelBase with _$DatasheetViewModel;

abstract class _DatasheetViewModelBase with Store {
  clear() {
    _modelo = null;
    _fioUtilizado = null;
    _peso1 = null;
    _peso4 = null;
    _peso6 = null;
    _peso6 = null;
    _precoEncomenda = null;
    _precoFio = null;
    _tempoProducao = null;
    modeloController.clear();
    fioUtilizadoController;
    peso1Controller.clear();
    peso4Controller.clear();
    peso6Controller.clear();
    peso6Controller.clear();
    precoEncomendaController.clear();
    precoFioController.clear();
    tempoProducaoController.clear();
  }

  @observable
  String? _modelo;
  @action
  void setModelo(String? value) => _modelo = value!.trim();
  @computed
  String? get modelo => _modelo;
  @observable
  TextEditingController modeloController = TextEditingController();

  @observable
  String? _fioUtilizado;
  @action
  void setFioUtilizado(String? value) => _fioUtilizado = value!.trim();
  @computed
  String? get fioUtilizado => _fioUtilizado;
  @observable
  TextEditingController fioUtilizadoController = TextEditingController();

  @observable
  String? _tempoProducao;
  @action
  void setTempoProducao(String? value) => _tempoProducao = value!.trim();
  @computed
  String? get tempoProducao => _tempoProducao;
  @observable
  TextEditingController tempoProducaoController = TextEditingController();

  @observable
  String? _tamanho;
  @action
  void setTamanho(String? value) => _tamanho = value!.trim();
  @computed
  String? get tamanho => _tamanho;
  @observable
  TextEditingController tamanhoController = TextEditingController();

  @observable
  String? _precoFio;
  @action
  void setPrecoFio(String? value) => _precoFio = value!.trim();
  @computed
  String? get precoFio => _precoFio;
  @observable
  TextEditingController precoFioController = TextEditingController();

  @observable
  String? _precoEncomenda;
  @action
  void setPrecoEncomenda(String? value) => _precoEncomenda = value!.trim();
  @computed
  String? get precoEncomenda => _precoEncomenda;
  @observable
  TextEditingController precoEncomendaController = TextEditingController();

  @observable
  String? _peso1;
  @action
  void setPeso1(String? value) => _peso1 = value!.trim();
  @computed
  String? get peso1 => _peso1;
  @observable
  TextEditingController peso1Controller = TextEditingController();

  @observable
  String? _peso4;
  @action
  void setPeso4(String? value) => _peso4 = value!.trim();
  @computed
  String? get peso4 => _peso4;
  @observable
  TextEditingController peso4Controller = TextEditingController();

  @observable
  String? _peso6;
  @action
  void setPeso6(String? value) => _peso6 = value!.trim();
  @computed
  String? get peso6 => _peso6;
  @observable
  TextEditingController peso6Controller = TextEditingController();

  @observable
  String? _peso8;
  @action
  void setPeso8(String? value) => _peso8 = value!.trim();
  @computed
  String? get peso8 => _peso8;
  @observable
  TextEditingController peso8Controller = TextEditingController();

  @observable
  bool? _loading;
  @action
  void setLoading(bool? value) => _loading = value!;
  @computed
  bool? get loading => _loading;

  @action
  Future<void> createDatasheet(
    BuildContext context,
    String path, {
    bool isLoading = true,
  }) async {
    Uuid uuid = Uuid();
    setLoading(isLoading);
    try {
      DatasheetModel dt = DatasheetModel(
        uid: uuid.v4(),
        precoEncomenda: double.parse(_precoEncomenda!),
        precoFio: double.parse(_precoFio!),
        pesoUm: double.parse(_peso1!),
        pesoQuatro: double.parse(_peso4!),
        pesoSeis: double.parse(_peso6!),
        pesoOito: double.parse(_peso8!),
        fioUtilizado: _fioUtilizado!,
        modeloEncomenda: _modelo!,
        tamanhoPeca: _tamanho!,
        tempoProducao: _tempoProducao!,
      );
      await datasheetRepository.createDatasheet(path, dt);
      setLoading(!isLoading);
      clear();
    } on AuthException catch (e) {
      setLoading(!isLoading);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
