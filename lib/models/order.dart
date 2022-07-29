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
    required this.id,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return {
      "total": total,
      'dateOrder': dateOrder,
      'items': items,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    final mapItems = map['items'];
    final List<CartModel> listItems = [];

    for (var map in mapItems) {
      listItems.add(CartModel.fromMap(map));
    }

    return Order(
      id: map['id'],
      total: map['total'],
      items: listItems,
      map['dateOrder'],
    );
  }

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}
