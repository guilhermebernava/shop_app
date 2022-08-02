import 'dart:convert';

class CartModel {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final String userId;
  int quantity;

  CartModel({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.userId,
    this.quantity = 1,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      "title": title,
      'price': price,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'userId': userId,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'],
      title: map['title'],
      price: map['price'],
      imageUrl: map['imageUrl'],
      quantity: map['quantity'],
      userId: map['userId'],
    );
  }

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}
