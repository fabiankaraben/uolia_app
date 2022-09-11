import 'package:go_router/go_router.dart';
import 'package:uolia_app/screens/editor/editor_screen.dart';

/// Editor screen routes
class EditorRoutes {
  /// GoRoute config for Editor screen
  static final route = GoRoute(
    path: '/editor',
    pageBuilder: (context, state) => NoTransitionPage(
      key: state.pageKey,
      child: const EditorScreen(),
    ),
  );
}
