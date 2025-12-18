import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:achieve_app_nutrition/features/auth/data/auth_repository.dart'; // Importa onde está o seu dioProvider

// O Model (Baseado no seu nutrition.py)
class Meal {
  final int id;
  final String name;
  final int schedule;
  final List<MealItem> items;

  Meal({required this.id, required this.name, required this.schedule, required this.items});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'],
      name: json['name'],
      schedule: json['schedule'],
      // Aqui pegamos o nome dos itens para facilitar a exibição no Card
      items: (json['items'] as List?).map((item) => MealItem.fromJson(item)).toList(),
    );
  }
}

class MealItem{
  final String name;
  final int weight;
  final String portion;
  
  MealItem({required this.name, required this.weight, required this.portion});

  factory MealItem.fromJson(Map<String, dynamic> json){
    return MealItem(
      name: json['name'],
      weight: json['weight'].toInt() ?? 0,
      portion: json['portion'].toString(),
    );
  }
}

// O Provider que busca os dados no Django
final nutritionProvider = FutureProvider<List<Meal>>((ref) async {
  final dio = ref.watch(dioProvider); // Usa o Dio com o interceptor de Token que já foi feito

  try {
    // URL completa: baseUrl + /nutrition/meals/
    final response = await dio.get('/nutrition/meals/');

    if(response.statusCode == 200){
      final List data = response.data;
      return data.map((meal) => Meal.fromJson(meal)).toList();
    }
    else{
      throw Excepction('Falha ao carregar os dados');
    }
  } catch (e) {
    throw Exception('Erro ao buscar dieta: $e');
  }
});
