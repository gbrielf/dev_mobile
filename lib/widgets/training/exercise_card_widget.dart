import 'package:flutter/material.dart';
import '../common/button_expand_details_widget.dart';

class ExerciseCardWidget extends StatelessWidget {
  final String title;
  final String restTime;

  const ExerciseCardWidget({
    super.key,
    this.title = 'N/F',
    this.restTime = 'N/F',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
          Container(
            width: 100,
            decoration: const BoxDecoration(
              color: Color(0xFFD9D9D9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(9),
                bottomLeft: Radius.circular(9),
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.play_circle_fill,
                size: 64,
                color: Colors.black45,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
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
                        restTime,
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
            ),
          ),
        ],
      ),
    );
  }
}
