import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product_detail_provider.dart';

class ExpandedPanelProductDetail extends StatelessWidget {
  final String header;
  final String body;

  const ExpandedPanelProductDetail({
    Key? key,
    required this.header,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductDetailProvider>(context);

    return ExpansionPanelList(
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 25,
              ),
              child: Text(
                header,
                style: const TextStyle(
                  fontSize: 22,
                ),
                textAlign: TextAlign.start,
              ),
            );
          },
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              body,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          isExpanded: provider.elementAtIndex(0),
        ),
      ],
      expansionCallback: (index, isOpen) => provider.openByIndex(index),
    );
  }
}
