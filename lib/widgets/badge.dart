import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({
    Key? key,
    required this.child,
    required this.value,
    this.color,
  }) : super(key: key);

  final Widget child;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 10,
          top: 10,
          child: Container(
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: color ?? Theme.of(context).colorScheme.secondary,
            ),
            constraints: const BoxConstraints(
              minWidth: 24,
              minHeight: 24,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        )
      ],
    );
  }
}
