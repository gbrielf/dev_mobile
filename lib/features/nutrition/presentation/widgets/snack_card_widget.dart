import 'package:flutter/material.dart';
import 'package:achieve_project/core/widgets/button_expand_details_widget.dart';
import 'package:achieve_project/features/nutrition/data/models/nutrition_model.dart';

const Map<int, String> _scheduleTime = {
  1: '7:00',
  2: '9:00',
  3: '12:00',
  4: '16:00',
  5: '19:00',
  6: '22:00',
};

class SnackCardWidget extends StatefulWidget {
  final MealModel meal;

  const SnackCardWidget({super.key, required this.meal});

  @override
  State<SnackCardWidget> createState() => _SnackCardWidgetState();
}

class _SnackCardWidgetState extends State<SnackCardWidget> {
  bool isExpanded = false;

  String get scheduleTime => _scheduleTime[widget.meal.schedule] ?? '00:00';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2D2D2D),
        border: Border.all(
          color: Colors.white,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => setState(() => isExpanded = !isExpanded),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.meal.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    scheduleTime,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 16),
                  ButtonExpandDetailsWidget(
                    width: 24,
                    height: 24,
                    isExpanded: isExpanded,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded && widget.meal.items.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(color: Colors.white24, thickness: 1),
                  const SizedBox(height: 8),
                  ...widget.meal.items.map(
                    (item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${item.name}:',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            '${item.weight}g ou ${item.portion}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
