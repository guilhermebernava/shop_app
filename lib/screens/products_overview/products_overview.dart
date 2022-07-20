import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/enums/filter_options.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/products_overview/children/product_grid.dart';
import 'package:shop_app/screens/products_overview/products_overview_controller.dart';
import 'package:shop_app/widgets/badge_button.dart';

import '../orders/orders.dart';

class ProductsOverview extends StatelessWidget {
  const ProductsOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = ProductsOverviewController();
    final provider = Provider.of<ProductsProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("ProductModels Overview"),
        leading: IconButton(
          onPressed: () => Navigator.pushNamed(context, Orders.route),
          icon: const Icon(Icons.h_mobiledata),
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.more_vert,
              size: 32,
            ),
            elevation: 10,
            onSelected: (FilterOptions value) => controller.onSelected(
              value,
              provider,
            ),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: FilterOptions.favorites,
                child: Text("Favorites Products"),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text("All Products"),
              ),
            ],
          ),
        ],
      ),
      body: Consumer<ProductsProvider>(
        builder: (context, value, child) => ProductGrid(size: size),
      ),
      floatingActionButton: GestureDetector(
        onTap: () => controller.redirect(context),
        child: Consumer<CartProvider>(
          builder: (context, value, child) => BadgeButton(
            value: value.lenght.toString(),
          ),
        ),
      ),
    );
  }
}
