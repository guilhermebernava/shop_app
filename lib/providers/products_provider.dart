import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

class ProductsProvider with ChangeNotifier {
  final List<ProductModel> _products = [
    ProductModel(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    ProductModel(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    ProductModel(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    ProductModel(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  bool _showFavorites = false;

  void showFavorites() {
    _showFavorites = true;
    notifyListeners();
  }

  void hideFavorites() {
    _showFavorites = false;
    notifyListeners();
  }

  List<ProductModel> get productsOrFavorites {
    if (_showFavorites) {
      final res = _products.where((element) => element.isFavorite).toList();
      return res;
    }
    return [..._products];
  }

  List<ProductModel> get products => [..._products];

  ProductModel productById(String id) => _products.firstWhere(
        (element) => element.id == id,
        orElse: () => _products.first,
      );

  void add(ProductModel model) {
    _products.add(model);
    notifyListeners();
  }

  void removeByItem(ProductModel model) {
    _products.remove(model);
    notifyListeners();
  }

  void favoriteProduct(String id) {
    final product = productById(id);
    product.isFavorite = !product.isFavorite;
    notifyListeners();
  }
}
