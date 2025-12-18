import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/user_entity.dart';
import '../../data/repositories/auth_repository.dart'; // Importa a Interface (IAuthRepository)
import '../../data/repositories/auth_repository_impl.dart'; // Importa onde está o Provider do Repositório

// O estado agora é baseado em UserEntity (Domain), não mais na classe concreta do Data
final authStateProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<UserEntity?>>((ref) {
      // Aqui está o segredo: ele assiste o repositório através da interface
      final repository = ref.watch(authRepositoryProvider);
      return AuthNotifier(repository);
    });

class AuthNotifier extends StateNotifier<AsyncValue<UserEntity?>> {
  // Referenciamos a Interface: Isso é Inversão de Dependência
  final IAuthRepository _repository;

  AuthNotifier(this._repository) : super(const AsyncValue.data(null));

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();

    try {
      final user = await _repository.login(email, password);
      state = AsyncValue.data(user);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> signOut() async {
    await _repository.logout();
    state = const AsyncValue.data(null);
  }
}
