import 'dart:convert';
import 'package:shop_app/api/api.dart';
import 'package:shop_app/models/product.dart';

class ProductEndpoints {
  final api = Api();
  static const endpoint = 'products';
  static const format = '.json';

  Future<String> createProduct(ProductModel product, String token) async {
    try {
      var response = await api.post(
        '$endpoint$format?auth=$token',
        product.toJson(),
      );

      final body = json.decode(response.body);

      return body['name'];
    } catch (e) {
      return 'error';
    }
  }

  Future updateProduct(ProductModel product, String token) async {
    try {
      await api.put(
        "$endpoint/${product.id}$format?auth=$token",
        product.toJson(),
      );
    } catch (e) {
      return;
    }
  }

  Future deleteProduct(ProductModel product, String token) async {
    try {
      var response = await api.delete(
        "$endpoint/${product.id}$format?auth=$token",
        product.toJson(),
      );

      return response;
    } catch (e) {
      return;
    }
  }

  Future<List<ProductModel>> getAllProducts(String token) async {
    try {
      var response = await api.get(
        '$endpoint$format?auth=$token',
      );

      if (response.body == 'null') return [];

      Map<String, dynamic> body = json.decode(response.body);
      List<ProductModel> products = [];

      body.forEach(
        (key, product) => products.add(
          ProductModel.fromMap(product, key),
        ),
      );

      Future.delayed(const Duration(seconds: 2));

      return products;
    } catch (e) {
      return [];
    }
  }
}

class ProductResponse {
  final String id;
  final ProductModel product;

  ProductResponse(this.id, this.product);
}
