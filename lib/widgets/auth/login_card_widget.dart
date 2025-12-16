import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import necessário
import 'package:go_router/go_router.dart';
import 'package:flutter_project_nutrition/widgets/common/app_logo_auth_widget.dart';
import 'package:flutter_project_nutrition/widgets/common/custom_button_widget.dart';
import '../providers/auth_provider.dart'; // Import do seu provider
import 'password_field_widget.dart';
import 'remember_me_checkbox_widget.dart';

// 1. Alterado para ConsumerStatefulWidget para acessar o ref
class LoginCardWidget extends ConsumerStatefulWidget {
  const LoginCardWidget({super.key});

  @override
  ConsumerState<LoginCardWidget> createState() => _LoginCardWidgetState();
}

class _LoginCardWidgetState extends ConsumerState<LoginCardWidget> {
  bool _rememberMe = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Lógica de login separada para limpeza
  Future<void> _handleLogin() async {
    final email = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Preencha todos os campos')));
      return;
    }

    // Chama o método de login do provider
    await ref.read(authStateProvider.notifier).signIn(email, password);

    // Verifica o resultado (se for verdadeiro, navega)
    final authState = ref.read(authStateProvider);
    if (authState.value == true) {
      context.go('/home');
    } else if (authState.hasError || authState.value == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário ou senha inválidos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // 2. Escuta o estado para saber se está carregando
    final authStatus = ref.watch(authStateProvider);
    final isLoading = authStatus.isLoading;

    return Center(
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppLogoAuthWidget(),
            const SizedBox(height: 16),

            const Text(
              'Login',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),

            TextField(
              controller: _usernameController,
              enabled: !isLoading, // Desabilita enquanto carrega
              decoration: InputDecoration(
                labelText: 'Usuário',
                prefixIcon: const Icon(Icons.person, color: Colors.black),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 16),

            PasswordFieldWidget(
              controller: _passwordController,
              // Certifique-se que o seu PasswordFieldWidget aceite a prop enabled se necessário
            ),
            const SizedBox(height: 16),

            RememberMeCheckboxWidget(
              value: _rememberMe,
              onChanged: isLoading
                  ? null
                  : (value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
            ),

            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: isLoading
                    ? null
                    : () {
                        // TODO: Implementar recuperação de senha
                      },
                child: const Text(
                  'Esqueceu a senha?',
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 3. Botão adaptado para mostrar loading
            isLoading
                ? const CircularProgressIndicator()
                : CustomButtonWidget(text: 'LOGIN', onPressed: _handleLogin),
          ],
        ),
      ),
    );
  }
}
