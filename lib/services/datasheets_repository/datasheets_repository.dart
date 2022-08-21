import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../exceptions/exceptions.dart';
import '../../models/models.dart';

class DatasheetRepository extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;

  createDatasheet() async {
    try {
      final docUser =
          _db.collection('users/${_auth.currentUser!.uid}/datasheets');

      final datasheet = DatasheetModel(
        precoEncomenda: 100,
        precoFio: 120,
        pesoUm: 50.5,
        pesoQuatro: 50.5,
        pesoSeis: 50.5,
        pesoOito: 50.5,
        fioUtilizado: 'Fio teste',
        modeloEncomenda: 'Modelo Teste',
        tamanhoPeca: '512x810',
        tempoProducao: '6 Horas',
      );
      final json = datasheet.toJson();

      await docUser.add(json);
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message!);
    }
  }

  Stream<List<DatasheetModel>> readDatasheet() {
    return _db
        .collection('users/${_auth.currentUser!.uid}/datasheets')
        .snapshots()
        .map((e) =>
            e.docs.map((doc) => DatasheetModel.fromJson(doc.data())).toList());
  }
}
