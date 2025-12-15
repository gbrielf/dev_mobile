import 'package:flutter/material.dart';
import '../widgets/common/header_widget.dart';
import '../widgets/diet/snack_cards_space_widget.dart';

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
              const HeaderWidget(),
              const SizedBox(height: 15),
              const Text(
                'Dieta',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 30),
              const Expanded(child: SnackCardsSpaceWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
