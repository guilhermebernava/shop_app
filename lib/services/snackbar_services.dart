import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class SnackbarServices {
  static void showSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 2,
        backgroundColor: AppColors.green,
        duration: const Duration(milliseconds: 700),
        dismissDirection: DismissDirection.up,
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Anton',
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
