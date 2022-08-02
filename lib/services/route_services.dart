import 'package:flutter/material.dart';

class RouteServices {
  static void redirectNoReturn(bool valid, String route, BuildContext context) {
    if (valid) {
      Navigator.pushReplacementNamed(context, route);
    }
    return;
  }

  static void redirect(bool valid, String route, BuildContext context) {
    if (valid) {
      Navigator.pushNamed(context, route);
    }
    return;
  }
}
