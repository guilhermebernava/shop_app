import 'package:flutter/material.dart';
import 'package:shop_app/widgets/product_item.dart';

import '../models/product.dart';

class ProductsOverview extends StatelessWidget {
  ProductsOverview({Key? key}) : super(key: key);

  final productModels = [
    ProductModel(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    ProductModel(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    ProductModel(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    ProductModel(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("ProductModels Overview"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(size.height * 0.01),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //qtd de colunas
          crossAxisCount: 2,
          //aspect do tamanho do dado
          childAspectRatio: 0.85,
          //espaco entre column
          crossAxisSpacing: size.width * 0.04,
          //espaco entre row
          mainAxisSpacing: size.height * 0.03,
        ),
        itemBuilder: (context, index) => ProductItem(
          model: productModels[index],
          context: context,
        ),
        itemCount: productModels.length,
      ),
    );
  }
}
