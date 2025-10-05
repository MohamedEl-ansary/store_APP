import 'package:flutter/material.dart';

AppBarTheme buildAppBarTheme({
  required ColorScheme colorScheme,
  required Color scaffoldBackground,
}) {
  final isDark = colorScheme.brightness == Brightness.dark;
  final backgroundColor = isDark ? colorScheme.surface : scaffoldBackground;
  final foregroundColor = isDark ? colorScheme.onSurface : colorScheme.primary;

  return AppBarTheme(
    // Match scaffold background by default for seamless pages
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(
      color: foregroundColor,
    ),
  );
}
