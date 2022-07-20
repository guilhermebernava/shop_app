import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/order_provider.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  static const route = "/orders";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: Text(provider.orders.length.toString()),
    );
  }
}
