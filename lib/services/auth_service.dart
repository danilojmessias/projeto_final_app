import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }
  _authCheck() {
    log('check');
    auth.authStateChanges().listen(
      (User? user) {
        usuario = (user == null) ? null : user;
        isLoading = false;
        notifyListeners();
      },
    );
  }

  _getUser() {
    usuario = auth.currentUser;
    notifyListeners();
  }

  registrar(String email, String senha) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: senha);

      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('A senha é fraca');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Email já está cadastrado');
      }
    }
  }

  login(String email, String senha) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Email não encontrado.');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha Incorreta');
      }
    }
  }

  logout() async {
    await auth.signOut();
    _getUser();
    log('sign out');
  }
}
