import 'dart:convert';
import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  String id;
  String title;
  String description;
  String imageUrl;
  double price;
  bool isFavorite;
  String userId;

  ProductModel({
    this.id = '-1',
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.userId,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite,
      'userId': userId
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map, String id) {
    return ProductModel(
      id: id,
      title: map['title'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      price: map['price'],
      isFavorite: map['isFavorite'],
      userId: map['userId'],
    );
  }

  String toJson() => json.encode(toMap());
}
