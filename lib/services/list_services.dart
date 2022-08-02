import 'package:shop_app/models/product.dart';

class ListServices {
  static ProductModel firstProduct(
      List<ProductModel> list, ProductModel model) {
    return list.firstWhere(
      (element) => model.id == element.id,
      orElse: () => ProductModel(
        title: '',
        description: '',
        imageUrl: '',
        price: 0,
        userId: '',
      ),
    );
  }
}
