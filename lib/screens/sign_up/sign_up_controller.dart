import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth.dart';
import '../../services/snackbar_services.dart';
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

  Future<bool> createUser(BuildContext context) async {
    final isValidForm = formKey.currentState?.validate();

    if (!isValidForm!) return false;

    final value = await Provider.of<Auth>(context, listen: false)
        .singUp(emailController.text, passwordController.text)
        .then((value) {
      if (value != 'success') {
        emailController.clear();
        passwordController.clear();
        SnackbarServices.showErrorSnackbar(context, value);
        return false;
      }
    });

    if (value == false) return false;

    return true;
  }
}
