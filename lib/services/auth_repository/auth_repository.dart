import 'package:atelie/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../exceptions/exceptions.dart';

class AuthRepository extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;
  User? user;
  bool isLoading = true;

  AuthRepository() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((u) {
      user = (u == null) ? null : u;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    user = _auth.currentUser;
    notifyListeners();
  }

  //Registrar
  signUp(String name, String email, String password) async {
    try {
      final userRef = _db.collection('users');
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final signedInUser = userCredential.user!;
      final user = UserModel(
          id: signedInUser.uid,
          name: name,
          email: email,
          password: password,
          datasheets: [],
          orders: []);
      final userToJson = user.toJson();
      await userRef.doc(signedInUser.uid).set(userToJson);

      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException(message: 'Insira uma senha mais forte');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException(message: 'Este e-mail já possui conta registrada!');
      }
    }
  }

  //Entrar
  signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException(message: 'Usuário com este e-mail não encontrado!');
      } else if (e.code == 'wrong-password') {
        throw AuthException(message: 'Senha incorreta para este usuário!');
      }
    }
  }

  //Sair
  signOut() async {
    await _auth.signOut();
    _getUser();
  }
}
