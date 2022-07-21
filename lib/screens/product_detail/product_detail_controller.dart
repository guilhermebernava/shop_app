import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/screens/cart/cart.dart';
import '../../models/cart.dart';
import '../../services/modal_services.dart';

class ProductDetailController {
  void addCart(BuildContext context, ProductModel model) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addItem(
      CartModel(
        id: model.id,
        title: model.title,
        price: model.price,
        imageUrl: model.imageUrl,
      ),
    );

    ModalServices.showModal(context, 'Do you want to go to the cart?',
            'you will be redirect to cart if you accept')
        .then((value) {
      if (value == true) {
        Navigator.pushReplacementNamed(context, Cart.route);
        return;
      }
    });
  }
}
