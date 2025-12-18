import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/entities/user.dart';

// Definição do Interceptor (O "pedágio" que coloca o token)
class AuthInterceptor extends Interceptor {
  // Guarda o token de forma criptografada e persistente 
  final _storage = const FlutterSecureStorage();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.read(key: 'jwt_token');
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}

// 2. Provider do Dio (Configuração Global do HTTP)
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.115.139.83:8000/achieve-api',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );
  // adiciona o token automaticamente em todas as requições futuras
  dio.interceptors.add(AuthInterceptor());
  dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  return dio;
});

// Classe do Repositório
class AuthRepository {
  final Dio _dio;
  final _storage = const FlutterSecureStorage();

  AuthRepository(this._dio);

  Future<User> login(String email, String password) async {
    try {
      print('🔵 Tentando login com username: $email');
      print('🔵 URL: ${_dio.options.baseUrl}/token-auth/');

      final response = await _dio.post(
        '/token-auth/',
        data: {'username': email, 'password': password},
      );

      print('🟢 Resposta recebida: ${response.statusCode}');
      print('🟢 Dados: ${response.data}');

      if (response.statusCode == 200) {
        final token = response.data['token'];
        await _storage.write(key: 'jwt_token', value: token);

        // O Django REST Framework token auth retorna apenas o token
        // Vamos criar um usuário básico com o email fornecido
        final user = User(
          id: '0', // ID temporário, você pode buscar depois
          email: email,
          name: email.split('@')[0], // Usa a parte antes do @ como nome
          token: token,
        );
        print('🟢 Usuário criado: ${user.email}');
        return user;
      }
      throw Exception('Falha no login');
    } on DioException catch (e) {
      print('🔴 Erro DioException: ${e.type}');
      print('🔴 Mensagem: ${e.message}');
      print('🔴 Response: ${e.response?.data}');

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception(
          'Servidor não respondeu. Verifique se o Django está rodando.',
        );
      }

      if (e.response?.statusCode == 400) {
        throw Exception('Usuário ou senha inválidos');
      }

      throw Exception(
        e.response?.data['non_field_errors']?[0] ??
            e.message ??
            "Erro de autenticação",
      );
    } catch (e) {
      print('🔴 Erro genérico: $e');
      throw Exception('Erro inesperado: $e');
    }
  }

  Future<String?> getToken() async => await _storage.read(key: 'jwt_token');

  Future<void> logout() async => await _storage.delete(key: 'jwt_token');
}

// 4. Provider do Repositório (APENAS UMA VEZ)
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRepository(dio);
});
