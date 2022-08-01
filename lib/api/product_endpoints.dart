import 'dart:convert';
import 'package:http/http.dart';
import 'package:shop_app/api/api.dart';
import 'package:shop_app/models/product.dart';

class ProductEndpoints {
  final api = Api();
  static const endpoint = 'products';
  static const format = '.json';

  Future<String> createProduct(ProductModel product) async {
    var response = await api.post(
      endpoint + format,
      product.toJson(),
    );

    final body = json.decode(response.body);

    return body['name'];
  }

  Future<Response> updateProduct(ProductModel product) async {
    var response = await api.put(
      "$endpoint/${product.id}$format",
      product.toJson(),
    );

    return response;
  }

  Future<Response> deleteProduct(ProductModel product) async {
    var response = await api.delete(
      "$endpoint/${product.id}$format",
      product.toJson(),
    );

    return response;
  }

  Future<List<ProductModel>> getAllProducts() async {
    var response = await api.get(
      endpoint + format,
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
  }
}

class ProductResponse {
  final String id;
  final ProductModel product;

  ProductResponse(this.id, this.product);
}
