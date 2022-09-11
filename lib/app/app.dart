import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:uolia_app/app/providers/locale_provider.dart';
import 'package:uolia_app/app/themes/themes.dart';
import 'package:uolia_app/screens/routes.dart';

/// App Widget
class App extends ConsumerWidget {
  /// App Widget
  App({super.key});

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      RootRoutes.route,
      LoginRoutes.route,
      SignupRoutes.route,
      AccountRoutes.route,
      LibraryRoutes.route,
      EditorRoutes.route,
    ],
    redirect: (state) {
      // Redirect root path to Library screen
      if (state.subloc == RootRoutes.route.path) {
        return LibraryRoutes.route.path;
      }
      return null;
    },
    // For web: use URLs without '#' character
    urlPathStrategy: UrlPathStrategy.path,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return AdaptiveTheme(
      light: LightTheme.data.copyWith(
        extensions: [CustomColors.light],
      ),
      dark: DarkTheme.data.copyWith(
        extensions: [CustomColors.dark],
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp.router(
        title: kIsWeb ? 'Video Notes and Bookmarks - Uolia' : 'Uolia',
        builder: (context, child) => ResponsiveWrapper.builder(
          child,
          defaultScale: true,
          minWidth: 360,
          defaultName: MOBILE,
          breakpoints: const [
            ResponsiveBreakpoint.resize(360),
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.resize(640, name: 'MOBILE_LARGE'),
            // ResponsiveBreakpoint.autoScale(850, name: TABLET),
            ResponsiveBreakpoint.resize(850, name: TABLET),
            ResponsiveBreakpoint.resize(1080, name: DESKTOP),
          ],
          // background: Container(
          //   color: Color(0xFFF5F5F5),
          // ),
        ),
        // Routing
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        // Theming
        theme: theme,
        darkTheme: darkTheme,
        // Localization
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: locale,
        // General
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
