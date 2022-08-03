import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import '../../../widgets/product_item/product_item.dart';

class ProductGrid extends StatefulWidget {
  final Size size;
  const ProductGrid({Key? key, required this.size}) : super(key: key);

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid>
    with SingleTickerProviderStateMixin {
  late final Animation<double> _animation;
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 700,
      ),
    );

    _animation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsProvider>(context);
    return FadeTransition(
      opacity: _animation,
      child: GridView.builder(
        padding: EdgeInsets.all(widget.size.height * 0.01),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //qtd de colunas
          crossAxisCount: 2,
          //aspect do tamanho do dado
          childAspectRatio: 0.85,
          //espaco entre column
          crossAxisSpacing: widget.size.width * 0.04,
          //espaco entre row
          mainAxisSpacing: widget.size.height * 0.03,
        ),
        //utilizando o ChangeNotifierProvider.Value
        //pelo fato dele nn usar o BUILDER ele nao
        //vai gerar problemas com listas
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: provider.productsOrFavorites[index],
          child: ProductItem(
            key: ValueKey(provider.productsOrFavorites[index].id),
          ),
        ),
        itemCount: provider.productsOrFavorites.length,
      ),
    );
  }
}
