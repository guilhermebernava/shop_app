import 'package:flutter/material.dart';
import 'package:shop_app/widgets/save_button.dart';
import '../screens/sign_up/sign_up.dart';
import '../themes/app_colors.dart';
import 'input.dart';

class FormLogin extends StatelessWidget {
  final Size size;
  final String? Function(String?)? validatorEmail;
  final String? Function(String?)? validatorPassword;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLogin;

  const FormLogin({
    Key? key,
    required this.size,
    required this.validatorEmail,
    required this.validatorPassword,
    required this.emailController,
    required this.passwordController,
    this.isLogin = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: SizedBox(
        height: size.height * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Input(
              isLogin: true,
              validator: validatorEmail,
              controller: emailController,
              inputType: TextInputType.emailAddress,
              label: 'Email',
            ),
            Input(
              isLogin: true,
              validator: validatorPassword,
              controller: passwordController,
              label: 'Password',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: CustomTextButton(
                width: size.width * 0.85,
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                text: isLogin ? 'Login' : 'Sign Up',
                color: AppColors.orange,
              ),
            ),
            isLogin
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
      ),
    );
  }
}
