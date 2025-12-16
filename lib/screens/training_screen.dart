import 'package:flutter/material.dart';
import '../widgets/common/header_widget.dart';
import '../widgets/training/training_main_title_widget.dart';
import '../widgets/training/training_cards_space_widget.dart';

class TrainingScreen extends StatelessWidget {
  final String usuario;
  const TrainingScreen({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              HeaderWidget(),
              const SizedBox(height: 15),

              TrainingMainTitleWidget(),
              const SizedBox(height: 30),

              Expanded(child: TrainingCardsSpaceWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
