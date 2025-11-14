import 'package:flutter/material.dart';

class ThemeButtonWidget extends StatelessWidget {
  final double? width;
  final double? height;

  const ThemeButtonWidget({Key? key, this.width, this.height})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      '/assets/images/theme_button.png',
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
  }
}
