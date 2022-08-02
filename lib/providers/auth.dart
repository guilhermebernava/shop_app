import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/login/login.dart';
import 'package:shop_app/services/internal_storage_services.dart';
import '../models/auth_model.dart';

class Auth with ChangeNotifier {
  final AuthModel _model;
  static const key = 'user';

  String get token => _model.token;
  String get userId => _model.userId;

  Auth(this._model);

  String get isAutenticated {
    if (_model.token == '' && _model.userId == '') {
      return Login.route;
    }
    return '/';
  }

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

      _model.token = await user.getIdToken();
      _model.userId = user.uid;

      await InternalStorageServices.setUser(_model.toJson());

      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      return 'error';
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

      _model.token = await user.getIdToken();
      _model.userId = user.uid;
      await InternalStorageServices.setUser(_model.toJson());

      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }
}
