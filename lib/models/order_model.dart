// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:atelie/models/models.dart';

class OrderModel {
  String? cliente;
  String? email;
  String? telefone;
  DateTime? dataEntrega;
  String? endereco;
  List<ProductModel>? produtos;
  String? anotacoes;
  double? valorTotal;
  double? valorFrete;
  bool? status;
  bool? queue;

  OrderModel({
    required this.cliente,
    required this.email,
    required this.telefone,
    required this.dataEntrega,
    required this.endereco,
    required this.produtos,
    required this.anotacoes,
    required this.valorTotal,
    required this.valorFrete,
    required this.status,
    required this.queue,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cliente'] = cliente;
    data['email'] = email;
    data['telefone'] = telefone;
    data['dataEntrega'] = dataEntrega;
    data['endereco'] = endereco;
    if (this.produtos != null) {
      data['produtos'] = produtos!.map((e) => e.toJson()).toList();
    }
    data['anotacoes'] = anotacoes;
    data['valorTotal'] = valorTotal;
    data['valorFrete'] = valorFrete;
    data['status'] = status;
    data['queue'] = queue;
    return data;
  }

  OrderModel.fromJson(Map<String, dynamic> json) {
    cliente = json['cliente'];
    email = json['email'];
    telefone = json['telefone'];
    dataEntrega = (json['dataEntrega'] as Timestamp).toDate();
    endereco = json['endereco'];
    if (json['produtos'] != null) {
      produtos = <ProductModel>[];
      json['produtos'].forEach((v) {
        produtos!.add(ProductModel.fromJson(v));
      });
    }
    anotacoes = json['anotacoes'];
    valorTotal = json['valorTotal'];
    valorFrete = json['valorFrete'];
    status = json['status'];
    queue = json['queue'];
  }
}
