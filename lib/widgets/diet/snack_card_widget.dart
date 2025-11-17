import 'package:flutter/material.dart';
import '../common/button_expand_details_widget.dart';

class SnackCardWidget extends StatelessWidget {
  final String title;
  final String time;

  const SnackCardWidget({super.key, this.title = 'N/F', this.time = 'N/F'});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF2D2D2D),
        border: Border.all(
          color: Colors.white,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Café da Manhã',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '7:00',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          ButtonExpandDetailsWidget(),
        ],
      ),
    );
  }
}
