// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datasheet_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DatasheetViewModel on _DatasheetViewModelBase, Store {
  Computed<String?>? _$modeloComputed;

  @override
  String? get modelo =>
      (_$modeloComputed ??= Computed<String?>(() => super.modelo,
              name: '_DatasheetViewModelBase.modelo'))
          .value;
  Computed<String?>? _$fioUtilizadoComputed;

  @override
  String? get fioUtilizado =>
      (_$fioUtilizadoComputed ??= Computed<String?>(() => super.fioUtilizado,
              name: '_DatasheetViewModelBase.fioUtilizado'))
          .value;
  Computed<String?>? _$tempoProducaoComputed;

  @override
  String? get tempoProducao =>
      (_$tempoProducaoComputed ??= Computed<String?>(() => super.tempoProducao,
              name: '_DatasheetViewModelBase.tempoProducao'))
          .value;
  Computed<String?>? _$tamanhoComputed;

  @override
  String? get tamanho =>
      (_$tamanhoComputed ??= Computed<String?>(() => super.tamanho,
              name: '_DatasheetViewModelBase.tamanho'))
          .value;
  Computed<String?>? _$precoFioComputed;

  @override
  String? get precoFio =>
      (_$precoFioComputed ??= Computed<String?>(() => super.precoFio,
              name: '_DatasheetViewModelBase.precoFio'))
          .value;
  Computed<String?>? _$precoEncomendaComputed;

  @override
  String? get precoEncomenda => (_$precoEncomendaComputed ??= Computed<String?>(
          () => super.precoEncomenda,
          name: '_DatasheetViewModelBase.precoEncomenda'))
      .value;
  Computed<String?>? _$peso1Computed;

  @override
  String? get peso1 => (_$peso1Computed ??= Computed<String?>(() => super.peso1,
          name: '_DatasheetViewModelBase.peso1'))
      .value;
  Computed<String?>? _$peso4Computed;

  @override
  String? get peso4 => (_$peso4Computed ??= Computed<String?>(() => super.peso4,
          name: '_DatasheetViewModelBase.peso4'))
      .value;
  Computed<String?>? _$peso6Computed;

  @override
  String? get peso6 => (_$peso6Computed ??= Computed<String?>(() => super.peso6,
          name: '_DatasheetViewModelBase.peso6'))
      .value;
  Computed<String?>? _$peso8Computed;

  @override
  String? get peso8 => (_$peso8Computed ??= Computed<String?>(() => super.peso8,
          name: '_DatasheetViewModelBase.peso8'))
      .value;
  Computed<bool?>? _$loadingComputed;

  @override
  bool? get loading =>
      (_$loadingComputed ??= Computed<bool?>(() => super.loading,
              name: '_DatasheetViewModelBase.loading'))
          .value;

  late final _$_modeloAtom =
      Atom(name: '_DatasheetViewModelBase._modelo', context: context);

  @override
  String? get _modelo {
    _$_modeloAtom.reportRead();
    return super._modelo;
  }

  @override
  set _modelo(String? value) {
    _$_modeloAtom.reportWrite(value, super._modelo, () {
      super._modelo = value;
    });
  }

  late final _$modeloControllerAtom =
      Atom(name: '_DatasheetViewModelBase.modeloController', context: context);

  @override
  TextEditingController get modeloController {
    _$modeloControllerAtom.reportRead();
    return super.modeloController;
  }

  @override
  set modeloController(TextEditingController value) {
    _$modeloControllerAtom.reportWrite(value, super.modeloController, () {
      super.modeloController = value;
    });
  }

  late final _$_fioUtilizadoAtom =
      Atom(name: '_DatasheetViewModelBase._fioUtilizado', context: context);

  @override
  String? get _fioUtilizado {
    _$_fioUtilizadoAtom.reportRead();
    return super._fioUtilizado;
  }

  @override
  set _fioUtilizado(String? value) {
    _$_fioUtilizadoAtom.reportWrite(value, super._fioUtilizado, () {
      super._fioUtilizado = value;
    });
  }

  late final _$fioUtilizadoControllerAtom = Atom(
      name: '_DatasheetViewModelBase.fioUtilizadoController', context: context);

  @override
  TextEditingController get fioUtilizadoController {
    _$fioUtilizadoControllerAtom.reportRead();
    return super.fioUtilizadoController;
  }

  @override
  set fioUtilizadoController(TextEditingController value) {
    _$fioUtilizadoControllerAtom
        .reportWrite(value, super.fioUtilizadoController, () {
      super.fioUtilizadoController = value;
    });
  }

  late final _$_tempoProducaoAtom =
      Atom(name: '_DatasheetViewModelBase._tempoProducao', context: context);

  @override
  String? get _tempoProducao {
    _$_tempoProducaoAtom.reportRead();
    return super._tempoProducao;
  }

  @override
  set _tempoProducao(String? value) {
    _$_tempoProducaoAtom.reportWrite(value, super._tempoProducao, () {
      super._tempoProducao = value;
    });
  }

  late final _$tempoProducaoControllerAtom = Atom(
      name: '_DatasheetViewModelBase.tempoProducaoController',
      context: context);

  @override
  TextEditingController get tempoProducaoController {
    _$tempoProducaoControllerAtom.reportRead();
    return super.tempoProducaoController;
  }

  @override
  set tempoProducaoController(TextEditingController value) {
    _$tempoProducaoControllerAtom
        .reportWrite(value, super.tempoProducaoController, () {
      super.tempoProducaoController = value;
    });
  }

  late final _$_tamanhoAtom =
      Atom(name: '_DatasheetViewModelBase._tamanho', context: context);

  @override
  String? get _tamanho {
    _$_tamanhoAtom.reportRead();
    return super._tamanho;
  }

  @override
  set _tamanho(String? value) {
    _$_tamanhoAtom.reportWrite(value, super._tamanho, () {
      super._tamanho = value;
    });
  }

  late final _$tamanhoControllerAtom =
      Atom(name: '_DatasheetViewModelBase.tamanhoController', context: context);

  @override
  TextEditingController get tamanhoController {
    _$tamanhoControllerAtom.reportRead();
    return super.tamanhoController;
  }

  @override
  set tamanhoController(TextEditingController value) {
    _$tamanhoControllerAtom.reportWrite(value, super.tamanhoController, () {
      super.tamanhoController = value;
    });
  }

  late final _$_precoFioAtom =
      Atom(name: '_DatasheetViewModelBase._precoFio', context: context);

  @override
  String? get _precoFio {
    _$_precoFioAtom.reportRead();
    return super._precoFio;
  }

  @override
  set _precoFio(String? value) {
    _$_precoFioAtom.reportWrite(value, super._precoFio, () {
      super._precoFio = value;
    });
  }

  late final _$precoFioControllerAtom = Atom(
      name: '_DatasheetViewModelBase.precoFioController', context: context);

  @override
  TextEditingController get precoFioController {
    _$precoFioControllerAtom.reportRead();
    return super.precoFioController;
  }

  @override
  set precoFioController(TextEditingController value) {
    _$precoFioControllerAtom.reportWrite(value, super.precoFioController, () {
      super.precoFioController = value;
    });
  }

  late final _$_precoEncomendaAtom =
      Atom(name: '_DatasheetViewModelBase._precoEncomenda', context: context);

  @override
  String? get _precoEncomenda {
    _$_precoEncomendaAtom.reportRead();
    return super._precoEncomenda;
  }

  @override
  set _precoEncomenda(String? value) {
    _$_precoEncomendaAtom.reportWrite(value, super._precoEncomenda, () {
      super._precoEncomenda = value;
    });
  }

  late final _$precoEncomendaControllerAtom = Atom(
      name: '_DatasheetViewModelBase.precoEncomendaController',
      context: context);

  @override
  TextEditingController get precoEncomendaController {
    _$precoEncomendaControllerAtom.reportRead();
    return super.precoEncomendaController;
  }

  @override
  set precoEncomendaController(TextEditingController value) {
    _$precoEncomendaControllerAtom
        .reportWrite(value, super.precoEncomendaController, () {
      super.precoEncomendaController = value;
    });
  }

  late final _$_peso1Atom =
      Atom(name: '_DatasheetViewModelBase._peso1', context: context);

  @override
  String? get _peso1 {
    _$_peso1Atom.reportRead();
    return super._peso1;
  }

  @override
  set _peso1(String? value) {
    _$_peso1Atom.reportWrite(value, super._peso1, () {
      super._peso1 = value;
    });
  }

  late final _$peso1ControllerAtom =
      Atom(name: '_DatasheetViewModelBase.peso1Controller', context: context);

  @override
  TextEditingController get peso1Controller {
    _$peso1ControllerAtom.reportRead();
    return super.peso1Controller;
  }

  @override
  set peso1Controller(TextEditingController value) {
    _$peso1ControllerAtom.reportWrite(value, super.peso1Controller, () {
      super.peso1Controller = value;
    });
  }

  late final _$_peso4Atom =
      Atom(name: '_DatasheetViewModelBase._peso4', context: context);

  @override
  String? get _peso4 {
    _$_peso4Atom.reportRead();
    return super._peso4;
  }

  @override
  set _peso4(String? value) {
    _$_peso4Atom.reportWrite(value, super._peso4, () {
      super._peso4 = value;
    });
  }

  late final _$peso4ControllerAtom =
      Atom(name: '_DatasheetViewModelBase.peso4Controller', context: context);

  @override
  TextEditingController get peso4Controller {
    _$peso4ControllerAtom.reportRead();
    return super.peso4Controller;
  }

  @override
  set peso4Controller(TextEditingController value) {
    _$peso4ControllerAtom.reportWrite(value, super.peso4Controller, () {
      super.peso4Controller = value;
    });
  }

  late final _$_peso6Atom =
      Atom(name: '_DatasheetViewModelBase._peso6', context: context);

  @override
  String? get _peso6 {
    _$_peso6Atom.reportRead();
    return super._peso6;
  }

  @override
  set _peso6(String? value) {
    _$_peso6Atom.reportWrite(value, super._peso6, () {
      super._peso6 = value;
    });
  }

  late final _$peso6ControllerAtom =
      Atom(name: '_DatasheetViewModelBase.peso6Controller', context: context);

  @override
  TextEditingController get peso6Controller {
    _$peso6ControllerAtom.reportRead();
    return super.peso6Controller;
  }

  @override
  set peso6Controller(TextEditingController value) {
    _$peso6ControllerAtom.reportWrite(value, super.peso6Controller, () {
      super.peso6Controller = value;
    });
  }

  late final _$_peso8Atom =
      Atom(name: '_DatasheetViewModelBase._peso8', context: context);

  @override
  String? get _peso8 {
    _$_peso8Atom.reportRead();
    return super._peso8;
  }

  @override
  set _peso8(String? value) {
    _$_peso8Atom.reportWrite(value, super._peso8, () {
      super._peso8 = value;
    });
  }

  late final _$peso8ControllerAtom =
      Atom(name: '_DatasheetViewModelBase.peso8Controller', context: context);

  @override
  TextEditingController get peso8Controller {
    _$peso8ControllerAtom.reportRead();
    return super.peso8Controller;
  }

  @override
  set peso8Controller(TextEditingController value) {
    _$peso8ControllerAtom.reportWrite(value, super.peso8Controller, () {
      super.peso8Controller = value;
    });
  }

  late final _$_loadingAtom =
      Atom(name: '_DatasheetViewModelBase._loading', context: context);

  @override
  bool? get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool? value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  late final _$createDatasheetAsyncAction =
      AsyncAction('_DatasheetViewModelBase.createDatasheet', context: context);

  @override
  Future<void> createDatasheet(BuildContext context, String path,
      {bool isLoading = true}) {
    return _$createDatasheetAsyncAction
        .run(() => super.createDatasheet(context, path, isLoading: isLoading));
  }

  late final _$_DatasheetViewModelBaseActionController =
      ActionController(name: '_DatasheetViewModelBase', context: context);

  @override
  void setModelo(String? value) {
    final _$actionInfo = _$_DatasheetViewModelBaseActionController.startAction(
        name: '_DatasheetViewModelBase.setModelo');
    try {
      return super.setModelo(value);
    } finally {
      _$_DatasheetViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFioUtilizado(String? value) {
    final _$actionInfo = _$_DatasheetViewModelBaseActionController.startAction(
        name: '_DatasheetViewModelBase.setFioUtilizado');
    try {
      return super.setFioUtilizado(value);
    } finally {
      _$_DatasheetViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTempoProducao(String? value) {
    final _$actionInfo = _$_DatasheetViewModelBaseActionController.startAction(
        name: '_DatasheetViewModelBase.setTempoProducao');
    try {
      return super.setTempoProducao(value);
    } finally {
      _$_DatasheetViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTamanho(String? value) {
    final _$actionInfo = _$_DatasheetViewModelBaseActionController.startAction(
        name: '_DatasheetViewModelBase.setTamanho');
    try {
      return super.setTamanho(value);
    } finally {
      _$_DatasheetViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrecoFio(String? value) {
    final _$actionInfo = _$_DatasheetViewModelBaseActionController.startAction(
        name: '_DatasheetViewModelBase.setPrecoFio');
    try {
      return super.setPrecoFio(value);
    } finally {
      _$_DatasheetViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrecoEncomenda(String? value) {
    final _$actionInfo = _$_DatasheetViewModelBaseActionController.startAction(
        name: '_DatasheetViewModelBase.setPrecoEncomenda');
    try {
      return super.setPrecoEncomenda(value);
    } finally {
      _$_DatasheetViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPeso1(String? value) {
    final _$actionInfo = _$_DatasheetViewModelBaseActionController.startAction(
        name: '_DatasheetViewModelBase.setPeso1');
    try {
      return super.setPeso1(value);
    } finally {
      _$_DatasheetViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPeso4(String? value) {
    final _$actionInfo = _$_DatasheetViewModelBaseActionController.startAction(
        name: '_DatasheetViewModelBase.setPeso4');
    try {
      return super.setPeso4(value);
    } finally {
      _$_DatasheetViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPeso6(String? value) {
    final _$actionInfo = _$_DatasheetViewModelBaseActionController.startAction(
        name: '_DatasheetViewModelBase.setPeso6');
    try {
      return super.setPeso6(value);
    } finally {
      _$_DatasheetViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPeso8(String? value) {
    final _$actionInfo = _$_DatasheetViewModelBaseActionController.startAction(
        name: '_DatasheetViewModelBase.setPeso8');
    try {
      return super.setPeso8(value);
    } finally {
      _$_DatasheetViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool? value) {
    final _$actionInfo = _$_DatasheetViewModelBaseActionController.startAction(
        name: '_DatasheetViewModelBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_DatasheetViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
modeloController: ${modeloController},
fioUtilizadoController: ${fioUtilizadoController},
tempoProducaoController: ${tempoProducaoController},
tamanhoController: ${tamanhoController},
precoFioController: ${precoFioController},
precoEncomendaController: ${precoEncomendaController},
peso1Controller: ${peso1Controller},
peso4Controller: ${peso4Controller},
peso6Controller: ${peso6Controller},
peso8Controller: ${peso8Controller},
modelo: ${modelo},
fioUtilizado: ${fioUtilizado},
tempoProducao: ${tempoProducao},
tamanho: ${tamanho},
precoFio: ${precoFio},
precoEncomenda: ${precoEncomenda},
peso1: ${peso1},
peso4: ${peso4},
peso6: ${peso6},
peso8: ${peso8},
loading: ${loading}
    ''';
  }
}
