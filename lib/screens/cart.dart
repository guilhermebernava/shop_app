import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  static const route = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CART'),
      ),
      body: Consumer<CartProvider>(builder: (context, value, child) {
        return ListView.builder(
          itemBuilder: (context, index) => Card(
            child: Row(
              children: [
                Text(value.items.values.toList()[index].title),
              ],
            ),
          ),
          itemCount: value.items.values.toList().length,
        );
      }),
    );
  }
}
