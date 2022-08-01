import 'package:flutter/material.dart';
import '../../services/validators_services.dart';

class SignUpController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? emailValidator(String? value) {
    String? response;
    response = ValidatorsServices().notNull(value);
    if (response != null) return response;

    return ValidatorsServices().email(value);
  }

  String? passwordValidator(String? value) {
    String? response;
    response = ValidatorsServices().notNull(value);
    if (response != null) return response;

    return ValidatorsServices().password(value);
  }

  void loginUser() {
    final isValidForm = formKey.currentState?.validate();

    if (!isValidForm!) return;
  }
}
