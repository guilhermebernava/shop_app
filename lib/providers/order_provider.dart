import 'package:flutter/material.dart';
import 'package:shop_app/api/order_endpoints.dart';
import 'package:shop_app/models/order.dart';
import '../models/cart.dart';

class OrderProvider with ChangeNotifier {
  final orderEndpoints = OrderEndpoints();
  final List<Order> _orders = [];

  List<Order> get orders => [..._orders];

  Order orderAtIndex(int index) => _orders.elementAt(index);

  Order orderById(String id) =>
      _orders.firstWhere((element) => element.id == id);

  int get lenght => _orders.length;

  Future getOrders() async {
    final list = await orderEndpoints.orders();
    for (var product in _orders) {
      list.removeWhere((element) => element.id == product.id);
    }
    _orders.addAll(list);
    notifyListeners();
  }

  void addOrder(double total, List<CartModel> items) async {
    final date = DateTime.now();
    final id = await orderEndpoints.createOrder(
      Order(
        date,
        total: total,
        items: items,
      ),
    );
    _orders.add(
      Order(
        date,
        total: total,
        id: id,
        items: items,
      ),
    );
    notifyListeners();
  }
}
