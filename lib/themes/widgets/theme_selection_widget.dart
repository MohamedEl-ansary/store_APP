import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saber_static_ui/themes/models/theme_option.dart';
import 'package:saber_static_ui/themes/theme_provider.dart';

/// A standalone widget for selecting the application theme
class ThemeSelectionWidget extends ConsumerWidget {
  /// Creates a new theme selection widget
  const ThemeSelectionWidget({
    super.key,
    this.useRadioTiles = true,
    this.includeSystemOption = false,
  });

  /// Whether to use radio tiles (true) or a switch (false)
  final bool useRadioTiles;

  /// Whether to include the system default option
  /// Only applicable when useRadioTiles is true
  final bool includeSystemOption;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentThemeMode = ref.watch(themeModeProvider);
    final themeNotifier = ref.read(themeModeProvider.notifier);

    if (useRadioTiles) {
      final themeOptions = ThemeOption.all.where(
        (option) => includeSystemOption || option.mode != ThemeMode.system,
      );

      return RadioGroup<ThemeMode>(
        groupValue: currentThemeMode,
        onChanged: (value) {
          if (value != null) {
            themeNotifier.setTheme(value);
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Create radio tiles for each theme option
            ...themeOptions.map(
              (option) => RadioListTile<ThemeMode>(
                title: Text(option.name),
                value: option.mode,
                activeColor: Theme.of(context).colorScheme.primary,
                secondary: Icon(option.icon),
              ),
            ),
          ],
        ),
      );
    } else {
      // If we're in switch mode, we'll use two items if includeSystemOption is true
      if (includeSystemOption) {
        final isSystem = currentThemeMode == ThemeMode.system;
        final isDark = isSystem
            ? Theme.of(context).brightness == Brightness.dark
            : currentThemeMode == ThemeMode.dark;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // System theme toggle
            SwitchListTile(
              title: const Text('Use System Theme'),
              value: isSystem,
              onChanged: (value) {
                if (value) {
                  themeNotifier.setTheme(ThemeMode.system);
                } else {
                  // When turning off system, use the current effective theme (light/dark)
                  themeNotifier
                      .setTheme(isDark ? ThemeMode.dark : ThemeMode.light);
                }
              },
              secondary: const Icon(Icons.settings_outlined),
            ),

            // Dark mode toggle - disabled when using system theme
            SwitchListTile(
              title: Text(isDark ? 'Dark Mode' : 'Light Mode'),
              subtitle:
                  isSystem ? const Text('Controlled by system settings') : null,
              value: isDark,
              onChanged: isSystem
                  ? null // Disabled when using system theme
                  : (_) => themeNotifier.toggleTheme(),
              secondary: Icon(
                isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
              ),
            ),
          ],
        );
      } else {
        // Simple switch for light/dark only (no system option)
        final isDark = currentThemeMode == ThemeMode.dark;

        return SwitchListTile(
          title: Text(isDark ? 'Dark Mode' : 'Light Mode'),
          value: isDark,
          onChanged: (_) => themeNotifier.toggleTheme(),
          secondary: Icon(
            isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
          ),
        );
      }
    }
  }
}
