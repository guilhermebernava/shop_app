import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/services/modal_services.dart';
import 'package:shop_app/services/snackbar_services.dart';
import 'package:shop_app/services/validators_services.dart';
import '../../models/product.dart';

class ProductEditController {
  final BuildContext context;
  late final ProductModel product;
  late final ProductsProvider provider;

  final formKey = GlobalKey<FormState>();
  final imageController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

  ProductEditController(this.context) {
    final id = ModalRoute.of(context)?.settings.arguments as String?;
    product = id == null
        ? ProductModel(
            id: '-1',
            title: 'NEW PRODUCT',
            description: '',
            imageUrl: '',
            price: 0,
          )
        : Provider.of<ProductsProvider>(
            context,
            listen: false,
          ).productById(id);

    titleController.text = product.title;
    imageController.text = product.imageUrl;
    descriptionController.text = product.description;
    priceController.text = product.price.toString();

    provider = Provider.of<ProductsProvider>(
      context,
      listen: false,
    );
  }

  String? textValidator(String? value) => ValidatorsServices().notNull(value);
  String? priceValidator(String? value) {
    String? response;
    response = ValidatorsServices().notNull(value);
    if (response != null) return response;
    return ValidatorsServices().validDouble(value);
  }

  String? imageValidator(String? value) {
    String? response;
    response = ValidatorsServices().notNull(value);
    if (response != null) return response;
    return ValidatorsServices().imageUrlValidator(value);
  }

  void createProduct(Size size, BuildContext context) {
    final isValidForm = formKey.currentState?.validate();

    if (!isValidForm!) return;

    final model = ProductModel(
      id: product.id == '-1' ? DateTime.now().toString() : product.id,
      title: titleController.text,
      description: descriptionController.text,
      imageUrl: imageController.text,
      price: double.parse(priceController.text),
    );

    provider.addOrUpdate(model, context).then((valid) {
      if (!valid) {
        ModalServices.showModal(context, 'ERROR',
            'an error happened when tried to create an PRODUCT', size);
        return;
      }

      SnackbarServices.showSnackbar(context, 'Add item sucessfully!');

      Navigator.pushReplacementNamed(context, "/");
    });
  }
}
