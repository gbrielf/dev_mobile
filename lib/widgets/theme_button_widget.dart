import 'package:flutter/material.dart';

class ThemeButtonWidget extends StatelessWidget {
  final double? width;
  final double? height;

  const ThemeButtonWidget({Key? key, this.width, this.height})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/assets/images/theme_button.png',
      width: width ?? 20.0,
      height: height ?? 20.0,
      fit: BoxFit.contain,
    );
  }
}
