import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/order_provider.dart';
import '../../services/modal_services.dart';

class CartController {
  void createOrder(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    final value = Provider.of<CartProvider>(context);

    var total = value.totalValue;
    var items = value.allItems;
    value.clearCart();
    orderProvider.addOrder(total, items);
    ModalServices.orderDone(context);
  }
}
