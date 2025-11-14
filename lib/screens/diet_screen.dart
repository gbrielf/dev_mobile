import 'package:flutter/material.dart';
import 'package:flutter_project_nutrition/widgets/diet_main_title_widget.dart';
import 'package:flutter_project_nutrition/widgets/header_widget.dart';
import 'package:flutter_project_nutrition/widgets/snack_cards_space_widget.dart';

class DietScreen extends StatelessWidget {
  const DietScreen({super.key});

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

              DietMainTitleWidget(),
              const SizedBox(height: 30),

              Expanded(child: SnackCardsSpaceWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
