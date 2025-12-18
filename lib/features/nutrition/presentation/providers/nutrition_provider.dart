import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/nutrition_repository.dart';
import '../../data/models/nutrition_model.dart';

// Este provider agora é apenas um "repassador" de estado
final nutritionProvider = FutureProvider<List<MealModel>>((ref) async {
  // Ele simplesmente observa o repositório e chama a função
  final repository = ref.watch(nutritionRepositoryProvider);
  return repository.getMeals();
});
