import 'package:flutter/material.dart';

/// Model representing a theme option in the application
class ThemeOption {
  /// Creates a new theme option
  const ThemeOption({
    required this.mode,
    required this.name,
    required this.icon,
  });

  /// The theme mode
  final ThemeMode mode;

  /// Display name
  final String name;

  /// Icon representing this theme
  final IconData icon;

  /// List of all available theme options
  static const List<ThemeOption> all = [
    ThemeOption(
      mode: ThemeMode.light,
      name: 'Light Mode',
      icon: Icons.light_mode_outlined,
    ),
    ThemeOption(
      mode: ThemeMode.dark,
      name: 'Dark Mode',
      icon: Icons.dark_mode_outlined,
    ),
    ThemeOption(
      mode: ThemeMode.system,
      name: 'System Default',
      icon: Icons.settings_outlined,
    ),
  ];

  /// Get an option by its theme mode
  static ThemeOption fromMode(ThemeMode mode) {
    return all.firstWhere(
      (option) => option.mode == mode,
      orElse: () => all[0], // Default to light mode
    );
  }
}
