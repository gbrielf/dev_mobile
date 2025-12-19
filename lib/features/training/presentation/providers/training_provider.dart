import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/training_repository.dart';
import '../../data/models/training_model.dart';

// Provider que retorna todas as sessões
final allTrainingSessionsProvider = FutureProvider<List<TrainingSessionModel>>((
  ref,
) async {
  final repository = ref.watch(trainingRepositoryProvider);
  return repository.getTrainingSessions();
});

// Provider para a sessão selecionada (null = sessão do dia)
final selectedSessionProvider = StateProvider<TrainingSessionModel?>(
  (ref) => null,
);

// Provider que retorna exercícios da sessão selecionada ou do dia
final trainingProvider = FutureProvider<List<TrainingExerciseModel>>((
  ref,
) async {
  final sessionsAsync = await ref.watch(allTrainingSessionsProvider.future);
  final selectedSession = ref.watch(selectedSessionProvider);

  // Se há uma sessão selecionada manualmente, retorna os exercícios dela
  if (selectedSession != null) {
    return selectedSession.exercises;
  }

  // Caso contrário, retorna exercícios das sessões do dia
  final dartWeekday = DateTime.now().weekday;
  final djangoDay = dartWeekday == 7 ? 1 : dartWeekday + 1;

  final List<TrainingExerciseModel> exercises = [];
  for (final session in sessionsAsync) {
    if (session.days.contains(djangoDay)) {
      exercises.addAll(session.exercises);
    }
  }

  return exercises;
});
