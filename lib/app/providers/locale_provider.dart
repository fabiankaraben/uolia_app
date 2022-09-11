import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// StateNotifier for [localeProvider].
class LocaleNotifier extends StateNotifier<Locale?> {
  /// We initialize the locale with null, the system locale.
  LocaleNotifier() : super(null);

  /// Change the current [Locale]. Use null for system locale.
  set locale(Locale? locale) {
    state = locale;
    // Save on local storage
  }

  /// Get the current [Locale], or null for system locale.
  Locale? get locale => state;

  /// Set [Locale] to the system locale
  void setSystem() {
    locale = null;
  }

  /// Toggle the locale, using supported locales, and system locale as well.
  void toggle() {
    const locales = AppLocalizations.supportedLocales;
    if (locales.isEmpty) {
      // Exit to avoid errors, system locale is set by default
      return;
    }
    final localeIdx = state != null ? locales.indexOf(state!) : -1;
    if (localeIdx == -1) {
      // Set the first supported locale if is system or unsupported locale.
      locale = locales.first;
    } else if (localeIdx == locales.length - 1) {
      // Set the system locale after the last supported locale.
      locale = null;
    } else {
      // Set the next supported locale.
      locale = locales[localeIdx + 1];
    }
  }
}

/// App [Locale] provider
final localeProvider = StateNotifierProvider<LocaleNotifier, Locale?>((ref) {
  return LocaleNotifier();
});
