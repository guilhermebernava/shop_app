import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final bool isLogin;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputAction action;
  final TextInputType inputType;
  final int maxLines;
  final bool isPassword;
  final String label;

  const Input({
    Key? key,
    this.isLogin = false,
    required this.validator,
    required this.controller,
    this.action = TextInputAction.next,
    this.inputType = TextInputType.text,
    this.maxLines = 1,
    this.isPassword = false,
    required this.label,
  }) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool notVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      textInputAction: widget.action,
      keyboardType: widget.inputType,
      obscureText: widget.isPassword ? notVisible : false,
      maxLines: widget.maxLines,
      style: widget.isLogin
          ? const TextStyle(
              color: Colors.white,
            )
          : null,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  setState(() {
                    notVisible = !notVisible;
                  });
                },
                child: Icon(
                  notVisible ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
              )
            : null,
        label: Text(widget.label),
        labelStyle: widget.isLogin
            ? const TextStyle(
                color: Colors.white,
              )
            : null,
        enabledBorder: widget.isLogin
            ? const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              )
            : null,
        focusedBorder: widget.isLogin
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
}
