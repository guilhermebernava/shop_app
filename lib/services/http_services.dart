import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shop_app/screens/login/login.dart';

class HttpServices {
  static bool validate(String res, BuildContext context) {
    if (res == 'unauthorized') {
      Navigator.pushReplacementNamed(context, Login.route);
    }
    if (res != 'error' || res != 'unauthorized') {
      return true;
    }
    return false;
  }

  static String validateResponse(Response? response) {
    if (response == null) {
      return 'error';
    }
    if (response.statusCode == 401) {
      return 'unauthorized';
    }
    return 'success';
  }
}
