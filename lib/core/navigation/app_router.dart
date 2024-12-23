import 'package:go_router/go_router.dart';
import 'package:uptodo_app/presentation/auth/pages/login.dart';
import 'package:uptodo_app/presentation/auth/pages/register.dart';
import 'package:uptodo_app/presentation/auth/pages/start.dart';
import 'package:uptodo_app/presentation/home/pages/home.dart';
import 'package:uptodo_app/presentation/onboading/pages/onboading.dart';
import 'package:uptodo_app/presentation/splash/pages/splash.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/onboading',
        builder: (context, state) =>  OnboadingPage(),
      ),

      GoRoute(
        path: '/start',
        builder: (context, state) => const StartPage(),
      ),

      GoRoute(
        path: '/login',
        builder: (context, state) =>  const LoginPage(),
      ),

      GoRoute(
        path: '/register',
        builder: (context, state) =>  const RegisterPage(),
      ),


      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
