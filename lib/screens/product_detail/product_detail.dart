import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/product_detail/children/expanded_panel_product_detail.dart';
import 'package:shop_app/screens/product_detail/children/text_row.dart';
import 'package:shop_app/screens/product_detail/product_detail_controller.dart';
import 'package:shop_app/themes/app_colors.dart';
import 'package:shop_app/widgets/button_with_icon.dart';
import 'package:shop_app/widgets/image_with_favorite.dart';
import 'package:shop_app/widgets/product_item/models/product_item_args.dart';
import 'package:shop_app/widgets/radio_button.dart';
import 'package:shop_app/widgets/text_with_padding.dart';

class ProductDetail extends StatelessWidget {
  static const route = "/product-detail";
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as ProductItemArgs;
    final size = MediaQuery.of(context).size;
    final model = Provider.of<ProductsProvider>(context, listen: false)
        .productById(args.id, args.userId);
    final controller = ProductDetailController();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: size.height * 0.4,
            pinned: true,
            iconTheme: const IconThemeData(
              color:
                  Color.fromARGB(255, 100, 100, 100), //change your color here
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Consumer<ProductsProvider>(
                builder: (context, products, child) => ImageWithFavorite(
                  tag: model.id + model.userId,
                  size: size,
                  onTap: () => products.favoriteProduct(
                    model.id,
                    model.userId,
                  ),
                  imageUrl: model.imageUrl,
                  favorited: model.isFavorite,
                ),
              ),
              title: Text(
                model.title,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.all(size.height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ExpandedPanelProductDetail(
                        header: "Description",
                        body: model.description,
                      ),
                      TextWithPadding(text: "Size"),
                      RadioButtonList(
                        size: size,
                        buttonLabels: const ['S', 'M', 'L', 'XL'],
                        buttonValues: const [
                          'SMALL',
                          'MEDIUM',
                          'LARGE',
                          'EXTRA LARGE'
                        ],
                        radioButtonValue: (value) => debugPrint(value),
                      ),
                      TextRow(text: "\$ ${model.price}"),
                      ButtonWithIcon(
                        text: "Add",
                        icon: Icons.add_shopping_cart,
                        onTap: () => controller.addCart(context, model, size),
                      ),
                      const SizedBox(
                        height: 500,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
