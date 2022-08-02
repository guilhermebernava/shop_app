import 'dart:convert';
import 'cart.dart';

class Order {
  final double total;
  final String id;
  final List<CartModel> items;
  final DateTime dateOrder;
  final String userId;

  Order(
    this.dateOrder, {
    required this.userId,
    required this.total,
    this.id = '-1',
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return {
      "total": total,
      'dateOrder': dateOrder.toString(),
      'items': items,
      'userId': userId,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map, String id) {
    final mapItems = map['items'];
    final List<CartModel> listItems = [];
    final date = DateTime.parse(map['dateOrder']);

    for (var body in mapItems) {
      final map = json.decode(body);
      listItems.add(
        CartModel.fromMap(map),
      );
    }

    return Order(
      date,
      id: id,
      total: map['total'],
      userId: map['userId'],
      items: listItems,
    );
  }

  String toJson() => json.encode(toMap());
}
