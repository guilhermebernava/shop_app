import 'package:flutter/material.dart';

class Input extends TextFormField {
  Input({
    Key? key,
    bool isLogin = false,
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
          style: isLogin
              ? const TextStyle(
                  color: Colors.white,
                )
              : null,
          decoration: InputDecoration(
            label: Text(label),
            labelStyle: isLogin
                ? const TextStyle(
                    color: Colors.white,
                  )
                : null,
            enabledBorder: isLogin
                ? const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  )
                : null,
            focusedBorder: isLogin
                ? const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff448FAD),
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  )
                : null,
          ),
        );
}
