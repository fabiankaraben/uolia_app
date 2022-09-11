import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uolia_app/app/providers/app_provider.dart';
import 'package:uolia_app/app/providers/locale_provider.dart';
import 'package:uolia_app/app/themes/colors.dart';

/// Library Screen
class LibraryScreen extends ConsumerWidget {
  /// Library Screen
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the `CustomColors` typed object in the `ThemeData` extension
    final customColors = Theme.of(context).extension<CustomColors>()!;
    final l10n = AppLocalizations.of(context)!;

    final locale = ref.watch(localeProvider);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Library ${l10n.gotIt}'),
          const SizedBox(height: 30, width: double.infinity),
          const _ToggleThemeIconButton(),
          const SizedBox(height: 30, width: double.infinity),
          Text(locale != null ? locale.toString() : 'System'),
          const SizedBox(height: 30, width: double.infinity),
          OutlinedButton(
            onPressed: () => ref.read(localeProvider.notifier).toggle(),
            child: const Text('Toggle language'),
          ),
          const SizedBox(height: 30, width: double.infinity),
          OutlinedButton(
            onPressed: () {
              ref.read(localeProvider.notifier).locale = const Locale('es');
            },
            child: const Text('Change language to ES'),
          ),
          const SizedBox(height: 30, width: double.infinity),
          OutlinedButton(
            onPressed: () {
              ref.read(localeProvider.notifier).locale = const Locale('en');
            },
            child: const Text('Change language to EN'),
          ),
          const SizedBox(height: 30, width: double.infinity),
          OutlinedButton(
            onPressed: () => ref.read(localeProvider.notifier).setSystem(),
            child: const Text('Change language System'),
          ),
        ],
      ),
    );
  }
}

class _ToggleThemeIconButton extends StatefulWidget {
  const _ToggleThemeIconButton();

  @override
  State<_ToggleThemeIconButton> createState() => _ToggleThemeIconButtonState();
}

class _ToggleThemeIconButtonState extends State<_ToggleThemeIconButton> {
  AdaptiveThemeMode mode = AdaptiveThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AdaptiveThemeMode>(
      future: Future.microtask(
        () async =>
            await AdaptiveTheme.getThemeMode() ?? AdaptiveThemeMode.light,
      ),
      initialData: AdaptiveThemeMode.light,
      builder: (context, snapshot) {
        mode = snapshot.data!;
        return IconButton(
          icon: Icon(
            mode == AdaptiveThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode,
          ),
          onPressed: () async {
            if (await AdaptiveTheme.getThemeMode() == AdaptiveThemeMode.light) {
              AdaptiveTheme.of(context).setDark();
              setState(() => mode = AdaptiveThemeMode.dark);
            } else {
              AdaptiveTheme.of(context).setLight();
              setState(() => mode = AdaptiveThemeMode.light);
            }
          },
        );
      },
    );
  }
}
