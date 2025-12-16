// arquivo de rotas
import 'package:flutter/material.dart';
import 'package:flutter_project_nutrition/screens/diet_screen.dart';
import 'package:go_router/go_router.dart';
import '/screens/login_screen.dart';
import '/screens/diet_screen.dart';
import '/screens/training_screen.dart';
import '/screens/splash_screen.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/splash',
  redirect: (constext, state) {
    // Lógica de redirecionamento pode ser adicionada aqui
    final isLoggingIn = state.matchedLocation == '/login';
    final isSplash = state.matchedLocation == '/splash'; // Nenhum redirecionamento por padrão

    final bool loggedIn = checkUserLoginStatus();
    if (!loggedIn && !isLoggingIn && !isSplash){
      return '/login';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) {
      return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/dieta/:usuario',
      builder: (context, state){
        final usuario = state.pathParameters['usuario']!;
        return DietScreen(usuario: usuario);
      },
    ),
    GoRoute(
      path: '/treino/:usuario',
      builder: (context, state){
        final usuario = state.pathParameters['usuario']!;
        return TrainingScreen(usuario: usuario);
      },
    )


  ],
);