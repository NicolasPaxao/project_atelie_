class DatasheetModel {
  final double precoEncomenda;
  final double precoFio;
  final double pesoUm;
  final double pesoQuatro;
  final double pesoSeis;
  final double pesoOito;
  final String fioUtilizado;
  final String modeloEncomenda;
  final String tamanhoPeca;
  final String tempoProducao;

  DatasheetModel({
    required this.precoEncomenda,
    required this.precoFio,
    required this.pesoUm,
    required this.pesoQuatro,
    required this.pesoSeis,
    required this.pesoOito,
    required this.fioUtilizado,
    required this.modeloEncomenda,
    required this.tamanhoPeca,
    required this.tempoProducao,
  });

  static DatasheetModel fromJson(Map<String, dynamic> json) => DatasheetModel(
        precoEncomenda: json['precoEncomenda'],
        precoFio: json['precoFio'],
        pesoUm: json['pesoUm'],
        pesoQuatro: json['pesoQuatro'],
        pesoSeis: json['pesoSeis'],
        pesoOito: json['pesoOito'],
        fioUtilizado: json['fioUtilizado'],
        modeloEncomenda: json['modeloEncomenda'],
        tamanhoPeca: json['tamanhoPeca'],
        tempoProducao: json['tempoProducao'],
      );

  Map<String, dynamic> toJson() => {
        'precoEncomenda': precoEncomenda,
        'precoFio': precoFio,
        'pesoUm': pesoUm,
        'pesoQuatro': pesoQuatro,
        'pesoSeis': pesoSeis,
        'pesoOito': pesoOito,
        'fioUtilizado': fioUtilizado,
        'modeloEncomenda': modeloEncomenda,
        'tamanhoPeca': tamanhoPeca,
        'tempoProducao': tempoProducao,
      };
}
