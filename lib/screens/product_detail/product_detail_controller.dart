import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/cart_provider.dart';
import '../../models/cart.dart';
import '../../services/modal_services.dart';

class ProductDetailController {
  void addCart(BuildContext context, ProductModel model) {
    ModalServices.goToCart(context);
    final cartProvider = Provider.of<CartProvider>(context);
    cartProvider.addItem(
      CartModel(
        id: model.id,
        title: model.title,
        price: model.price,
        imageUrl: model.imageUrl,
      ),
    );
  }
}
