// TrainingMainTitleWidget.dart
import 'package:flutter/material.dart';
import '../common/button_expand_details_widget.dart'; // Importe o ícone AQUI

class TrainingMainTitleWidget extends StatelessWidget {
  const TrainingMainTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // A Column principal
    return Column(
      // Alinha todo o conteúdo (a Row e o Subtítulo) à esquerda
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. UMA NOVA ROW para o Título e o Ícone
        Row(
          // Alinha o texto e o ícone no centro (verticalmente)
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Peito e Tríceps',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(width: 8.0), // Espaço entre o texto e o ícone
            const ButtonExpandDetailsWidget(), // O ícone vai AQUI
          ],
        ),

        // 2. O Subtítulo (como já estava)
        const Text(
          'Segunda-feira',
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
