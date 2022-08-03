import 'package:flutter/material.dart';
import 'package:shop_app/screens/login/login_controller.dart';
import 'package:shop_app/services/route_services.dart';
import 'package:shop_app/themes/app_colors.dart';
import 'package:shop_app/widgets/login_inputs.dart';
import 'package:shop_app/widgets/login_background.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  static const route = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2200,
      ),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 350 / 360,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.ease,
      ),
    );
    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
              turns: _animation,
              child: Container(
                width: size.width * 0.7,
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
            FadeTransition(
              opacity: _opacityAnimation,
              child: Form(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
