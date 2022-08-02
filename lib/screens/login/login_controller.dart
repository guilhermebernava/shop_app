import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/services/snackbar_services.dart';
import '../../providers/auth.dart';
import '../../services/validators_services.dart';

class LoginController {
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
    return null;
  }

  Future<bool> loginUser(BuildContext context) async {
    final isValidForm = formKey.currentState?.validate();

    if (!isValidForm!) return false;

    final value = await Provider.of<Auth>(context, listen: false)
        .login(emailController.text, passwordController.text)
        .then((value) {
      if (value != 'success') {
        formKey.currentState?.reset();
        SnackbarServices.showErrorSnackbar(context, value);
        return false;
      }
    });

    if (value == false) return false;

    return true;
  }
}
