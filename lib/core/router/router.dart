// arquivo de rotas
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Use sempre o caminho completo do pacote:
import 'package:achieve_project/features/auth/presentation/screens/login_screen.dart';
import 'package:achieve_project/features/nutrition/presentation/screens/diet_screen.dart';
import 'package:achieve_project/features/training/presentation/screens/training_screen.dart';
import 'package:achieve_project/features/auth/presentation/screens/splash_screen.dart';
import 'package:achieve_project/features/dashboard/presentation/dashboard_screen.dart';
import 'package:achieve_project/features/auth/presentation/providers/auth_provider.dart';

// Provider do GoRouter que tem acesso ao Riverpod
final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      final isAuthenticated = authState.value != null;
      final currentPath = state.matchedLocation;

      // Se acessar /, redireciona conforme autenticação
      if (currentPath == '/') {
        return isAuthenticated ? '/dashboard' : '/login';
      }

      // Rotas protegidas (requer autenticação)
      final protectedRoutes = ['/dashboard', '/diet', '/training'];
      if (protectedRoutes.contains(currentPath) && !isAuthenticated) {
        return '/login';
      }

      // Se está autenticado e tenta acessar login, vai pro dashboard
      if (currentPath == '/login' && isAuthenticated) {
        return '/dashboard';
      }

      return null;
    },
    routes: [
      // rota splash
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      // rota login
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      // rota dashboard
      GoRoute(
        path: '/dashboard',
        name: 'dashboard',
        builder: (context, state) {
          return const DashboardScreen();
        },
      ),
      // rota diet
      GoRoute(
        path: '/diet',
        name: 'diet',
        builder: (context, state) {
          return const DietScreen();
        },
      ),
      // rota training
      GoRoute(
        path: '/training',
        name: 'training',
        builder: (context, state) {
          return const TrainingScreen();
        },
      ),
    ],
  );
});
