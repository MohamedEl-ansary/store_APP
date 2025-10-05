import 'package:flutter/material.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saber_static_ui/themes/theme_provider.dart';

/// A widget that allows toggling between light and dark themes
class ThemeToggle extends ConsumerWidget {
  /// Create a theme toggle with customizable icon sizes
  const ThemeToggle({
    super.key,
    this.iconSize = 24.0,
  });

  /// The size of the toggle icon
  final double iconSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.themeData;
    final themeModeNotifier = ref.watch(themeModeProvider.notifier);
    final isLightMode = ref.watch(themeModeProvider) == ThemeMode.light;

    return IconButton(
      tooltip: isLightMode ? 'Switch to dark mode' : 'Switch to light mode',
      onPressed: themeModeNotifier.toggleTheme,
      icon: Icon(
        isLightMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
        size: iconSize,
        color: theme.colorScheme.onSurface,
      ),
    );
  }
}

/// A switch that toggles between light and dark themes
class ThemeSwitch extends ConsumerWidget {
  /// Creates a theme switch with optional label
  const ThemeSwitch({
    super.key,
    this.showLabel = true,
  });

  /// Whether to show labels next to the switch
  final bool showLabel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.themeData;
    final themeModeNotifier = ref.watch(themeModeProvider.notifier);
    final isLightMode = ref.watch(themeModeProvider) == ThemeMode.light;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showLabel)
          Text(
            isLightMode ? 'Light mode' : 'Dark mode',
            style: theme.bodyMedium,
          ),
        const SizedBox(width: 8),
        Switch(
          value: !isLightMode,
          onChanged: (_) => themeModeNotifier.toggleTheme(),
        ),
      ],
    );
  }
}
