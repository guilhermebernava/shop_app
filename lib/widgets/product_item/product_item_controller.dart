import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/services/snackbar_services.dart';
import '../../models/cart.dart';
import '../../models/product.dart';
import '../../providers/cart_provider.dart';
import '../../screens/product_detail/product_detail.dart';

class ProductItemController {
  final String id;

  ProductItemController(this.id);

  void addToCart(BuildContext context, ProductModel model) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addItem(
      CartModel(
        id: model.id,
        title: model.title,
        price: model.price,
        imageUrl: model.imageUrl,
      ),
    );

    SnackbarServices.showSnackbar(context, 'Added to cart sucessefully!');
  }

  void redirect(BuildContext context) {
    Navigator.pushNamed(
      context,
      ProductDetail.route,
      arguments: id,
    );
  }
}
