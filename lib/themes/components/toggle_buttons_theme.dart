import 'package:flutter/material.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';

ToggleButtonsThemeData buildToggleButtonsTheme(ColorScheme colorScheme) {
  return ToggleButtonsThemeData(
    color: colorScheme.onSurface,
    selectedColor: colorScheme.onPrimary,
    disabledColor: colorScheme.onSurface.setOpacity(0.38),
    fillColor: colorScheme.primary,
    borderColor: colorScheme.outline,
    selectedBorderColor: colorScheme.primary,
    hoverColor: colorScheme.primary.setOpacity(0.05),
    splashColor: colorScheme.primary.setOpacity(0.10),
    textStyle: const TextStyle(fontWeight: FontWeight.w500),
    borderRadius: BorderRadius.circular(6),
    constraints: const BoxConstraints(minHeight: 40, minWidth: 40),
    borderWidth: 1,
  );
}
