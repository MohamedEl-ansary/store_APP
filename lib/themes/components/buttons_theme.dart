import 'package:flutter/material.dart';
import 'package:saber_static_ui/themes/app_colors.dart';

ButtonThemeData buildButtonTheme() {
  return ButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
}

ElevatedButtonThemeData buildElevatedButtonTheme({required bool isDark}) {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: const WidgetStatePropertyAll(AppColors.white),
      backgroundColor: const WidgetStatePropertyAll(AppColors.primary),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}

TextButtonThemeData buildTextButtonTheme({required bool isDark}) {
  if (!isDark) {
    // Preserve existing behavior: no explicit styling for light
    return const TextButtonThemeData();
  }

  return TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) => AppColors.primary,
      ),
    ),
  );
}
