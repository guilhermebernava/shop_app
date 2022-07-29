import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_edit/product_edit_controller.dart';
import 'package:shop_app/themes/app_colors.dart';
import 'package:shop_app/widgets/save_button.dart';

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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) => controller.textValidator(value),
                      controller: controller.titleController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        label: Text('Title'),
                      ),
                    ),
                    TextFormField(
                      validator: (value) => controller.textValidator(value),
                      controller: controller.descriptionController,
                      textInputAction: TextInputAction.next,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        label: Text('Description'),
                      ),
                    ),
                    TextFormField(
                      validator: (value) => controller.priceValidator(value),
                      controller: controller.priceController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text('Price'),
                      ),
                    ),
                    TextFormField(
                      validator: (value) => controller.imageValidator(value),
                      controller: controller.imageController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        label: Text('Image Link'),
                      ),
                    ),
                  ],
                ),
              ),
              Image.network(
                controller.imageController.text,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image_not_supported_outlined),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: SaveButton(
                  onTap: () => controller.createProduct(),
                  text: 'Save',
                  color: AppColors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
