import 'package:flutter/material.dart';

class DietMainTitleWidget extends StatelessWidget {
  const DietMainTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text( 
      'Dieta',
      style: TextStyle(
        color: Colors.white,
        fontSize: 36,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}