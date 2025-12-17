class MealItemModel {
  final String name;
  final double weight;
  final double portion;

  MealItemModel({
    required this.name,
    required this.weight,
    required this.portion,
  });

  factory MealItemModel.fromJson(Map<String, dynamic> json) {
    return MealItemModel(
      name: json['name'],
      weight: json['weight'].toDouble(),
      portion: json['portion'].toDouble(),
    );
  }
}

class MealModel {
  final String name;
  final int schedule; // 1 a 6 conforme seu Django
  final List<MealItemModel> items;

  MealModel({required this.name, required this.schedule, required this.items});

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      name: json['name'],
      schedule: json['schedule'],
      items: (json['items'] as List)
          .map((i) => MealItemModel.fromJson(i))
          .toList(),
    );
  }
}
