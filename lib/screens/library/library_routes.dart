import 'package:go_router/go_router.dart';
import 'package:uolia_app/screens/library/library_screen.dart';

/// Library screen routes
class LibraryRoutes {
  /// GoRoute config for Library screen
  static final route = GoRoute(
    path: '/library',
    pageBuilder: (context, state) => NoTransitionPage(
      key: state.pageKey,
      child: LibraryScreen(),
    ),
  );
}
