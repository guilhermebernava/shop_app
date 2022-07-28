import 'package:flutter/material.dart';
import '../themes/app_colors.dart';

class ModalButtons extends StatelessWidget {
  final double modalSize;
  final String leftButtonName;
  final String rightButtonName;

  const ModalButtons({
    Key? key,
    required this.modalSize,
    required this.leftButtonName,
    required this.rightButtonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context, false),
          child: Container(
            width: modalSize * 1.24,
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32.0),
              ),
            ),
            child: Text(
              leftButtonName,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          width: 2,
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context, true),
          child: Container(
            width: modalSize * 1.23,
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            decoration: const BoxDecoration(
              color: AppColors.darkGreen,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(32.0),
              ),
            ),
            child: Text(
              rightButtonName,
              style: const TextStyle(color: AppColors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
