class SessionDay {
  final int session;
  final List<int> dayOfWeek;

  static const Map<int, String> WEEK_DAYS = {
    1: 'Domingo',
    2: 'Segunda-feira',
    3: 'Terça-feira',
    4: 'Quarta-feira',
    5: 'Quinta-feira',
    6: 'Sexta-feira',
    7: 'Sábado',
  };

  SessionDay({required this.session, required this.dayOfWeek});

  factory SessionDay.fromJson(Map<String, dynamic> json) {
    final rawList = json['day_of_week'] as List<dynamic>? ?? <dynamic>[];
    final parsed = rawList
        .map((e) => e is int ? e : int.tryParse('$e') ?? 0)
        .toList();
    return SessionDay(session: json['session'], dayOfWeek: parsed);
  }

  List<String> getDayLabels() {
    return dayOfWeek.map((day) => WEEK_DAYS[day] ?? 'N/F').toList();
  }
}


class TrainingExerciseModel {
  final String name;
  final String muscleGroup;
  final double muscleLoad;
  final int series;
  final int reps;
  final int restTime;
  final String urlVideo;
  final int session;

  TrainingExerciseModel({
    required this.name,
    required this.muscleGroup,
    required this.muscleLoad,
    required this.series,
    required this.reps,
    required this.restTime,
    required this.urlVideo,
    required this.session,
  });

  factory TrainingExerciseModel.fromJson(Map<String, dynamic> json) {
    return TrainingExerciseModel(
      name: json['name'] ?? '',
      muscleGroup: json['muscle_group'] ?? '',
      muscleLoad: (json['muscle_load'] ?? 0).toDouble(),
      series: json['series'] ?? 0,
      reps: json['repetitions'] ?? 0,
      restTime: json['rest_time'] ?? 0,
      urlVideo: json['video'] ?? '',
      session: json['session'],
    );
  }
}

class TrainingSessionModel {
  final int id;
  final String name;
  final List<TrainingExerciseModel> exercises;
  final List<int> days;
  
  TrainingSessionModel({
    required this.id,
    required this.name,
    required this.exercises,
    required this.days,
  });

  factory TrainingSessionModel.fromJson(Map<String, dynamic> json) {
    return TrainingSessionModel(
      id: json['id'],
      name: json['name'],
      exercises: (json['exercises'] as List? ?? []).map((e) => TrainingExerciseModel.fromJson(e)).toList(),
      days: (json['days'] as List? ?? []).map((d) => d['day'] as int).toList(),
      
    );
  }
}

class TrainingModel{
  final String objective;
  final DateTime dateStart;
  final bool isActive;
  final int physicalTrainer;
  final int contract;

  TrainingModel({
    required this.objective,
    required this.dateStart,
    required this.isActive,
    required this.physicalTrainer,
    required this.contract,
  });

  factory TrainingModel.fromJson(Map<String, dynamic> json) {
    return TrainingModel(
      objective: json['objective']?.toString() ?? '',
      dateStart: DateTime.parse(json['date_start']),
      isActive: json['is_active'] ?? false,
      physicalTrainer: (json['physical_trainer'] is int)
          ? json['physical_trainer'] as int
          : int.tryParse('${json['physical_trainer']}') ?? 0,
      contract: (json['contract'] is int)
          ? json['contract'] as int
          : int.tryParse('${json['contract']}') ?? 0,
    );
  }
}
