import 'package:flutter/material.dart';
import '../../../themes/app_colors.dart';

class OrderButton extends StatelessWidget {
  final Size size;
  final VoidCallback onTap;

  const OrderButton({
    Key? key,
    required this.size,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.purple,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(92, 0, 0, 0),
                blurRadius: 1,
              )
            ],
          ),
          height: size.height * 0.07,
          width: size.width,
          child: const Center(
            child: Text(
              'ORDER NOW',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
