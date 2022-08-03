import 'package:flutter/material.dart';
import 'image_with_shadow.dart';

class ImageWithFavorite extends StatefulWidget {
  final Size size;
  final VoidCallback onTap;
  final String imageUrl;
  final String tag;
  final bool favorited;

  const ImageWithFavorite({
    Key? key,
    required this.size,
    required this.onTap,
    required this.imageUrl,
    required this.tag,
    required this.favorited,
  }) : super(key: key);

  @override
  State<ImageWithFavorite> createState() => _ImageWithFavoriteState();
}

class _ImageWithFavoriteState extends State<ImageWithFavorite>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Color?> _animation;
  bool isReverse = false;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));

    final initialColor =
        widget.favorited ? const Color.fromARGB(255, 174, 17, 6) : Colors.grey;
    final endColor =
        !widget.favorited ? const Color.fromARGB(255, 174, 17, 6) : Colors.grey;

    _animation = ColorTween(begin: initialColor, end: endColor)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.9, -0.8),
      children: [
        Hero(
          tag: widget.tag,
          child: ImageWithShadow(
            size: widget.size,
            imageUrl: widget.imageUrl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              widget.onTap();
              if (isReverse == false) {
                _controller.forward();
                setState(() {
                  isReverse = true;
                });
                return;
              }

              _controller.reverse();
              setState(() {
                isReverse = false;
              });
            },
            child: AnimatedBuilder(
              animation: _animation,
              builder: (_, __) => Icon(
                Icons.favorite_rounded,
                color: _animation.value,
                size: 40,
              ),
            ),
          ),
        )
      ],
    );
  }
}
