import 'package:flutter/material.dart';

class ButtonWithIcon extends ElevatedButton {
  ButtonWithIcon({
    Key? key,
    required String text,
    required IconData icon,
    required VoidCallback onTap,
  }) : super(
          key: key,
          onPressed: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  icon,
                  size: 40,
                ),
              ],
            ),
          ),
        );
}
