import 'package:flutter/material.dart';
import 'exercise_card_widget.dart';

class TrainingCardsSpaceWidget extends StatelessWidget {
  const TrainingCardsSpaceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0), // Espaço abaixo
          child: ExerciseCardWidget(title: 'Supino Reto', restTime: '90"'),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: ExerciseCardWidget(title: 'Supino Inclinado', restTime: '90"'),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: ExerciseCardWidget(title: 'Peckdeck', restTime: '90"'),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: ExerciseCardWidget(title: 'Triceps Pulley', restTime: '90"'),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: ExerciseCardWidget(title: 'Paralela', restTime: '90"'),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: ExerciseCardWidget(title: 'Tríceps Corda', restTime: '90"'),
        ),
      ],
    );
  }
}
