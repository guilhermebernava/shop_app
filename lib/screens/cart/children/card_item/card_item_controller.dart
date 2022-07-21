import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/services/modal_services.dart';
import '../../../../providers/cart_provider.dart';

class CardItemController {
  void onChanged(int? qtd, BuildContext context, String mapKey) {
    if (qtd != null) {
      final provider = Provider.of<CartProvider>(context, listen: false);
      provider.updateQtdByKey(mapKey, qtd);
    }
  }

  Future<bool?> confirmDismiss(BuildContext context) {
    return ModalServices.showModal(context, 'Are you sure?',
        'If you press ACCEPT you will remove these items from cart');
  }
}
