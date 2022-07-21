import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/user_products/children/user_product_item/user_product_item.dart';

class UserProducts extends StatelessWidget {
  const UserProducts({Key? key}) : super(key: key);

  static const route = '/user-products';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsProvider>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yours Products'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => UserProductItem(
          model: provider.products[index],
          size: size,
        ),
        itemCount: provider.products.length,
      ),
    );
  }
}
