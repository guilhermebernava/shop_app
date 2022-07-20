import 'package:flutter/material.dart';
import 'package:shop_app/models/order.dart';
import 'package:uuid/uuid.dart';
import '../models/cart.dart';

class OrderProvider with ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => [..._orders];

  void addOrder(double total, List<CartModel> items) {
    _orders.add(
      Order(DateTime.now(), total: total, id: const Uuid().v1(), items: items),
    );
    notifyListeners();
  }
}
