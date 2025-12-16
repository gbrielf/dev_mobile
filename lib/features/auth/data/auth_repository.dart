import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  final Dio _dio;
  final _storage = const FlutterSecureStorage();

  AuthRepository(this._dio);

  Future<bool> login(String email, String password) async {
    try {
      final response = await _dio.post(
        'https://sua-api.com/v1/auth/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        // Supondo que sua API retorne {'token': 'xyz123...'}
        final token = response.data['token'];

        // SALVANDO O TOKEN COM SEGURANÇA
        await _storage.write(key: 'jwt_token', value: token);
        return true;
      }
      return false;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? "Erro de autenticação");
    }
  }

  // Método para verificar se já existe um token (usaremos na Splash)
  Future<String?> getToken() async {
    return await _storage.read(key: 'jwt_token');
  }

  // Método para Logout
  Future<void> logout() async {
    await _storage.delete(key: 'jwt_token');
  }
}

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(ref.watch(dioProvider)),
);
