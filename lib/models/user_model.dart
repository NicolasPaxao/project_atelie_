import 'package:atelie/models/datasheet_model.dart';
import 'package:atelie/models/order_model.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? password;
  List<DatasheetModel>? datasheets;
  List<OrderModel>? orders;

  UserModel({
    this.id = '',
    required this.name,
    required this.email,
    required this.password,
    required this.datasheets,
    required this.orders,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    password = json['password'];

    if (json['datasheets'] != null) {
      datasheets = <DatasheetModel>[];
      json['datasheets'].forEach((v) {
        datasheets!.add(DatasheetModel.fromJson(v));
      });
    }
    if (json['orders'] != null) {
      orders = <OrderModel>[];
      json['orders'].forEach((v) {
        orders!.add(OrderModel.fromJson(json));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;

    if (this.datasheets != null) {
      data['datasheets'] = datasheets!.map((e) => e.toJson()).toList();
    }
    if (this.orders != null) {
      data['orders'] = orders!.map((e) => e.toJson()).toList();
    }

    return data;
  }
}
