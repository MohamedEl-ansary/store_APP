import 'package:flutter/material.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';

/// Builds a SwitchThemeData based on the provided ColorScheme.
/// Follow theme mappings from themes/README.md for on/off/disabled states.
SwitchThemeData buildSwitchTheme(ColorScheme colorScheme) {
  return SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return colorScheme.onSurface.setOpacity(0.38);
      }
      return states.contains(WidgetState.selected)
          ? colorScheme.onPrimary
          : colorScheme.onSurfaceVariant;
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return colorScheme.onSurface.setOpacity(0.12);
      }
      return states.contains(WidgetState.selected)
          ? colorScheme.primary
          : colorScheme.surfaceContainerHighest;
    }),
    trackOutlineColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return colorScheme.onSurface.setOpacity(0.12);
      }
      return states.contains(WidgetState.selected)
          ? colorScheme.primary.setOpacity(0.5)
          : colorScheme.outline;
    }),
    trackOutlineWidth: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) return 1.0;
      return states.contains(WidgetState.selected) ? 1.5 : 1.0;
    }),
  );
}
