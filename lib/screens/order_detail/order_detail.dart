import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/order_provider.dart';
import 'package:shop_app/widgets/rounded_image.dart';

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
      body: ListView.builder(
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: RoundedImage(imageUrl: model.items[index].imageUrl),
            title: Text(model.items[index].title),
            subtitle: Text(
                'Price: ${(model.items[index].price * model.items[index].quantity).toStringAsFixed(2)}'),
            trailing: Text(
              "${model.items[index].quantity} X ",
            ),
          ),
        ),
        itemCount: model.items.length,
      ),
    );
  }
}
