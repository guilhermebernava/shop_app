import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_edit/product_edit_controller.dart';
import 'package:shop_app/themes/app_colors.dart';
import 'package:shop_app/widgets/input.dart';
import 'package:shop_app/widgets/save_button.dart';

class ProductEdit extends StatelessWidget {
  const ProductEdit({Key? key}) : super(key: key);

  static const route = '/order-edit';

  @override
  Widget build(BuildContext context) {
    final controller = ProductEditController(context);
    final Size size = MediaQuery.of(context).size;

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
                    Input(
                      validator: (value) => controller.textValidator(value),
                      controller: controller.titleController,
                      label: 'Title',
                    ),
                    Input(
                        validator: (value) => controller.textValidator(value),
                        controller: controller.descriptionController,
                        maxLines: 5,
                        label: 'Description'),
                    Input(
                      validator: (value) => controller.priceValidator(value),
                      controller: controller.priceController,
                      inputType: TextInputType.number,
                      label: 'Price',
                    ),
                    Input(
                      validator: (value) => controller.imageValidator(value),
                      controller: controller.imageController,
                      action: TextInputAction.done,
                      label: 'Image Link',
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
                child: CustomTextButton(
                  onTap: () => controller.createProduct(size),
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
