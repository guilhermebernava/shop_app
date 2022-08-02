import 'package:flutter/material.dart';
import 'package:shop_app/screens/login/login_controller.dart';
import 'package:shop_app/services/route_services.dart';
import 'package:shop_app/themes/app_colors.dart';
import 'package:shop_app/widgets/login_inputs.dart';
import 'package:shop_app/widgets/login_background.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    final controller = LoginController();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: LoginBackground(
        size: size,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RotationTransition(
              turns: const AlwaysStoppedAnimation(350 / 360),
              child: Container(
                width: size.width * 0.6,
                height: size.height * 0.12,
                decoration: BoxDecoration(
                  color: AppColors.purple,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(2, 2),
                      blurRadius: 3,
                      color: Color.fromARGB(148, 0, 0, 0),
                    )
                  ],
                ),
                child: const Center(
                  child: Text(
                    'My Shop',
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ),
              ),
            ),
            Form(
              key: controller.formKey,
              child: LoginInputs(
                onTap: () {
                  controller.loginUser(context).then((value) =>
                      RouteServices.redirectNoReturn(value, '/', context));
                },
                size: size,
                validatorEmail: (value) => controller.emailValidator(value),
                validatorPassword: (value) =>
                    controller.passwordValidator(value),
                emailController: controller.emailController,
                passwordController: controller.passwordController,
              ),
            )
          ],
        ),
      ),
    );
  }
}
