import 'package:flutter/material.dart';

class ProductDetailProvider with ChangeNotifier {
  final List<bool> _isOpen = [false];

  List<bool> get isOpen => [..._isOpen];

  bool elementAtIndex(int index) => _isOpen.elementAt(index);

  void openByIndex(int index) {
    var element = elementAtIndex(index);
    element = !element;
    _isOpen.insert(index, element);
    notifyListeners();
  }
}
