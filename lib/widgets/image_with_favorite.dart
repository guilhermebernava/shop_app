import 'package:flutter/material.dart';
import 'image_with_shadow.dart';

class ImageWithFavorite extends Stack {
  ImageWithFavorite(
      {Key? key,
      required Size size,
      required VoidCallback onTap,
      required String imageUrl,
      required bool favorited})
      : super(
          key: key,
          alignment: Alignment.topRight,
          children: [
            ImageWithShadow(
              size: size,
              imageUrl: imageUrl,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: onTap,
                child: Icon(
                  Icons.favorite_rounded,
                  color: favorited
                      ? const Color.fromARGB(255, 174, 17, 6)
                      : Colors.grey,
                  size: 40,
                ),
              ),
            )
          ],
        );
}
