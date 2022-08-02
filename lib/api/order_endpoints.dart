import 'dart:convert';
import 'package:shop_app/services/http_services.dart';

import '../models/order.dart';
import 'api.dart';

class OrderEndpoints {
  final api = Api();
  static const endpoint = 'orders';
  static const format = '.json';

  Future<String> createOrder(Order order, String token, String userId) async {
    var response = await api.post(
      '$endpoint/$userId$format?auth=$token',
      order.toJson(),
    );
    String isSucess = HttpServices.validateResponse(response);
    if (isSucess != 'success') return isSucess;

    final body = json.decode(response!.body);
    return body['name'];
  }

  Future<List<Order>?> orders(String token, String userId) async {
    var response = await api.get(
      '$endpoint/$userId$format?auth=$token',
    );

    String isSucess = HttpServices.validateResponse(response);
    if (isSucess != 'success') {
      return null;
    }

    if (response!.body == 'null') return [];

    Map<String, dynamic> body = json.decode(response.body);
    List<Order> orders = [];

    body.forEach(
      (key, order) => orders.add(
        Order.fromMap(order, key),
      ),
    );

    Future.delayed(const Duration(seconds: 2));

    return orders;
  }
}
