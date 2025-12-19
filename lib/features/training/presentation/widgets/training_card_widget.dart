import 'package:achieve_project/features/training/data/models/training_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/widgets/button_expand_details_widget.dart';

class TrainingCardWidget extends StatefulWidget {
  final TrainingExerciseModel exercise;

  const TrainingCardWidget({super.key, required this.exercise});

  @override
  State<TrainingCardWidget> createState() => _TrainingCardWidgetState();
}

class _TrainingCardWidgetState extends State<TrainingCardWidget> {
  bool isExpanded = false;

  Future<void> _openVideo() async {
    final url = widget.exercise.urlVideo;
    if (url.isNotEmpty) {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }

  String _formatRestTime(int seconds) {
    if (seconds == 0) return "0\"";
    return "$seconds\"";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isExpanded ? null : 100,
      constraints: BoxConstraints(minHeight: 100),
      decoration: BoxDecoration(
        color: const Color(0xFF2D2D2D),
        border: Border.all(
          color: Colors.white,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Thumbnail do vídeo - sempre preenche toda a altura
            GestureDetector(
              onTap: _openVideo,
              child: Container(
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
            ),

            // Informações do exercício
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: isExpanded
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    // Linha principal: título, tempo e botão
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            widget.exercise.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (!isExpanded)
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                _formatRestTime(widget.exercise.restTime),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        GestureDetector(
                          onTap: () => setState(() => isExpanded = !isExpanded),
                          child: ButtonExpandDetailsWidget(
                            isExpanded: isExpanded,
                          ),
                        ),
                      ],
                    ),

                    // Detalhes expandidos
                    if (isExpanded)
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildExpandedRow(
                                    "Séries:",
                                    "${widget.exercise.sets}×${widget.exercise.reps}",
                                  ),
                                  const SizedBox(height: 4),
                                  _buildExpandedRow(
                                    "Carga:",
                                    "${widget.exercise.weight}kg",
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            // Botão de tempo quando expandido
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF3D3D3D),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    _formatRestTime(widget.exercise.restTime),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandedRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFF3D3D3D),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
