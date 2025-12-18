import 'package:flutter/material.dart';

class VideoContainerWidget extends StatelessWidget {
  const VideoContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      color: const Color(0xFFD9D9D9),
      child: const Center(
        child: Icon(Icons.play_circle_fill, size: 48, color: Colors.black45),
      ),
    );
  }
}
