import 'package:flutter/material.dart';

class LoginController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void loginUser() {
    final isValidForm = formKey.currentState?.validate();

    if (!isValidForm!) return;
  }
}
