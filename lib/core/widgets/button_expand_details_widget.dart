import 'package:flutter/material.dart';

class ButtonExpandDetailsWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final bool isExpanded; // Adicionado

  const ButtonExpandDetailsWidget({
    Key? key,
    this.width,
    this.height,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: isExpanded ? (3.14159/2) : 0, // Gira 90 graus se expandido
      child: Image.asset(
        'lib/assets/images/expand_details.png',
        width: width ?? 16.0,
        height: height ?? 16.0,
        fit: BoxFit.contain,
      ),
    );
  }
}
