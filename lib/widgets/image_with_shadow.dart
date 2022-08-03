import 'package:flutter/material.dart';
import 'package:shop_app/themes/app_images.dart';

class ImageWithShadow extends Container {
  ImageWithShadow({
    Key? key,
    required String imageUrl,
    required Size size,
    Color color = const Color.fromARGB(29, 0, 0, 0),
    Offset offset = const Offset(2, 6),
    double blurRadius = 5,
    BorderRadius borderRadius = const BorderRadius.only(
      topRight: Radius.circular(20),
      topLeft: Radius.circular(20),
    ),
  }) : super(
          key: key,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: color,
                offset: offset,
                blurRadius: blurRadius,
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: borderRadius,
            child: FadeInImage(
              height: size.height,
              width: size.width,
              placeholder: const AssetImage(AppImages.placeholder),
              image: NetworkImage(
                imageUrl,
              ),
              fit: BoxFit.fill,
            ),
          ),
        );
}
