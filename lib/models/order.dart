import 'dart:convert';

import 'cart.dart';

class Order {
  final double total;
  final String id;
  final List<CartModel> items;
  final DateTime dateOrder;

  Order(
    this.dateOrder, {
    required this.total,
    this.id = '-1',
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return {
      "total": total,
      'dateOrder': dateOrder.toString(),
      'items': items,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map, String id) {
    final mapItems = map['items'];
    final List<CartModel> listItems = [];
    final date = DateTime.parse(map['dateOrder']);

    for (var body in mapItems) {
      final map = json.decode(body);
      listItems.add(
        CartModel(
            id: map['id'],
            price: map['price'],
            imageUrl: map['imageUrl'],
            title: map['title'],
            quantity: map['quantity']),
      );
    }

    return Order(
      date,
      id: id,
      total: map['total'],
      items: listItems,
    );
  }

  factory Order.fromJson(String source, String id) =>
      Order.fromMap(json.decode(source), id);

  String toJson() => json.encode(toMap());
}
