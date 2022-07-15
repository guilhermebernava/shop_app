import 'package:flutter/material.dart';

class ProductsOverview extends StatelessWidget {
  const ProductsOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products Overview"),
      ),
      body: const Center(
        child: Text("HOME"),
      ),
    );
  }
}
