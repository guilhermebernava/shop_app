import 'package:flutter/material.dart';
import 'package:shop_app/screens/login/login_controller.dart';
import 'package:shop_app/themes/app_colors.dart';
import 'package:shop_app/widgets/input.dart';

import '../../widgets/save_button.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    final controller = LoginController();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: AppColors.green,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Form(
                key: controller.formKey,
                child: SizedBox(
                  height: size.height * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Input(
                        validator: (value) {
                          return null;
                        },
                        controller: controller.emailController,
                        inputType: TextInputType.emailAddress,
                        label: 'Email',
                      ),
                      Input(
                        validator: (value) {
                          return null;
                        },
                        controller: controller.passwordController,
                        label: 'Password',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        child: CustomTextButton(
                          onTap: () {},
                          text: 'Login',
                          color: AppColors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
