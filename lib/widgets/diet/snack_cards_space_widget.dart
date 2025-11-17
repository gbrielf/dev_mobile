import 'package:flutter/material.dart';
import 'package:flutter_project_nutrition/widgets/snack_card_widget.dart';

class SnackCardsSpaceWidget extends StatelessWidget {
  const SnackCardsSpaceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 16.0), // Espaço abaixo
          child: SnackCardWidget(title: 'Café da Manhã', time: '7:00'),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: SnackCardWidget(title: 'Lanche da Manhã', time: '9:00'),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: SnackCardWidget(title: 'Almoço', time: '12:00'),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: SnackCardWidget(title: 'Lanche da Tarde', time: '16:00'),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: SnackCardWidget(title: 'Jantar', time: '19:00'),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: SnackCardWidget(title: 'Ceia', time: '22:00'),
        ),       
      ],
    );
  }
}