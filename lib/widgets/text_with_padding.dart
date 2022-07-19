import 'package:flutter/material.dart';

class TextWithPadding extends Padding {
  TextWithPadding({
    Key? key,
    required String text,
  }) : super(
          key: key,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
        );
}
