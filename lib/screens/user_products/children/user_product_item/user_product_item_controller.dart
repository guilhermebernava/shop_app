import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screens/product_edit/product_edit.dart';
import 'package:shop_app/services/modal_services.dart';
import '../../../../providers/products_provider.dart';

class UserProductItemController {
  void delete(BuildContext context, ProductModel model) async {
    final provider = Provider.of<ProductsProvider>(context, listen: false);
    final response = await ModalServices.showModal(context, 'Are you Sure?',
        'You are going to delete this product permantanly!');

    if (response == true) {
      provider.removeByItem(model);
    }
  }

  void redirect(BuildContext context, String id) {
    Navigator.pushNamed(context, ProductEdit.route, arguments: id);
  }
}
