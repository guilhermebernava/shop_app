import 'package:flutter/material.dart';
import 'package:shop_app/widgets/save_button.dart';
import '../screens/sign_up/sign_up.dart';
import '../themes/app_colors.dart';
import 'input.dart';

class LoginInputs extends StatefulWidget {
  final Size size;
  final String? Function(String?)? validatorEmail;
  final String? Function(String?)? validatorPassword;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLogin;
  final VoidCallback onTap;

  const LoginInputs({
    Key? key,
    required this.size,
    required this.validatorEmail,
    required this.validatorPassword,
    required this.emailController,
    required this.passwordController,
    this.isLogin = true,
    required this.onTap,
  }) : super(key: key);

  @override
  State<LoginInputs> createState() => _LoginInputsState();
}

class _LoginInputsState extends State<LoginInputs> {
  bool notVisible = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height * 0.42,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Input(
            isLogin: true,
            validator: widget.validatorEmail,
            controller: widget.emailController,
            inputType: TextInputType.emailAddress,
            label: 'Email',
          ),
          Input(
            key: const ValueKey('password'),
            isLogin: true,
            validator: widget.validatorPassword,
            controller: widget.passwordController,
            label: 'Password',
            isPassword: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: CustomTextButton(
              width: widget.size.width * 0.85,
              onTap: widget.onTap,
              text: widget.isLogin ? 'Login' : 'Sign Up',
              color: AppColors.orange,
            ),
          ),
          widget.isLogin
              ? InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      SingUp.route,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'or',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'sign up',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
