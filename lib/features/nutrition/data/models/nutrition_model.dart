class MealItemModel {
  final String name;
  final int weight; // Mudamos para int para bater com seu layout de "150g"
  final String portion;

  MealItemModel({
    required this.name,
    required this.weight,
    required this.portion,
  });

  factory MealItemModel.fromJson(Map<String, dynamic> json) {
    final weightValue = json['weight'];

    // Proteção de tipo: garante que vire int independente de como venha do Django
    final intWeight = (weightValue is num)
        ? weightValue.toInt()
        : int.tryParse('$weightValue') ?? 0;

    return MealItemModel(
      name: json['name']?.toString() ?? 'Sem nome',
      weight: intWeight,
      portion: json['portion']?.toString() ?? '',
    );
  }
}

class MealModel {
  final int id;
  final String name;
  final int schedule;
  final List<MealItemModel> items;

  MealModel({
    required this.id,
    required this.name,
    required this.schedule,
    required this.items,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    // Proteção para a lista de itens: se vier nulo, vira lista vazia
    final itemsJson = json['items'] as List<dynamic>? ?? [];

    return MealModel(
      id: (json['id'] is int)
          ? json['id'] as int
          : int.tryParse('${json['id']}') ?? 0,
      name: json['name']?.toString() ?? '',
      schedule: (json['schedule'] is int)
          ? json['schedule'] as int
          : int.tryParse('${json['schedule']}') ?? 0,
      items: itemsJson
          .map((i) => MealItemModel.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
  }
}
