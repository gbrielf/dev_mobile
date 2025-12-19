// TrainingMainTitleWidget.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/button_expand_details_widget.dart';
import '../providers/training_provider.dart';
import '../../data/models/training_model.dart';

class TrainingMainTitleWidget extends ConsumerStatefulWidget {
  const TrainingMainTitleWidget({super.key});

  @override
  ConsumerState<TrainingMainTitleWidget> createState() =>
      _TrainingMainTitleWidgetState();
}

class _TrainingMainTitleWidgetState
    extends ConsumerState<TrainingMainTitleWidget> {
  bool isExpanded = false;

  String _getSessionTitle(TrainingSessionModel? session) {
    if (session == null) {
      return 'Treino de Hoje';
    }
    return session.name;
  }

  String _getSessionDays(TrainingSessionModel? session) {
    if (session == null) {
      final dartWeekday = DateTime.now().weekday;
      final djangoDay = dartWeekday == 7 ? 1 : dartWeekday + 1;
      return SessionDay.WEEK_DAYS[djangoDay] ?? '';
    }

    final dayNames = session.days
        .map((day) => SessionDay.WEEK_DAYS[day])
        .where((name) => name != null)
        .join(', ');
    return dayNames;
  }

  @override
  Widget build(BuildContext context) {
    final sessionsAsync = ref.watch(allTrainingSessionsProvider);
    final selectedSession = ref.watch(selectedSessionProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Título e botão de expandir
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _getSessionTitle(selectedSession),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(width: 8.0),
            GestureDetector(
              onTap: () => setState(() => isExpanded = !isExpanded),
              child: ButtonExpandDetailsWidget(isExpanded: isExpanded),
            ),
          ],
        ),

        // Subtítulo com dias
        Text(
          _getSessionDays(selectedSession),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),

        // Lista de sessões (quando expandido)
        if (isExpanded)
          sessionsAsync.when(
            loading: () => const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(color: Colors.white),
            ),
            error: (err, stack) => const SizedBox(),
            data: (sessions) => Container(
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF2D2D2D),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  // Opção "Treino de Hoje"
                  _buildSessionOption(
                    context,
                    'Treino de Hoje',
                    null,
                    selectedSession == null,
                  ),
                  const Divider(color: Colors.white24, height: 1),
                  // Todas as outras sessões
                  ...sessions.map(
                    (session) => _buildSessionOption(
                      context,
                      session.name,
                      session,
                      selectedSession?.id == session.id,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSessionOption(
    BuildContext context,
    String title,
    TrainingSessionModel? session,
    bool isSelected,
  ) {
    return InkWell(
      onTap: () {
        ref.read(selectedSessionProvider.notifier).state = session;
        setState(() => isExpanded = false);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        color: isSelected ? const Color(0xFF3D3D3D) : Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white70,
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            if (isSelected)
              const Icon(Icons.check, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }
}
