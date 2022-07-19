import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  String imageUrl;
  double price;
  bool isFavorite;

  ProductModel({
    required this.id,
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
}
