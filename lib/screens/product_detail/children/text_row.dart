import 'package:flutter/material.dart';

class TextRow extends Padding {
  TextRow({
    Key? key,
    required String text,
  }) : super(
          key: key,
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
        );
}
