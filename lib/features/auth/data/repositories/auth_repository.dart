import '../domain/entities/user_entity.dart';

abstract class IAuthRepository {
  Future<UserEntity> login(String email, String password);
  Future<String?> getToken();
  Future<void> logout();
}
