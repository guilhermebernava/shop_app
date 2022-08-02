import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/services/http_services.dart';
import 'package:shop_app/services/internal_storage_services.dart';
import 'package:shop_app/services/list_services.dart';
import '../api/product_endpoints.dart';

class ProductsProvider with ChangeNotifier {
  final productEndpoints = ProductEndpoints();
  final List<ProductModel> _products = [];
  final List<ProductModel> _userProducts = [];
  final List<String> _favoritesIds = [];

  String _token = '';
  String _userId = '';

  String get userId => _userId;

  void update(String token, String userId) {
    _token = token;
    _userId = userId;
  }

  bool _showFavorites = false;

  bool isFavoriteProduct(String id) {
    final result = _favoritesIds.firstWhere((element) => element == id,
        orElse: () => 'empty');

    if (result == 'empty') return false;

    return true;
  }

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
      final res = _products
          .where((element) => _favoritesIds.contains(element.id))
          .toList();
      return res;
    }
    return [..._products];
  }

  List<ProductModel> get userProducts => [..._userProducts];

  List<ProductModel> get products => [..._products];

  ProductModel productById(String id, String userId) => _products.firstWhere(
        (element) => element.id == id && element.userId == userId,
        orElse: () => _products.first,
      );

  Future getProducts() async {
    final list = await productEndpoints.getAllProducts(_token);
    final favorites =
        await productEndpoints.getFavoritesByUser(_token, _userId);

    if (list == null || favorites == null) {
      InternalStorageServices.cleanUser();
      return;
    }

    for (var product in _products) {
      list.removeWhere((element) => element.id == product.id);
    }

    for (var product in list) {
      if (product.userId == _userId) {
        _userProducts.add(product);
      }
    }

    _favoritesIds.addAll(favorites);
    _products.addAll(list);
    notifyListeners();
  }

  Future<bool> addOrUpdate(ProductModel model, BuildContext context) {
    final existProduct = ListServices.firstProduct(_products, model);

    if (existProduct.id == '-1') {
      return productEndpoints.createProduct(model, _token, _userId).then((id) {
        final valid = HttpServices.validate(id, context);
        if (!valid) {
          return false;
        }

        _products.add(ProductModel(
          id: id,
          title: model.title,
          description: model.description,
          imageUrl: model.imageUrl,
          price: model.price,
          userId: _userId,
        ));
        _updateUserProducts(model, id);
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
        userId: _userId,
      ),
      _token,
      _userId,
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
      _updateUserProducts(model, id);
      return true;
    });
  }

  void removeByItem(ProductModel model) {
    productEndpoints
        .deleteProduct(
      model,
      _token,
      _userId,
    )
        .then((value) {
      _products.remove(model);
      _userProducts.remove(model);
      notifyListeners();
    });
  }

  void favoriteProduct(String id, String userId) {
    final product = productById(id, userId);
    product.isFavorite = !product.isFavorite;

    if (product.isFavorite == false) {
      _favoritesIds.remove(product.id);
      notifyListeners();
    } else {
      _favoritesIds.add(product.id);
      notifyListeners();
    }

    productEndpoints
        .favoriteProduct(
      _token,
      _userId,
      product.id,
      product.isFavorite,
    )
        .then((value) {
      notifyListeners();
    });
  }

  void _updateUserProducts(ProductModel model, String id) {
    final existProduct = ListServices.firstProduct(_userProducts, model);
    if (existProduct.id == '-1') {
      _products.add(ProductModel(
        id: id,
        title: model.title,
        description: model.description,
        imageUrl: model.imageUrl,
        price: model.price,
        userId: _userId,
      ));
      notifyListeners();
      return;
    }

    existProduct.description = model.description;
    existProduct.price = model.price;
    existProduct.imageUrl = model.imageUrl;
    existProduct.title = model.title;
    notifyListeners();
    return;
  }
}
