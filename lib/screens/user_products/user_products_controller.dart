import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_edit/product_edit.dart';

class UserProductsController {
  void redirect(BuildContext context) {
    Navigator.pushNamed(context, ProductEdit.route);
  }
}
