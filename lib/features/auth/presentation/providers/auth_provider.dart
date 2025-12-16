import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/auth_repository.dart';

final authStateProvider = StateNotifierProvider<AuthNotifier, AsyncValue<bool?>>((ref){
  return AuthNotifier(ref.watch(authRepositoryProvider));
});

class AuthNotifier extends StateNotifier<AsyncValue<bool?>> {
  final AuthRepository _repository;

  AuthNotifier(this._repository) : super(const AsyncValue.data(null));

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final sucess = await _repository.login(email, password);
      state = AsyncValue.data(sucess);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}