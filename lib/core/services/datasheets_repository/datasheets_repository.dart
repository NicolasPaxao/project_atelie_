import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import '../../../models/models.dart';
import '../../exceptions/exceptions.dart';

class DatasheetRepository extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> upload(String path, String uuid) async {
    File file = File(path);
    try {
      String ref = 'images/img-${uuid.toString()}.jpg';
      await storage.ref(ref).putFile(file);
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload: ${e.code}');
    }
  }

  createDatasheet(String path, DatasheetModel datasheetModel) async {
    try {
      final docUser = _db
          .collection('users/')
          .doc('${_auth.currentUser!.uid}')
          .collection('datasheets')
          .doc(datasheetModel.uid);

      final datasheet = datasheetModel;
      final json = datasheet.toJson();
      upload(path, docUser.id);
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
