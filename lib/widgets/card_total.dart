import 'package:flutter/material.dart';
import '../themes/app_colors.dart';

class CardTotal extends StatelessWidget {
  final double totalValue;
  const CardTotal({
    Key? key,
    required this.totalValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Total",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Chip(
              label: Text(
                "\$ ${totalValue.toStringAsFixed(2)}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                ),
              ),
              backgroundColor: AppColors.purple,
            )
          ],
        ),
      ),
    );
  }
}
