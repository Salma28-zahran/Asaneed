import 'dart:math';
import 'package:flutter/material.dart';

class CircleLayout extends StatelessWidget {
  final List<Widget> children;
  final double radius;

  const CircleLayout({super.key, required this.children, required this.radius});

  @override
  Widget build(BuildContext context) {
    final angleStep = (2 * pi) / children.length;

    return Stack(
      alignment: Alignment.center,
      children: [
        for (int i = 0; i < children.length; i++)
          Transform.translate(
            offset: Offset(
              radius * cos(i * angleStep),
              radius * sin(i * angleStep),
            ),
            child: children[i],
          ),
      ],
    );
  }
}
