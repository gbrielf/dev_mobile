import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Adicionado
import 'package:go_router/go_router.dart';
import 'package:flutter_project_nutrition/widgets/common/logo_widget.dart';
import 'package:flutter_project_nutrition/features/auth/data/auth_repository.dart';

// 1. Alterado para ConsumerStatefulWidget
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // 2. Chamamos a lógica de verificação de autenticação
    _checkAuthentication();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 6000),
      vsync: this,
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.0,
          end: 1.50,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.50,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50,
      ),
    ]).animate(_controller);

    _controller.repeat();
  }

  // 3. Nova lógica de navegação inteligente
  Future<void> _checkAuthentication() async {
    // Mantemos um delay para garantir que a animação apareça (ajuste conforme desejar)
    await Future.delayed(const Duration(seconds: 7));

    if (!mounted) return;

    // Lemos o token do storage através do repositório
    final authRepo = ref.read(authRepositoryProvider);
    final token = await authRepo.getToken();

    if (mounted) {
      if (token != null && token.isNotEmpty) {
        // Se houver token, pula o login e vai para o Dashboard
        context.go('/dashboard');
      } else {
        // Se não houver, segue o fluxo normal para o Login
        context.go('/login');
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: AnimatedBuilder(
                animation: _scaleAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: child,
                  );
                },
                child: const LogoWidget(width: 115, height: 115),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
