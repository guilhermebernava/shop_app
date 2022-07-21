import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/screens/cart/children/card_item/card_item_controller.dart';
import 'package:shop_app/themes/app_colors.dart';
import 'package:shop_app/widgets/rounded_image.dart';

class CardItem extends StatelessWidget {
  final Size size;
  final String mapKey;
  final double price;
  final String title;
  final String imageUrl;
  final int quantity;
  final VoidCallback onPressed;

  const CardItem(
    this.size, {
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
    final controller = CardItemController();

    return Dismissible(
      onDismissed: (direction) => onPressed(),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) => controller.confirmDismiss(context),
      background: Container(
        color: Colors.redAccent,
        margin: const EdgeInsets.symmetric(vertical: 4),
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(right: size.width * 0.07),
          child: const Icon(
            Icons.delete,
            size: 40,
            color: AppColors.white,
          ),
        ),
      ),
      key: ValueKey(mapKey),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          subtitle: Text('Total: \$${(price * quantity).toStringAsFixed(2)}'),
          leading: RoundedImage(
            imageUrl: imageUrl,
          ),
          title: Text(title),
          trailing: Consumer<CartProvider>(
            builder: (context, value, child) => DropdownButton<int>(
              value: quantity,
              items: value.selectOptionsByItem(mapKey),
              onChanged: (qtd) => controller.onChanged(qtd, context, mapKey),
            ),
          ),
        ),
      ),
    );
  }
}
