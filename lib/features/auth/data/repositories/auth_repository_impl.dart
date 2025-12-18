import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/entities/user_entity.dart';
import '../../data/repositories/auth_repository.dart'; // A Interface
import '../models/user_model.dart'; // O Model com fromJson

class AuthRepositoryImpl implements IAuthRepository {
  final Dio _dio;
  final _storage = const FlutterSecureStorage();

  AuthRepositoryImpl(this._dio);

  @override
  Future<UserEntity> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/token-auth/',
        data: {'username': email, 'password': password},
      );

      if (response.statusCode == 200) {
        final token = response.data['token'];
        await _storage.write(key: 'jwt_token', value: token);

        // Mapeamos para o Model (que herda de UserEntity)
        // Como o Django token-auth só retorna o token, simulamos o resto:
        final userModel = UserModel(
          id: '0',
          email: email,
          name: email.split('@')[0],
          token: token,
        );

        return userModel;
      }
      throw Exception('Falha no login');
    } on DioException catch (e) {
      // ... sua lógica de erro atual (permanece igual)
      throw Exception(e.message);
    }
  }

  @override
  Future<String?> getToken() async => await _storage.read(key: 'jwt_token');

  @override
  Future<void> logout() async => await _storage.delete(key: 'jwt_token');
  
}

// Adicione isso no final do seu arquivo de implementação do repositório
final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  final dio = ref.watch(dioProvider); // Agora ele pega do dio_client.dart
  return AuthRepositoryImpl(dio);
});
