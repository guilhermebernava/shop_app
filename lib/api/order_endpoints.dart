import 'dart:convert';
import '../models/order.dart';
import 'api.dart';

class OrderEndpoints {
  final api = Api();
  static const endpoint = 'orders';
  static const format = '.json';

  Future<String> createOrder(Order order, String token) async {
    try {
      var response = await api.post(
        '$endpoint$format?auth=$token',
        order.toJson(),
      );

      if (response.statusCode != 200) {
        throw Error();
      }

      final body = json.decode(response.body);
      return body['name'];
    } catch (e) {
      return 'error';
    }
  }

  Future<List<Order>> orders(String token) async {
    try {
      var response = await api.get(
        '$endpoint$format?auth=$token',
      );

      if (response.body == 'null') return [];

      Map<String, dynamic> body = json.decode(response.body);
      List<Order> orders = [];

      body.forEach(
        (key, order) => orders.add(
          Order.fromMap(order, key),
        ),
      );

      Future.delayed(const Duration(seconds: 2));

      return orders;
    } catch (e) {
      return [];
    }
  }
}
