class ExerciseModel {
  final String name;
  final String muscleGroup;
  final double load;
  final int series;
  final int reps;

  ExerciseModel({
    required this.name,
    required this.muscleGroup,
    required this.load,
    required this.series,
    required this.reps,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      name: json['name'],
      muscleGroup: json['muscle_group'],
      load: json['muscle_load'].toDouble(),
      series: json['series'],
      reps: json['repetitions'],
    );
  }
}
