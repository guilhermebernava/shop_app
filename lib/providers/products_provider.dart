import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/services/http_services.dart';
import 'package:shop_app/services/internal_storage_services.dart';
import 'package:shop_app/services/list_services.dart';
import '../api/product_endpoints.dart';

class ProductsProvider with ChangeNotifier {
  final productEndpoints = ProductEndpoints();
  final List<ProductModel> _products = [];
  String _token = '';

  void update(String token) {
    _token = token;
  }

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

  Future getProducts() async {
    final list = await productEndpoints.getAllProducts(_token);

    if (list == null) {
      InternalStorageServices.cleanUser();
      return;
    }

    for (var product in _products) {
      list.removeWhere((element) => element.id == product.id);
    }
    _products.addAll(list);
    notifyListeners();
  }

  Future<bool> addOrUpdate(ProductModel model, BuildContext context) {
    final existProduct = ListServices.firstProduct(_products, model);

    if (existProduct.id == '-1') {
      return productEndpoints.createProduct(model, _token).then((id) {
        final valid = HttpServices.validate(id, context);
        if (!valid) {
          return false;
        }

        _products.add(
          ProductModel(
              id: id,
              title: model.title,
              description: model.description,
              imageUrl: model.imageUrl,
              price: model.price),
        );
        notifyListeners();
        return true;
      });
    }

    return productEndpoints
        .updateProduct(
      ProductModel(
        description: model.description,
        imageUrl: model.imageUrl,
        price: model.price,
        title: model.title,
        isFavorite: model.isFavorite,
        id: existProduct.id,
      ),
      _token,
    )
        .then((id) {
      final valid = HttpServices.validate(id, context);
      if (!valid) {
        return false;
      }
      existProduct.description = model.description;
      existProduct.price = model.price;
      existProduct.imageUrl = model.imageUrl;
      existProduct.title = model.title;
      notifyListeners();
      return true;
    });
  }

  void removeByItem(ProductModel model) {
    productEndpoints.deleteProduct(model, _token).then((value) {
      _products.remove(model);
      notifyListeners();
    });
  }

  void favoriteProduct(String id) {
    final product = productById(id);
    product.isFavorite = !product.isFavorite;
    productEndpoints.updateProduct(product, _token).then((value) {
      notifyListeners();
    });
  }
}
