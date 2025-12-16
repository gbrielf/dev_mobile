import 'package:flutter/material.dart';
import 'package:flutter_project_nutrition/widgets/auth/login_card_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/auth_provider.dart';

class LoginCardWidget extends ConsumerStatefulWidget {
  const LoginCardWidget({super.key});

  @override
  ConsumerState<LoginCardWidget> createState() => _LoginCardWidgetState();{
    const _LoginCardWidgetState({super.key});
  }

  class _LoginCardWidgetState extends ConsumerState<LoginCardWidget>{
    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
  } 
    @override
    dipose() {
      _emailController.dispose();
      _passwordController.dispose();
      super.dispose();
    }

    void _handleLogin() async{
      // Usa o seu utilitário de validação
      if(_formKey.currentState!.validate()){
        // Chama o provider para realizar o login
        await ref.read(authStateProvider.notifier).signIn(
          _emailController.text;
          _passwordController.text;
        );

        final result = ref.read(authStateProvider);
        final result = ref.read(authStateProvider);
        if(result.value == true){
          context.go('/home');
        } else if (result.hasError || result.value == false{
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Credenciais inválidas ou erro de conexão')),
          );
          }
        }
    }

    Widget build(BuildContext context, WidgetRef ref){
      final AuthState = ref.watch(authStateProvider);

      return Form(
      key: _formKey,
      child: Column(
        children: [
          // Seu Widget de Texto customizado com validador
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) => Validators.validateEmail(value), // Usando seu utils
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Senha'),
            validator: (value) => Validators.validatePassword(value), // Usando seu utils
          ),
          const SizedBox(height: 24),
          
          // Botão reativo ao estado de loading
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: authState.isLoading ? null : _handleLogin,
              child: authState.isLoading 
                ? const CircularProgressIndicator() 
                : const Text('Entrar'),
            ),
          ),
        ],
      ),
    );
  }
}