import 'package:flutter/material.dart';
import 'package:flutter_project_nutrition/widgets/common/app_logo_auth_widget.dart';
import 'package:flutter_project_nutrition/widgets/common/custom_button_widget.dart';
import 'password_field_widget.dart';
import 'remember_me_checkbox_widget.dart';

class LoginCardWidget extends StatefulWidget {
  const LoginCardWidget({super.key});

  @override
  State<LoginCardWidget> createState() => _LoginCardWidgetState();
}

class _LoginCardWidgetState extends State<LoginCardWidget> {
  bool _rememberMe = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            // Logo
            AppLogoAuthWidget(),
            const SizedBox(height: 16),

            // Título
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),

            // Campo Usuário
            TextField(
              controller: _usernameController,
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

            // Campo Senha
            PasswordFieldWidget(controller: _passwordController),
            const SizedBox(height: 16),

            // Lembre-me
            RememberMeCheckboxWidget(
              value: _rememberMe,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value ?? false;
                });
              },
            ),

            // Esqueceu a senha
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  // TODO: Implementar recuperação de senha
                },
                child: const Text(
                  'Esqueceu a senha?',
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Botão Login
            CustomButtonWidget(
              text: 'LOGIN',
              onPressed: () {
                // TODO: Implementar lógica de login
              },
            ),
          ],
        ),
      ),
    );
  }
}
