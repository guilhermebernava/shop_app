import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/product_detail/children/expanded_panel_product_detail.dart';
import 'package:shop_app/screens/product_detail/children/text_row.dart';
import 'package:shop_app/screens/product_detail/product_detail_controller.dart';
import 'package:shop_app/widgets/button_with_icon.dart';
import 'package:shop_app/widgets/image_with_favorite.dart';
import 'package:shop_app/widgets/radio_button.dart';
import 'package:shop_app/widgets/text_with_padding.dart';

class ProductDetail extends StatelessWidget {
  static const route = "/product-detail";
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    final size = MediaQuery.of(context).size;
    final userId = Provider.of<ProductModel>(context, listen: false).userId;
    final model = Provider.of<ProductsProvider>(context, listen: false)
        .productById(id, userId);
    final controller = ProductDetailController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          model.title,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(size.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer2<ProductsProvider, ProductModel>(
                builder: (context, products, product, child) =>
                    ImageWithFavorite(
                  size: size,
                  onTap: () => products.favoriteProduct(
                    id,
                    product.userId,
                  ),
                  imageUrl: model.imageUrl,
                  favorited: model.isFavorite,
                ),
              ),
              ExpandedPanelProductDetail(
                header: "Description",
                body: model.description,
              ),
              TextWithPadding(text: "Size"),
              RadioButtonList(
                size: size,
                buttonLabels: const ['S', 'M', 'L', 'XL'],
                buttonValues: const ['SMALL', 'MEDIUM', 'LARGE', 'EXTRA LARGE'],
                radioButtonValue: (value) => debugPrint(value),
              ),
              TextRow(text: "\$ ${model.price}"),
              ButtonWithIcon(
                text: "Add",
                icon: Icons.add_shopping_cart,
                onTap: () => controller.addCart(context, model, size),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
