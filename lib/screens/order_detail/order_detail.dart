import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/order_provider.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({Key? key}) : super(key: key);

  static const route = "/order-detail";

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    final model = Provider.of<OrderProvider>(context).orderById(id);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details of Order'),
      ),
      body: Column(children: [
        Text(model.id),
        Text(
          model.total.toStringAsFixed(2),
        ),
      ]),
    );
  }
}
