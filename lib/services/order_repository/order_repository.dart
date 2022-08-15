import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../exceptions/exceptions.dart';
import '../../models/models.dart';

class OrderRepository extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;

  createOrder(OrderModel order) async {
    try {
      final docUser = _db.collection('users/${_auth.currentUser!.uid}/orders');
      final orderModel = order;
      final json = orderModel.toJson();

      await docUser.add(json);
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message!);
    }
  }
}
