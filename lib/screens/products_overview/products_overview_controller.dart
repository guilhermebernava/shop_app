import 'package:flutter/material.dart';
import 'package:shop_app/enums/filter_options.dart';
import 'package:shop_app/screens/cart/cart.dart';
import '../../providers/products_provider.dart';

class ProductsOverviewController {
  void onSelected(FilterOptions value, ProductsProvider provider) {
    switch (value) {
      case FilterOptions.favorites:
        provider.showFavorites();
        break;
      case FilterOptions.all:
        provider.hideFavorites();
        break;
    }
  }

  void redirect(BuildContext context) {
    Navigator.pushNamed(
      context,
      Cart.route,
    );
  }
}
