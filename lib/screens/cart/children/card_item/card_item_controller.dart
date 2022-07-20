import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../providers/cart_provider.dart';

class CardItemController {
  void onChanged(int? qtd, BuildContext context, String mapKey) {
    if (qtd != null) {
      final provider = Provider.of<CartProvider>(context, listen: false);
      provider.updateQtdByKey(mapKey, qtd);
    }
  }
}
