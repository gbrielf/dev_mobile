import 'package:flutter/material.dart';
import 'package:flutter_project_nutrition/widgets/logo_widget.dart';
import 'package:flutter_project_nutrition/widgets/theme_button_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LogoWidget(),
          Text('dashboard', style: TextStyle(color: Color(0xFF696969), fontSize: 12, fontWeight: FontWeight.w700)),
          Text('dieta', style: TextStyle(color: Color(0xFF696969), fontSize: 12, fontWeight: FontWeight.w700)),
          Text('treino', style: TextStyle(color: Color(0xFF696969), fontSize: 12, fontWeight: FontWeight.w700)),
          ThemeButtonWidget(),
        ],
      ),
    );
  }
}