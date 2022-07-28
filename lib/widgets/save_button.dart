import 'package:flutter/material.dart';

class SaveButton extends InkWell {
  SaveButton({
    Key? key,
    required VoidCallback onTap,
    required String text,
    double borderRadius = 10,
    TextStyle style = const TextStyle(
      fontSize: 35,
      color: Colors.white,
    ),
    required Color color,
  }) : super(
          key: key,
          onTap: onTap,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 4,
                )
              ],
              color: color,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: style,
              ),
            ),
          ),
        );
}
