import 'package:flutter/material.dart';
import 'snack_card_widget.dart';

class SnackCardsSpaceWidget extends StatelessWidget {
  const SnackCardsSpaceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index){
        final meal = meals[index];
        return SnackCardWidget(
          title: meal.name,
          items: meal.items.join(', '),
          
        )
      }
    )
    Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SnackCardWidget(title: 'Café da Manhã', time: '7:00'),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SnackCardWidget(title: 'Lanche da Manhã', time: '9:00'),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SnackCardWidget(title: 'Almoço', time: '12:00'),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SnackCardWidget(title: 'Lanche da Tarde', time: '16:00'),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SnackCardWidget(title: 'Jantar', time: '19:00'),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SnackCardWidget(title: 'Ceia', time: '22:00'),
          ),
        ),
      ],
    );
  }
}
