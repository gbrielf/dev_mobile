import 'package:flutter/material.dart';
import '../common/button_expand_details_widget.dart';

class DietMainTitleWidget extends StatelessWidget {
  const DietMainTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Dieta',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(width: 8.0),
            const ButtonExpandDetailsWidget(),
          ],
        ),
        const Text(
          'Plano Nutricional',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
