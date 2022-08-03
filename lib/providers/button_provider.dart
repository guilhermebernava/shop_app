import 'package:flutter/material.dart';

class ButtonProvider with ChangeNotifier {
  bool _canClick = true;

  bool get canClick => _canClick;

  Future timeoutCanClick(int seconds) async {
    _canClick = false;
    notifyListeners();
    await Future.delayed(Duration(seconds: seconds));
    _canClick = true;
    notifyListeners();
  }
}
