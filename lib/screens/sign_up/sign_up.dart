import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/button_provider.dart';
import 'package:shop_app/screens/sign_up/sign_up_controller.dart';
import 'package:shop_app/services/route_services.dart';
import 'package:shop_app/widgets/login_button.dart';
import 'package:shop_app/widgets/login_inputs.dart';
import 'package:shop_app/widgets/login_background.dart';

class SingUp extends StatelessWidget {
  const SingUp({Key? key}) : super(key: key);
  static const route = '/sing-up';

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: LoginBackground(
        size: size,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginInputs(
                    size: size,
                    validatorEmail: (value) => controller.emailValidator(value),
                    validatorPassword: (value) =>
                        controller.passwordValidator(value),
                    emailController: controller.emailController,
                    passwordController: controller.passwordController,
                  ),
                  Consumer<ButtonProvider>(
                    builder: (context, buttonProvider, child) => LoginButton(
                      context: context,
                      size: size,
                      canClick: buttonProvider.canClick,
                      onTap: () {
                        if (buttonProvider.canClick) {
                          buttonProvider.timeoutCanClick(2);

                          controller.createUser(context).then((value) {
                            if (value) {
                              RouteServices.redirectNoReturn(
                                  value, '/', context);
                            }
                          });
                        }
                      },
                      isLogin: false,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
