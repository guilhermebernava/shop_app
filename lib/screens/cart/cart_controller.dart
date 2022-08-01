import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/order_provider.dart';
import 'package:shop_app/screens/orders/orders.dart';
import '../../services/modal_services.dart';

class CartController {
  void createOrder(BuildContext context, Size size) async {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    final value = Provider.of<CartProvider>(context, listen: false);

    var total = value.totalValue;
    var items = value.allItems;
    value.clearCart();
    orderProvider.addOrder(total, items).then((valid) {
      if (!valid) {
        ModalServices.showModal(context, 'ERROR',
            'an error happend when tried to create ORDER', size);
        return;
      }
    });

    ModalServices.showModal(context, 'Want to go to yours orders?',
            'if you accept you are going to be redirect to your orders', size)
        .then((value) {
      if (value == true) {
        Navigator.pushReplacementNamed(context, Orders.route);
        return;
      }
      Navigator.pushReplacementNamed(context, '/');
    });
  }
}
