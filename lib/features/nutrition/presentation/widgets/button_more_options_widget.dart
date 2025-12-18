import 'package:flutter/material.dart';

// cria uma classe que herda de StatelessWidget
class ButtonMoreOptionsWidget extends StatelessWidget {
  const ButtonMoreOptionsWidget({super.key});

// retorna um widget que descreve a UI
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12), 
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
    child: Text(
      'Mais Opções',
      style: TextStyle(color: Colors.grey[900])
    ),
    );
  }
}