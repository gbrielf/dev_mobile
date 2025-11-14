import 'package:flutter/material.dart';
import 'package:flutter_project_nutrition/widgets/logo_widget.dart';
import 'package:flutter_project_nutrition/widgets/theme_button_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LogoWidget(width: 21, height: 21),
          Text('dashboard', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
          Text('dieta', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
          Text('treino', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
          ThemeButtonWidget(width: 20, height: 20),
        ],
      ),
    );
  }
}