import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import '../../exceptions/exceptions.dart';
import '../../models/models.dart';

class DatasheetRepository extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Uuid uuid = Uuid();
  createDatasheet() async {
    try {
      final docUser = _db
          .collection('users/')
          .doc('${_auth.currentUser!.uid}')
          .collection('datasheets')
          .doc(uuid.v4());

      final datasheet = DatasheetModel(
        uid: docUser.id,
        precoEncomenda: 100,
        precoFio: 120,
        pesoUm: 50.5,
        pesoQuatro: 50.5,
        pesoSeis: 50.5,
        pesoOito: 50.5,
        fioUtilizado: 'Fio testeeeee',
        modeloEncomenda: 'Modelo Teste',
        tamanhoPeca: '512x810',
        tempoProducao: '6 Horas',
      );
      final json = datasheet.toJson();

      await docUser.set(json);
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

  editDatasheet(String uid, Map<String, dynamic> data) async {
    try {
      final docUser = FirebaseFirestore.instance
          .collection('users')
          .doc('${_auth.currentUser!.uid}')
          .collection('datasheets')
          .doc(uid);
      docUser.update(data);
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message!);
    }
  }

  deleteDatasheet(String uid) async {
    try {
      final docUser = FirebaseFirestore.instance
          .collection('users')
          .doc('${_auth.currentUser!.uid}')
          .collection('datasheets')
          .doc(uid);
      docUser.delete();
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message!);
    }
  }
}
