import 'package:flutter/material.dart';

class AppLogoAuthWidget extends StatelessWidget {
  final double? width;
  final double? height;

  const AppLogoAuthWidget({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/assets/images/logo_auth.png',
      width: width ?? 84.77,
      height: height ?? 84.77,
      fit: BoxFit.contain,
    );
  }
}
