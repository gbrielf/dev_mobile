import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/training_repository.dart';
import '../../data/models/training_model.dart';


final trainingProvider = FutureProvider<List<TrainingSessionModel>>((ref) async{
  final repository = ref.watch(trainingRepositoryProvider);
  return repository.getTrainingSessions();
});