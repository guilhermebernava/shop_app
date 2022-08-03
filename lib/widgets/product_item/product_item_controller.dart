import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/services/snackbar_services.dart';
import 'package:shop_app/widgets/product_item/models/product_item_args.dart';
import '../../models/cart.dart';
import '../../models/product.dart';
import '../../providers/cart_provider.dart';
import '../../screens/product_detail/product_detail.dart';

class ProductItemController {
  final String id;
  final String userId;

  ProductItemController(this.id, this.userId);

  void addToCart(BuildContext context, ProductModel model) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addItem(
      CartModel(
        id: model.id,
        title: model.title,
        price: model.price,
        imageUrl: model.imageUrl,
        userId: cartProvider.userId,
      ),
    );

    SnackbarServices.showSnackbar(context, 'Added to cart sucessefully!');
  }

  void redirect(BuildContext context) {
    Navigator.pushNamed(
      context,
      ProductDetail.route,
      arguments: ProductItemArgs(id, userId),
    );
  }
}
