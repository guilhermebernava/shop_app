import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/themes/app_colors.dart';
import 'package:shop_app/widgets/image_with_favorite.dart';
import 'package:shop_app/widgets/product_item/product_item_controller.dart';

class ProductItem extends StatelessWidget {
  final String id;
  const ProductItem({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ProductItemController(id);
    //se o LISTEN estiver como false, esse metodo BUILD
    //nn vai ser chamado novamente quando NOTFITY LISTENERS for chamado.
    final provider = Provider.of<ProductModel>(
      context,
    );
    final productsProvider = Provider.of<ProductsProvider>(
      context,
      listen: false,
    );
    final size = MediaQuery.of(context).size;

    return InkWell(
      key: key,
      onTap: () => controller.redirect(context),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(100, 0, 0, 0),
              offset: Offset(2, 6),
              blurRadius: 4,
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.black87,
              title: Text(
                provider.title,
                textAlign: TextAlign.center,
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                  color: AppColors.green,
                ),
                onPressed: () => controller.addToCart(context, provider),
              ),
            ),
            child: Consumer<ProductsProvider>(
              builder: (context, value, child) => ImageWithFavorite(
                favorited: value.isFavoriteProduct(id),
                imageUrl: provider.imageUrl,
                onTap: () => productsProvider.favoriteProduct(
                  provider.id,
                  provider.userId,
                ),
                size: size,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
