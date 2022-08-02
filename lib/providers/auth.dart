import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/login/login.dart';
import 'package:shop_app/screens/products_overview/products_overview.dart';
import 'package:shop_app/services/internal_storage_services.dart';
import '../models/auth_model.dart';

class Auth with ChangeNotifier {
  final AuthModel _model;
  static const key = 'user';

  String get token => _model.token;
  String get userId => _model.userId;

  Auth(this._model);

  Widget get isAutenticated {
    if (_model.token == '' && _model.userId == '') {
      return const Login();
    }
    return const ProductsOverview();
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
      notifyListeners();

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
      notifyListeners();

      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  Future logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      await InternalStorageServices.cleanUser();
    } catch (e) {
      debugPrint(e.toString());
      return;
    }
  }
}
