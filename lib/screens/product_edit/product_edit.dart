import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_edit/product_edit_controller.dart';

class ProductEdit extends StatelessWidget {
  const ProductEdit({Key? key}) : super(key: key);

  static const route = '/order-edit';

  @override
  Widget build(BuildContext context) {
    final controller = ProductEditController(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(controller.product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text('Title'),
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text('Description'),
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text('Price'),
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.send,
                  decoration: const InputDecoration(
                    label: Text('Image Link'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
