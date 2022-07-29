import 'dart:convert';
import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  String id;
  String title;
  String description;
  String imageUrl;
  double price;
  bool isFavorite;

  ProductModel({
    this.id = '-1',
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.isFavorite = false,
  });

  void favoriteProduct() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      price: map['price'],
      isFavorite: map['isFavorite'],
    );
  }

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}
