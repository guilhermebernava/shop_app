import 'package:flutter/material.dart';
import '../../screens/product_detail/product_detail.dart';

class ProductItemController {
  final String id;

  ProductItemController(this.id);

  void redirect(BuildContext context) {
    Navigator.pushNamed(
      context,
      ProductDetail.route,
      arguments: id,
    );
  }
}
