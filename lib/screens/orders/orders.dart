import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/order_provider.dart';
import 'package:shop_app/screens/orders/children/orders_item.dart';

import '../../themes/app_colors.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  static const route = "/orders";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: FutureBuilder(
        future: provider.getOrders(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.darkGreen,
                ),
              );
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              return provider.lenght < 1
                  ? const Center(
                      child: Text(
                        'Ops, no orders here!',
                        style: TextStyle(fontSize: 30, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) => OrderItem(
                        order: provider.orderAtIndex(index),
                      ),
                      itemCount: provider.lenght,
                    );
          }
          return const Center(child: Text('ERROR'));
        },
      ),
    );
  }
}
