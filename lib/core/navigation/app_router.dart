import 'package:go_router/go_router.dart';
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
        builder: (context, state) => const OnboadingPage(),
      ),
    ],
  );
}
