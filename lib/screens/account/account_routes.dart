import 'package:go_router/go_router.dart';
import 'package:uolia_app/screens/account/account_screen.dart';

/// Account screen routes
class AccountRoutes {
  /// GoRoute config for Account screen
  static final route = GoRoute(
    path: '/account',
    pageBuilder: (context, state) => NoTransitionPage(
      key: state.pageKey,
      child: const AccountScreen(),
    ),
  );
}
