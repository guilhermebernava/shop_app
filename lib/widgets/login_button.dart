import 'package:flutter/material.dart';
import 'package:shop_app/widgets/save_button.dart';

import '../screens/sign_up/sign_up.dart';
import '../themes/app_colors.dart';

class LoginButton extends Padding {
  LoginButton({
    Key? key,
    required Size size,
    required bool canClick,
    required VoidCallback onTap,
    required bool isLogin,
    required BuildContext context,
  }) : super(
          key: key,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Column(
            children: [
              CustomTextButton(
                width: size.width * 0.85,
                onTap: onTap,
                text: canClick
                    ? Text(
                        isLogin ? 'Login' : 'Sign Up',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 30,
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.white,
                          strokeWidth: 3,
                        ),
                      ),
                color: AppColors.orange,
              ),
              const SizedBox(
                height: 20,
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
        );
}
