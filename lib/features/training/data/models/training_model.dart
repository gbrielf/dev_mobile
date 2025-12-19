import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

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
      name: json['name'],
      muscleGroup: json['muscle_group'],
      muscleLoad: json['muscle_load'].toDouble(),
      series: json['series'],
      reps: json['repetitions'],
      restTime: json['rest_time'],
      urlVideo: json['url_video'],
      session: json['session'],
    );
  }
}

class TrainingSessionModel {
  final int id;
  final String name;
  final int training;
  final DateTime date;
  final int duration;
  final Bool isActive;

  TrainingSessionModel({
    required this.id,
    required this.name,
    required this.training,
    required this.date,
    required this.duration,
    required this.isActive,
  });

  factory TrainingSessionModel.fromJson(Map<String, dynamic> json) {
    return TrainingSessionModel(
      id: json['id'],
      name: json['name'],
      training: json['training'],
      date: DateTime.parse(json['date']),
      duration: json['duration'],
      isActive: json['is_active'],
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

class SessionDay{
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

  SessionDay({
    required this.session,
    required this.dayOfWeek,
  });

  factory SessionDay.fromJson(Map<String, dynamic> json) {
    final rawList = json['day_of_week'] as List<dynamic>? ?? <dynamic>[];
    final parsed = rawList.map((e) => e is int ? e : int.tryParse('$e') ?? 0).toList();
    return SessionDay(
      session: json['session'],
      dayOfWeek: parsed,
    );
  }

  List<String> getDayLabels(){
    return dayOfWeek.map((day) => WEEK_DAYS[day] ?? 'N/F').toList();
  }
}
