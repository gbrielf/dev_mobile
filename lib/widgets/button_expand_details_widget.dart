import 'package:flutter/material.dart';

class ButtonExpandDetailsWidget extends StatelessWidget {
  final double? width;
  final double? height;

  const ButtonExpandDetailsWidget({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      '/assets/images/expand_details.png',
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
  }
}
