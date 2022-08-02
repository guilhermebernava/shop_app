import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  String token = '';
  String userId = '';
  String experiedTime = '';

  Future<String> login(String email, String password) async {
    try {
      final credentials =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credentials.user == null) {
        return 'No User Found';
      }

      final user = credentials.user!;

      token = await user.getIdToken();
      userId = user.uid;
      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  Future<String> singUp(String email, String password) async {
    try {
      final credentials =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credentials.user == null) {
        return 'No User Found';
      }

      final user = credentials.user!;

      token = await user.getIdToken();
      userId = user.uid;
      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }
}
