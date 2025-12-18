import 'package:dio/dio.dart';
import '../models/nutrition_model.dart';

class NutritionRepository {
  final Dio _dio;
  NutritionRepository(this._dio);

  Future<List<MealModel>> getMeals() async {
    try {
      final response = await _dio.get('/meals/');
      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((m) => MealModel.fromJson(m)).toList();
      }
      throw Exception('Falha ao carregar refeições');
    } catch (e) {
      throw Exception('Erro de conexão com o servidor');
    }
  }
}

// O Provider que expõe o repositório
final nutritionRepositoryProvider = Provider<NutritionRepository>((ref) {
  final dio = ref.watch(dioProvider); // Pega o dio configurado no core
  return NutritionRepository(dio);
});
