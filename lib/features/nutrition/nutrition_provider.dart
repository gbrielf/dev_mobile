import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:achieve_project/core/network/dio_client.dart'; // Ajuste para o seu caminho real

class Meal {
  final int id;
  final String name;
  final int schedule;
  final List<MealItem> items;

  Meal({
    required this.id,
    required this.name,
    required this.schedule,
    required this.items,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    final itemsJson = json['items'] as List<dynamic>? ?? <dynamic>[];
    final items = itemsJson
        .map((item) => MealItem.fromJson(item as Map<String, dynamic>))
        .toList();

    return Meal(
      id: (json['id'] is int)
          ? json['id'] as int
          : int.tryParse('${json['id']}') ?? 0,
      name: json['name']?.toString() ?? '',
      schedule: (json['schedule'] is int)
          ? json['schedule'] as int
          : int.tryParse('${json['schedule']}') ?? 0,
      items: items,
    );
  }
}

class MealItem {
  final String name;
  final int weight;
  final String portion;

  MealItem({required this.name, required this.weight, required this.portion});

  factory MealItem.fromJson(Map<String, dynamic> json) {
    final weightValue = json['weight'];
    final intWeight = (weightValue is num)
        ? weightValue.toInt()
        : int.tryParse('$weightValue') ?? 0;

    return MealItem(
      name: json['name']?.toString() ?? 'Alimento sem nome',
      weight: intWeight,
      portion: json['portion']?.toString() ?? '',
    );
  }
}

final nutritionProvider = FutureProvider<List<Meal>>((ref) async {
  final dio = ref.watch(dioProvider);

  try {
    final response = await dio.get('/meals/'); // baseUrl já tem /achieve-api

    if (response.statusCode == 200) {
      final List data = response.data as List<dynamic>;
      return data
          .map((meal) => Meal.fromJson(meal as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Falha ao carregar os dados');
    }
  } catch (e) {
    throw Exception('Erro ao buscar dieta: $e');
  }
});
