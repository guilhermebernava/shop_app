import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/user_products/children/user_product_item/user_product_item_controller.dart';
import 'package:shop_app/themes/app_colors.dart';
import 'package:shop_app/widgets/rounded_image.dart';

class UserProductItem extends StatelessWidget {
  final ProductModel model;
  final Size size;
  const UserProductItem({Key? key, required this.model, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserProductItemController();

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Consumer<ProductsProvider>(
            builder: (context, value, child) => ListTile(
              title: Text(model.title),
              leading: RoundedImage(imageUrl: model.imageUrl),
              trailing: SizedBox(
                width: size.width * 0.25,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: AppColors.green,
                      ),
                    ),
                    IconButton(
                      onPressed: () => controller.delete(context, model),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
