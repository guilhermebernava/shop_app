import 'package:flutter/material.dart';
import 'package:shop_app/api/order_endpoints.dart';
import 'package:shop_app/models/order.dart';
import 'package:shop_app/services/http_services.dart';
import '../models/cart.dart';

class OrderProvider with ChangeNotifier {
  final orderEndpoints = OrderEndpoints();
  final List<Order> _orders = [];
  String _token = '';
  String _userId = '';

  void update(String token, String userId) {
    _token = token;
    _userId = userId;
  }

  List<Order> get orders => [..._orders];

  Order orderAtIndex(int index) => _orders.elementAt(index);

  Order orderById(String id) =>
      _orders.firstWhere((element) => element.id == id);

  int get lenght => _orders.length;

  Future getOrders() async {
    final list = await orderEndpoints.orders(_token, _userId);

    if (list == null) {
      throw Error;
    }

    for (var product in _orders) {
      list.removeWhere((element) => element.id == product.id);
    }
    _orders.addAll(list);
    notifyListeners();
  }

  Future<bool> addOrder(
      double total, List<CartModel> items, BuildContext context) async {
    final date = DateTime.now();
    return orderEndpoints
        .createOrder(
      Order(date, total: total, items: items, userId: _userId),
      _token,
      _userId,
    )
        .then((id) {
      final valid = HttpServices.validate(id, context);

      if (!valid) {
        return false;
      }

      _orders.add(
        Order(date, total: total, id: id, items: items, userId: _userId),
      );
      notifyListeners();
      return true;
    });
  }
}
