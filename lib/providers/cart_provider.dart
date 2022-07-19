import 'package:flutter/material.dart';
import 'package:shop_app/models/cart.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _items = {};

  Map<String, CartModel> get items {
    return {..._items};
  }

  int get lenght => _items.length;

  void addItem(CartModel model) {
    if (_items.containsKey(model.id)) {
      _items.update(
        model.id,
        (value) => CartModel(
          id: value.id,
          title: value.title,
          price: value.price,
          quantity: value.quantity + 1,
        ),
      );
      notifyListeners();
      return;
    }
    _items.putIfAbsent(model.id, () => model);
    notifyListeners();
  }

  void checkout() {
    _items.clear();
  }
}
