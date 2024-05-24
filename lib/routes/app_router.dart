import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_test/screens/home_screen.dart';
import 'package:todo_app_test/screens/auth_screen.dart';
import 'package:todo_app_test/screens/settings_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: HomeScreen.route,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: SettingsScreen.route,
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: AuthScreen.route,
      builder: (context, state) => const AuthScreen(),
    ),
  ],
  redirect: (context, state) {
    final bool loggedIn = FirebaseAuth.instance.currentUser != null;
    if (!loggedIn) {
      return AuthScreen.route;
    }
    return null;
  },
);
