import 'dart:ui';

import 'package:flutter/material.dart';

class Frosted extends StatelessWidget {
  const Frosted({super.key, required this.child, this.borderRadius});

  final Container child;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30,sigmaY: 30),
            child: child,
          ),
      ),
      ]
    );
  }
}