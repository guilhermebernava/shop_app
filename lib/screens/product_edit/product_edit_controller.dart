import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
import '../../providers/products_provider.dart';

class ProductEditController {
  final BuildContext context;
  late final ProductModel product;
  ProductEditController(this.context) {
    final id = ModalRoute.of(context)?.settings.arguments as String?;
    product = id == null
        ? ProductModel(
            id: '0',
            title: 'NEW PRODUCT',
            description: '',
            imageUrl: '',
            price: 0,
          )
        : Provider.of<ProductsProvider>(
            context,
            listen: false,
          ).productById(id);
  }
}
