import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:saber_static_ui/shared_preferences/providers/providers.dart';
import 'package:saber_static_ui/shared_preferences/services/shared_preferences_notifier.dart';
import 'package:saber_static_ui/themes/models/theme_option.dart';

/// Theme mode provider for app-wide theme state
final themeModeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
  (ref) => ThemeNotifier(ref.watch(preferencesNotifierProvider.notifier)),
);

/// Provider to access the current theme option
final currentThemeOptionProvider = Provider<ThemeOption>((ref) {
  final themeMode = ref.watch(themeModeProvider);
  return ThemeOption.fromMode(themeMode);
});

/// Theme mode state notifier that manages light/dark mode with persistence
class ThemeNotifier extends StateNotifier<ThemeMode> {
  /// Initialize the notifier, loading saved preference if available
  ThemeNotifier(this._prefsNotifier) : super(ThemeMode.light) {
    _loadSavedTheme();
  }

  final SharedPreferencesNotifier _prefsNotifier;
  static const _themePrefsKey = 'theme_mode';

  /// Load the theme preference from SharedPreferences
  void _loadSavedTheme() {
    try {
      final themeModeString = _prefsNotifier.getString(_themePrefsKey);

      if (themeModeString.isEmpty) {
        // Default to light theme if no saved preference
        state = ThemeMode.light;
        return;
      }

      state = switch (themeModeString) {
        'light' => ThemeMode.light,
        'dark' => ThemeMode.dark,
        'system' => ThemeMode.system,
        _ => ThemeMode.light,
      };
    } catch (e) {
      // Default to light theme if there's an error
      state = ThemeMode.light;
    }
  }

  /// Toggle between light and dark themes
  Future<void> toggleTheme() async {
    final newMode = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await setTheme(newMode);
  }

  /// Set theme explicitly to light, dark, or system mode
  Future<void> setTheme(ThemeMode mode) async {
    if (state == mode) return;

    try {
      // Save theme mode as a string
      final modeString = mode
          .toString()
          .split('.')
          .last; // Converts 'ThemeMode.light' to 'light'
      await _prefsNotifier.setString(_themePrefsKey, modeString);
    } catch (e) {
      // Continue even if saving fails
    }

    state = mode;
  }

  /// Utility to check if current theme is dark
  bool get isDarkMode => state == ThemeMode.dark;
}
