import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double? width;
  final double? height;

  const LogoWidget({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/assets/images/logo.png',
      width: width ?? 23.0,
      height: height ?? 23.0,
      fit: BoxFit.contain,
    );
  }
}
