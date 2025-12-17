// arquivo de rotas
import 'package:go_router/go_router.dart';
// Use sempre o caminho completo do pacote:
import 'package:flutter_project_nutrition/screens/login_screen.dart';
import 'package:flutter_project_nutrition/screens/diet_screen.dart';
import 'package:flutter_project_nutrition/screens/training_screen.dart';
import 'package:flutter_project_nutrition/screens/splash_screen.dart';
import 'package:flutter_project_nutrition/screens/dashboard_screen.dart';

// configura as rotas principais do app
final GoRouter router = GoRouter(
  initialLocation: '/splash',
  redirect: (constext, state) {
    // Lógica de redirecionamento pode ser adicionada aqui
    // final isLoggingIn = state.matchedLocation == '/login';
    // final isSplash = state.matchedLocation == '/splash'; // Nenhum redirecionamento por padrão

    // final bool loggedIn = checkUserLoginStatus();
    // if (!loggedIn && !isLoggingIn && !isSplash){
    //   return '/login';
    // }
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
