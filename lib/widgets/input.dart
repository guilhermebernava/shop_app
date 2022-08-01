import 'package:flutter/material.dart';

class Input extends TextFormField {
  Input({
    Key? key,
    required String? Function(String?)? validator,
    required TextEditingController controller,
    TextInputAction action = TextInputAction.next,
    TextInputType inputType = TextInputType.text,
    int maxLines = 1,
    required String label,
  }) : super(
          key: key,
          validator: validator,
          controller: controller,
          textInputAction: action,
          keyboardType: inputType,
          maxLines: maxLines,
          decoration: InputDecoration(
            label: Text(label),
          ),
        );
}
