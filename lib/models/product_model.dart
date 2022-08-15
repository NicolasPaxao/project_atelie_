class ProductModel {
  final double quantidade;
  final String descricao;
  final double valorUnit;
  final double valorTotal;

  ProductModel({
    required this.quantidade,
    required this.descricao,
    required this.valorUnit,
    required this.valorTotal,
  });

  static ProductModel fromJson(Map<String, dynamic> json) => ProductModel(
      quantidade: json['quantidade'],
      descricao: json['descricao'],
      valorUnit: json['valorUnit'],
      valorTotal: json['valorTotaL']);

  Map<String, dynamic> toJson() => {
        'quantidade': quantidade,
        'descricao': descricao,
        'valorUnit': valorUnit,
        'valorTotal': valorTotal
      };
}
