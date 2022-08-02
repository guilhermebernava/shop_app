import 'dart:convert';
import 'package:shop_app/api/api.dart';
import 'package:shop_app/models/product.dart';
import '../services/http_services.dart';

class ProductEndpoints {
  final api = Api();
  static const endpoint = 'products';
  static const format = '.json';

  Future<String> createProduct(
      ProductModel product, String token, String userId) async {
    var response = await api.post(
      '$endpoint/$userId$format?auth=$token',
      product.toJson(),
    );

    String isSucess = HttpServices.validateResponse(response);
    if (isSucess != 'success') {
      return isSucess;
    }

    final body = json.decode(response!.body);

    return body['name'];
  }

  Future<String> updateProduct(
      ProductModel product, String token, String userId) async {
    final response = await api.put(
      "$endpoint/$userId/${product.id}$format?auth=$token",
      product.toJson(),
    );

    return HttpServices.validateResponse(response);
  }

  Future<String> deleteProduct(
      ProductModel product, String token, String userId) async {
    final response = await api.delete(
      "$endpoint/$userId/${product.id}$format?auth=$token",
      product.toJson(),
    );

    return HttpServices.validateResponse(response);
  }

  Future<List<ProductModel>?> getAllProducts(
      String token, String userId) async {
    var response = await api.get(
      '$endpoint/$userId$format?auth=$token',
    );

    String isSucess = HttpServices.validateResponse(response);
    if (isSucess != 'success') {
      return null;
    }

    if (response!.body == 'null') return [];

    Map<String, dynamic> body = json.decode(response.body);
    List<ProductModel> products = [];

    body.forEach(
      (key, product) => products.add(
        ProductModel.fromMap(product, key),
      ),
    );

    Future.delayed(const Duration(seconds: 2));

    return products;
  }
}

class ProductResponse {
  final String id;
  final ProductModel product;

  ProductResponse(this.id, this.product);
}
