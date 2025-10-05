import 'package:flutter/material.dart';

/// Design tokens for colors used throughout the app
/// This centralizes all color definitions for consistency
/// Updated to match Figma design system (2025-01-25)
///
/// Single source of truth for all colors - no duplication
abstract class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // ========================================================
  // Primary & Brand Colors
  // ========================================================
  static const Color primary = Color(0xFF3B479D); // Foundation/MainBlue/Primary
  static const Color brandRed = Color(0xFFFF0C00); // Foundation/Red in logo

  // ========================================================
  // Neutral Colors
  // ========================================================
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF161616); // From Figma design system

  // ========================================================
  // Gray Scale & supporting brand ramps
  // ========================================================
  static const Color gray500 = Color(0xFF929292); // Light gray
  static const Color gray600 = Color(0xFF7A7A7A); // Medium-light gray
  static const Color gray700 = Color(0xFF646464); // Medium gray
  static const Color gray800 = Color(0xFF393939); // Dark gray
  static const Color grayStroke = Color(0xFFE6E6E6); // General border color

  static const Color primaryTint = Color(0xFFE7ECFC); // Soft brand tint
  static const Color primaryShade = Color(0xFF616AA8); // Slight brand shade

  // Note: keep primaryDark* for interactive brand states if needed,
  // but do not use them as surfaces any more.
  // ========================================================
  // Semantic Colors (Alerts)
  // ========================================================
  // Foreground (Text/Icon) Colors
  static const Color error = Color(0xFFD92D20);
  static const Color info = Color(0xFF1570EF);
  static const Color success = Color(0xFF079455);
  static const Color warning = Color(0xFFDC6803);

  // ========================================================
  // Utility Colors
  // ========================================================
  static const Color transparent = Colors.transparent;
  static const Color gold = Colors.orange;
}
