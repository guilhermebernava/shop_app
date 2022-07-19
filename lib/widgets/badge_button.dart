import 'package:flutter/material.dart';
import '../themes/app_colors.dart';
import 'badge.dart';

class BadgeButton extends StatelessWidget {
  final String value;
  const BadgeButton({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      value: value,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColors.orange,
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 7,
              )
            ]),
        width: 70,
        height: 70,
        child: const Icon(
          Icons.shopping_cart,
          color: AppColors.white,
          size: 35,
        ),
      ),
    );
  }
}
