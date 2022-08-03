import 'package:flutter/material.dart';
import 'input.dart';

class LoginInputs extends StatefulWidget {
  final Size size;
  final String? Function(String?)? validatorEmail;
  final String? Function(String?)? validatorPassword;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginInputs({
    Key? key,
    required this.size,
    required this.validatorEmail,
    required this.validatorPassword,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  State<LoginInputs> createState() => _LoginInputsState();
}

class _LoginInputsState extends State<LoginInputs> {
  bool notVisible = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height * 0.22,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Input(
            isLogin: true,
            validator: widget.validatorEmail,
            controller: widget.emailController,
            inputType: TextInputType.emailAddress,
            label: 'Email',
          ),
          const SizedBox(
            height: 20,
          ),
          Input(
            key: const ValueKey('password'),
            isLogin: true,
            validator: widget.validatorPassword,
            controller: widget.passwordController,
            label: 'Password',
            isPassword: true,
          ),
        ],
      ),
    );
  }
}
