import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/screens/cart/children/card_item.dart';
import 'package:shop_app/screens/cart/children/order_button.dart';
import 'package:shop_app/widgets/card_total.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  static const route = "/cart";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('CART'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final key = value.items.keys.elementAt(index);
                    final model = value.items[key];
                    var res = model == null
                        ? const Text('ERROR')
                        : CardItem(
                            key: ValueKey(key),
                            mapKey: key,
                            price: model.price.toString(),
                            title: model.title,
                            quantity: model.quantity,
                            onPressed: () => value.removeItem(model.id),
                          );
                    return res;
                  },
                  itemCount: value.lenght,
                ),
              ),
              CardTotal(
                totalValue: value.totalValue,
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: size.height * 0.02,
                ),
                child: OrderButton(size: size),
              ),
            ],
          );
        },
      ),
    );
  }
}
