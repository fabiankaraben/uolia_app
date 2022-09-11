import 'package:go_router/go_router.dart';
import 'package:uolia_app/screens/root/root_screen.dart';

/// Root screen routes
class RootRoutes {
  /// GoRoute config for Root screen
  static final route = GoRoute(
    path: '/',
    pageBuilder: (context, state) => NoTransitionPage(
      key: state.pageKey,
      child: const RootScreen(),
    ),
  );
}
