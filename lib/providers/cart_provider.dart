import 'package:flutter/material.dart';
import 'package:shop_app/models/cart.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _items = {};

  Map<String, CartModel> get items {
    return {..._items};
  }

  int get lenght => _items.length;

  double get totalValue {
    double total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  List<DropdownMenuItem<int>> selectOptionsByItem(String mapKey) {
    List<DropdownMenuItem<int>> finalList = [];
    if (_items.containsKey(mapKey)) {
      var maxQuantity = _items[mapKey]!.quantity;
      if (maxQuantity < 9) {
        maxQuantity = 9;
      }
      for (int i = maxQuantity; i >= 0; i--) {
        finalList.add(
          DropdownMenuItem<int>(
            value: i,
            child: Text('$i'),
          ),
        );
      }

      return finalList;
    }
    return [];
  }

  void clearCart() {
    _items.removeWhere(((key, value) => true));
    notifyListeners();
  }

  List<CartModel> get allItems {
    final List<CartModel> finalList = [];
    _items.forEach((key, value) {
      finalList.add(value);
    });
    return finalList;
  }

  void updateQtdByKey(String mapKey, int qtd) {
    if (_items.containsKey(mapKey)) {
      if (qtd == 0) {
        _items.remove(mapKey);
        notifyListeners();
        return;
      }

      _items.update(
        mapKey,
        (value) => CartModel(
          id: mapKey,
          title: value.title,
          price: value.price,
          quantity: qtd,
          imageUrl: value.imageUrl,
        ),
      );
      notifyListeners();
      return;
    }
  }

  void removeItem(String id) {
    if (_items.containsKey(id)) {
      _items.removeWhere((key, value) => key == id);
      notifyListeners();
    }
  }

  void addItem(CartModel model) {
    if (_items.containsKey(model.id)) {
      _items.update(
        model.id,
        (value) => CartModel(
          id: model.id,
          title: value.title,
          price: value.price,
          imageUrl: value.imageUrl,
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
