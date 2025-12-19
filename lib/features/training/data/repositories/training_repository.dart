import 'package:dio/dio.dart';
import '../models/training_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Para o Provider
import 'package:achieve_project/core/network/dio_client.dart'; // ONDE ESTÁ O dioProvider

class TrainingRepository {
  final Dio _dio;
  TrainingRepository(this._dio);

  Future<List<TrainingSessionModel>> getTrainingSessions() async {
    try {
      final response = await _dio.get('/training-sessions/');
      if (response.statusCode == 200) {
        final List data = response.data;
        // Aqui ele vai usar o fromJson que conecta Sessão + Exercícios
        return data.map((m) => TrainingSessionModel.fromJson(m)).toList();
      }
      throw Exception('Falha ao carregar os exercícios');
    } catch (e, stackTrace) {
      // Log do erro real para debug
      print('Erro no getTrainingSessions: $e');
      print('StackTrace: $stackTrace');
      rethrow; // Propaga o erro original ao invés de esconder
    }
  }
}

final trainingRepositoryProvider = Provider<TrainingRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return TrainingRepository(dio);
});
