import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import '../../../themes/app_colors.dart';

class CardItem extends StatelessWidget {
  final String mapKey;
  final String price;
  final String title;
  final int quantity;
  final VoidCallback onPressed;

  const CardItem({
    Key? key,
    required this.price,
    required this.title,
    required this.quantity,
    required this.onPressed,
    required this.mapKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.green,
          child: Text(
            '\$ $price',
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.white,
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
