import 'dart:convert';

class CartModel {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  int quantity;

  CartModel({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      "title": title,
      'price': price,
      'imageUrl': imageUrl,
      'quantity': quantity,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'],
      title: map['title'],
      price: map['price'],
      imageUrl: map['imageUrl'],
      quantity: map['quantity'],
    );
  }

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}
