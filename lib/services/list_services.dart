import 'package:shop_app/models/favorite.dart';
import 'package:shop_app/models/product.dart';

class ListServices {
  static ProductModel firstProduct(
      List<ProductModel> list, ProductModel model) {
    return list.firstWhere(
      (element) => model.id == element.id && model.userId == element.userId,
      orElse: () => ProductModel(
        title: '',
        description: '',
        imageUrl: '',
        price: 0,
        userId: '',
      ),
    );
  }

  static FavoriteModel firstFavorite(
      List<FavoriteModel> list, String id, String userId) {
    return list.firstWhere(
      (element) =>id == element.id && userId == element.userId,
      orElse: () => FavoriteModel(
        id: '',
        userId: '',
      ),
    );
  }
}
