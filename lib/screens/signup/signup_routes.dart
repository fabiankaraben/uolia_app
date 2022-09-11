import 'package:go_router/go_router.dart';
import 'package:uolia_app/screens/signup/signup_screen.dart';

/// Sign Up screen routes
class SignupRoutes {
  /// GoRoute config for Sign Up screen
  static final route = GoRoute(
    path: '/signup',
    pageBuilder: (context, state) => NoTransitionPage(
      key: state.pageKey,
      child: const SignupScreen(),
    ),
  );
}
