import 'package:flutter/material.dart';
import '../common/button_expand_details_widget.dart';
import 'video_container_widget.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const VideoContainerWidget(),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            restTime,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const ButtonExpandDetailsWidget(),
        ],
      ),
    );
  }
}
