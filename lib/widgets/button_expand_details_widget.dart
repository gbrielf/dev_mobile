import 'package:flutter/material.dart';

class ButtonExpandDetailsWidget extends StatelessWidget {
  final double? width;
  final double? height;

  const ButtonExpandDetailsWidget({Key? key, this.width, this.height})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/assets/images/expand_details.png',
      width: width ?? 16.0,
      height: height ?? 16.0,
      fit: BoxFit.contain,
    );
  }
}
