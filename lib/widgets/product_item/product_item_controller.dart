import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/themes/app_colors.dart';
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

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        elevation: 2,
        backgroundColor: AppColors.green,
        duration: Duration(milliseconds: 500),
        dismissDirection: DismissDirection.up,
        content: Text(
          "Add this item to cart!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Anton',
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  void redirect(BuildContext context) {
    Navigator.pushNamed(
      context,
      ProductDetail.route,
      arguments: id,
    );
  }
}
