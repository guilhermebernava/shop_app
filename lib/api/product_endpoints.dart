import 'dart:convert';
import 'package:shop_app/api/api.dart';
import 'package:shop_app/models/favorite.dart';
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

  Future<String> favoriteProduct(
      String token, String userId, String productId, String? favoriteId) async {
    if (favoriteId == null) {
      final response = await api.post(
        "favorites/$userId$format?auth=$token",
        json.encode({
          'id': productId,
          'userId': userId,
        }),
      );
      final body = json.decode(response!.body);

      return body['name'];
    } else {
      await api.delete(
        "favorites/$userId/$favoriteId$format?auth=$token",
        json.encode({
          'id': productId,
          'userId': userId,
        }),
      );
      return 'deleted';
    }
  }

  Future<List<FavoriteModel>?> getFavoritesByUser(
      String token, String userId) async {
    final response = await api.get("favorites/$userId$format?auth=$token");

    if (response == null) {
      return [];
    }

    if (response.statusCode == 401) {
      return null;
    }

    if (response.body == 'null') {
      return [];
    }

    Map<String, dynamic> body = json.decode(response.body);

    final List<FavoriteModel> result = [];

    body.forEach((key, value) => {
          result.add(
            FavoriteModel(
              id: value['id'],
              userId: value['userId'],
            ),
          )
        });

    return result;
  }

  Future<String> deleteProduct(
      ProductModel product, String token, String userId) async {
    final response = await api.delete(
      "$endpoint/$userId/${product.id}$format?auth=$token",
      product.toJson(),
    );

    return HttpServices.validateResponse(response);
  }

  Future<List<ProductModel>?> getAllProducts(String token) async {
    var response = await api.get(
      '$endpoint$format?auth=$token',
    );

    String isSucess = HttpServices.validateResponse(response);
    if (isSucess != 'success') {
      return null;
    }

    if (response!.body == 'null') return [];

    Map<String, dynamic> body = json.decode(response.body);
    List<ProductModel> products = [];

    body.forEach((key, list) {
      list.forEach((key, product) {
        products.add(
          ProductModel.fromMap(product, key),
        );
      });
    });

    Future.delayed(const Duration(seconds: 2));

    return products;
  }
}

class ProductResponse {
  final String id;
  final ProductModel product;

  ProductResponse(this.id, this.product);
}
