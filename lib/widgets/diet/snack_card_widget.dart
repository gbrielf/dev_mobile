import 'package:flutter/material.dart';
import '../common/button_expand_details_widget.dart';

class SnackCardWidget extends StatelessWidget {
  final String title;
  final String time;
  final String description;

  const SnackCardWidget({super.key, this.title = 'N/F', this.time = 'N/F', this.description = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2D2D2D),
        border: Border.all(
          color: Colors.white,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                time,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const ButtonExpandDetailsWidget(),
        ],
      ),
      if (description.isNotEmpty)...[
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            description,
            style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
          )
        )
      ]
    );
  }
}
