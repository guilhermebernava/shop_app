import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';

class CardItem extends StatelessWidget {
  final String mapKey;
  final double price;
  final String title;
  final String imageUrl;
  final int quantity;
  final VoidCallback onPressed;

  const CardItem({
    Key? key,
    required this.price,
    required this.title,
    required this.quantity,
    required this.onPressed,
    required this.mapKey,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(5),
        subtitle: Text('Total: \$${(price * quantity).toStringAsFixed(2)}'),
        leading: SizedBox(
          width: 50,
          height: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
        title: Consumer<CartProvider>(
          builder: (context, value, child) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              DropdownButton<int>(
                  value: quantity,
                  items: value.selectOptionsByItem(mapKey),
                  onChanged: (qtd) {
                    if (qtd != null) {
                      value.updateQtdByKey(mapKey, qtd);
                    }
                  })
            ],
          ),
        ),
        trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.remove_shopping_cart,
          ),
        ),
      ),
    );
  }
}
