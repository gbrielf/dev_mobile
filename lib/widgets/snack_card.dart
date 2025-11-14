import 'package:flutter/material.dart';
import 'package:flutter_project_nutrition/widgets/button_expand_details_widget.dart';

class SnackCard extends StatelessWidget {
  const SnackCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF2D2D2D),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Café da Manhã', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
          Text('7:00', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
          ButtonExpandDetailsWidget()
        ],
      )
    );
  }
}