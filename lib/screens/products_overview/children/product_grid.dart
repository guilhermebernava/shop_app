import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import '../../../widgets/product_item/product_item.dart';

class ProductGrid extends StatelessWidget {
  final Size size;
  const ProductGrid({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsProvider>(context);
    return GridView.builder(
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
      //utilizando o ChangeNotifierProvider.Value
      //pelo fato dele nn usar o BUILDER ele nao
      //vai gerar problemas com listas
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: provider.products[index],
        child: ProductItem(
          id: provider.products[index].id,
        ),
      ),
      itemCount: provider.products.length,
    );
  }
}
