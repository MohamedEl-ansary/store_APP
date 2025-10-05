import 'package:flutter/material.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';

/// Builds a CheckboxThemeData based on the provided ColorScheme.
/// Uses colorScheme for consistent light/dark mapping.
CheckboxThemeData buildCheckboxTheme(ColorScheme colorScheme) {
  return CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return colorScheme.onSurface.setOpacity(0.12);
      }
      return states.contains(WidgetState.selected)
          ? colorScheme.primary
          : colorScheme.surfaceContainerLow;
    }),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return colorScheme.onSurface.setOpacity(0.38);
      }
      return colorScheme.onPrimary;
    }),
    overlayColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.pressed)) {
        return colorScheme.primary.setOpacity(0.10);
      }
      if (states.contains(WidgetState.hovered) ||
          states.contains(WidgetState.focused)) {
        return colorScheme.primary.setOpacity(0.05);
      }
      return Colors.transparent;
    }),
    side: BorderSide(color: colorScheme.outline),
  );
}
