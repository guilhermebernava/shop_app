import 'package:flutter/material.dart';

class LoginBackground extends Container {
  LoginBackground({Key? key, required Size size, required Widget child})
      : super(
          key: key,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff8A6AEF), Color(0xff7BD5FA)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                SizedBox(width: size.width, height: size.height, child: child),
          ),
        );
}
