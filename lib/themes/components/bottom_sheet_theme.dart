import 'package:flutter/material.dart';

BottomSheetThemeData buildBottomSheetTheme(ColorScheme colorScheme) {
  final isDark = colorScheme.brightness == Brightness.dark;
  final backgroundColor = isDark
      ? colorScheme.surfaceContainer
      : colorScheme.surfaceContainerLowest;

  return BottomSheetThemeData(
    backgroundColor: backgroundColor,
    modalBackgroundColor: backgroundColor,
    surfaceTintColor: Colors.transparent,
    elevation: 8,
    clipBehavior: Clip.antiAlias,
    showDragHandle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.only(
        topStart: Radius.circular(16),
        topEnd: Radius.circular(16),
      ),
    ),
  );
}
