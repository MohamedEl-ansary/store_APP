import 'package:flutter/material.dart';
import 'package:saber_static_ui/themes/app_colors.dart';
import 'package:saber_static_ui/themes/components/app_bar_theme.dart';
import 'package:saber_static_ui/themes/components/bottom_sheet_theme.dart';
import 'package:saber_static_ui/themes/components/buttons_theme.dart';
import 'package:saber_static_ui/themes/components/checkbox_theme.dart';
import 'package:saber_static_ui/themes/components/input_decoration_theme.dart';
import 'package:saber_static_ui/themes/components/radio_theme.dart';
import 'package:saber_static_ui/themes/components/slider_theme.dart';
import 'package:saber_static_ui/themes/components/switch_theme.dart';
import 'package:saber_static_ui/themes/components/toggle_buttons_theme.dart';
import 'package:saber_static_ui/themes/extensions/app_semantic_colors.dart';

// ========================================================
// FONT CONFIGURATION
// ========================================================

/// Font family names from pubspec.yaml
/// Updated to match Figma design system
const String _fontFamilyArabic = 'IBMPlexSansArabic';
const String _fontFamilyEnglish = 'stc';

/// Helper function to get the appropriate font family based on locale
String getFontFamily(Locale locale) {
  // Use Arabic font for 'ar' locale, English font for others
  return locale.languageCode == 'ar' ? _fontFamilyArabic : _fontFamilyEnglish;
}

// ========================================================
// TEXT THEME BUILDER (SINGLE SOURCE OF TRUTH)
// ========================================================

/// Creates the complete TextTheme based on the Figma design system.
/// This single function is used for both light and dark themes to ensure consistency.
///
/// Font sizes are mapped from Figma design system:
/// - 32px → headlineLarge
/// - 28px → headlineMedium
/// - 24px → headlineSmall
/// - 20px → titleLarge (overrides Material's 22px)
/// - 16px → titleMedium & bodyLarge
/// - 14px → titleSmall, bodyMedium & labelLarge
/// - 12px → bodySmall & labelMedium
/// - 10px → labelSmall (overrides Material's 11px)
TextTheme _buildTextTheme({
  required String fontFamily,
  required Color displayColor,
  required Color bodyColor,
  required Color labelColor,
}) {
  return TextTheme(
    // Display styles - Not in Figma, using reasonable defaults
    displayLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 48,
      // Reduced from 57 for better mobile fit
      fontWeight: FontWeight.w400,
      color: displayColor,
      height: 1.2,
    ),
    displayMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 40,
      // Reduced from 45
      fontWeight: FontWeight.w400,
      color: displayColor,
      height: 1.2,
    ),
    displaySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 36,
      fontWeight: FontWeight.w400,
      color: displayColor,
      height: 1.22,
    ),

    // Headline styles - From Figma
    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 32,
      // Figma: 32px
      fontWeight: FontWeight.w400,
      color: displayColor,
      height: 1.25,
    ),
    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 28,
      // Figma: 28px
      fontWeight: FontWeight.w400,
      color: displayColor,
      height: 1.25,
    ),
    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 24,
      // Figma: 24px
      fontWeight: FontWeight.w400,
      color: displayColor,
      height: 1.33,
    ),

    // Title styles - From Figma
    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 20,
      // Figma: 20px (overrides Material's 22px)
      fontWeight: FontWeight.w500,
      color: displayColor,
      height: 1.4,
    ),
    titleMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      // Figma: 16px
      fontWeight: FontWeight.w500,
      color: bodyColor,
      height: 1.5,
    ),
    titleSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      // Figma: 14px
      fontWeight: FontWeight.w500,
      color: bodyColor,
      height: 1.43,
    ),

    // Body styles - From Figma
    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      // Figma: 16px
      fontWeight: FontWeight.w400,
      color: bodyColor,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      // Figma: 14px
      fontWeight: FontWeight.w400,
      color: bodyColor,
      height: 1.43,
    ),
    bodySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      // Figma: 12px
      fontWeight: FontWeight.w400,
      color: bodyColor,
      height: 1.33,
    ),

    // Label styles - From Figma
    labelLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      // Figma: 14px (for buttons, etc.)
      fontWeight: FontWeight.w500,
      color: labelColor,
      height: 1.43,
    ),
    labelMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      // Figma: 12px
      fontWeight: FontWeight.w500,
      color: labelColor,
      height: 1.33,
    ),
    labelSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 10,
      // Figma: 10px (overrides Material's 11px)
      fontWeight: FontWeight.w400,
      color: labelColor,
      height: 1.25,
    ),
  );
}

// ========================================================
// COLOR SCHEMES
// ========================================================

/// Private light palette used only inside the theme. Prevents exposing
/// brightness-specific values through [AppColors].
const Color _lightSurface = Color(0xFFFDFDFF);
const Color _lightSurfaceLowest = Color(0xFFFFFFFF);
const Color _lightSurfaceLow = Color(0xFFF4F5F9);
const Color _lightSurfaceContainer = Color(0xFFF4F5F9);
const Color _lightSurfaceHigh = Color(0xFFEBEDF5);
const Color _lightSurfaceHighest = Color(0xFFFCFCFF);
const Color _lightOnSurface = Color(0xFF161616);
const Color _lightOnSurfaceVariant = Color(0xFF646464);
const Color _lightOutline = Color(0xFFE6E6E6);
const Color _lightOutlineVariant = Color(0xFFD8D8D8);
const Color _lightInverseSurface = Color(0xFF161616);
const Color _lightShadow = Color(0x1A151937);

/// Private dark palette used for the dark theme. Kept here so it stays
/// inaccessible to the rest of the app and can be tweaked without exposing
/// brightness-specific colors through [AppColors].
const Color _darkSurface = Color(0xFF121212);
const Color _darkSurfaceLowest = Color(0xFF0E0E0E);
const Color _darkSurfaceLow = Color(0xFF1A1A1A);
const Color _darkSurfaceContainer = Color(0xFF1F1F1F);
const Color _darkSurfaceHigh = Color(0xFF262626);
const Color _darkSurfaceHighest = Color(0xFF2B2B2B);
const Color _darkOnSurface = Color(0xFFE6E6E6);
const Color _darkOnSurfaceVariant = Color(0xFFB3B3B3);
const Color _darkOutline = Color(0xFF3A3A3A);
const Color _darkOutlineVariant = Color(0xFF2D2D2D);

/// Light theme color scheme definition
final ColorScheme _colorSchemeLight = ColorScheme(
  brightness: Brightness.light,

  // Primary colors
  primary: AppColors.primary,
  onPrimary: AppColors.white,
  primaryContainer: AppColors.primaryTint,
  onPrimaryContainer: AppColors.primary,

  // Secondary colors
  secondary: AppColors.primaryShade,
  onSecondary: AppColors.white,
  secondaryContainer: AppColors.primaryTint,
  onSecondaryContainer: AppColors.primaryShade,

  // Error colors
  error: AppColors.error,
  onError: AppColors.white,
  errorContainer: AppSemanticColors.light.dangerContainer,
  onErrorContainer: AppColors.error,

  // Surface colors
  surface: _lightSurface,
  onSurface: _lightOnSurface,
  surfaceContainerLowest: _lightSurfaceLowest,
  surfaceContainerLow: _lightSurfaceLow,
  surfaceContainer: _lightSurfaceContainer,
  surfaceContainerHigh: _lightSurfaceHigh,
  surfaceContainerHighest: _lightSurfaceHighest,
  onSurfaceVariant: _lightOnSurfaceVariant,
  // Border colors
  outline: _lightOutline,
  outlineVariant: _lightOutlineVariant,

  // Utility colors
  shadow: _lightShadow,
  scrim: AppColors.black,
  inverseSurface: _lightInverseSurface,
  onInverseSurface: AppColors.white,
  inversePrimary: AppColors.primaryShade,

  // Surface tint for elevation
  surfaceTint: AppColors.primary,
);

/// Dark theme color scheme definition
final ColorScheme _colorSchemeDark = ColorScheme(
  brightness: Brightness.dark,

  // Primary brand (kept for actions)
  primary: AppColors.primary,
  onPrimary: AppColors.white,
  primaryContainer: AppColors.primary,
  onPrimaryContainer: AppColors.white,

  // Secondary accents
  secondary: AppColors.primaryShade,
  onSecondary: AppColors.white,
  secondaryContainer: AppColors.primaryTint,
  onSecondaryContainer: AppColors.primaryShade,

  // Error colors
  error: AppColors.error,
  onError: AppColors.white,
  errorContainer: AppSemanticColors.dark.dangerContainer,
  onErrorContainer: AppColors.error,

  // Neutral surfaces
  surface: _darkSurface,
  onSurface: _darkOnSurface,
  surfaceContainerLowest: _darkSurfaceLowest,
  surfaceContainerLow: _darkSurfaceLow,
  surfaceContainer: _darkSurfaceContainer,
  surfaceContainerHigh: _darkSurfaceHigh,
  surfaceContainerHighest: _darkSurfaceHighest,
  onSurfaceVariant: _darkOnSurfaceVariant,

  // Border colors
  outline: _darkOutline,
  outlineVariant: _darkOutlineVariant,

  // Utility colors
  shadow: const Color(0x4D000000),
  scrim: AppColors.black,
  inverseSurface: AppColors.white,
  onInverseSurface: AppColors.black,
  inversePrimary: AppColors.primary,

  // No tint overlay for dark elevation
  surfaceTint: Colors.transparent,
);

// ========================================================
// THEME DATA BUILDERS
// ========================================================

/// Light theme data for the application
ThemeData lightTheme({Locale locale = const Locale('ar')}) {
  final fontFamily = getFontFamily(locale);
  final textTheme = _buildTextTheme(
    fontFamily: fontFamily,
    displayColor: AppColors.black,
    bodyColor: AppColors.black,
    labelColor: AppColors.gray700,
  );

  final theme = ThemeData(
    useMaterial3: true,
    colorScheme: _colorSchemeLight,
    scaffoldBackgroundColor: _lightSurfaceHighest,
    fontFamily: fontFamily,
    textTheme: textTheme,
    splashColor: AppColors.transparent,
    highlightColor: AppColors.transparent,
    appBarTheme: buildAppBarTheme(
      colorScheme: _colorSchemeLight,
      scaffoldBackground: _lightSurfaceHighest,
    ),
    inputDecorationTheme: buildInputDecorationTheme(_colorSchemeLight),
    buttonTheme: buildButtonTheme(),
    bottomSheetTheme: buildBottomSheetTheme(_colorSchemeLight),
    switchTheme: buildSwitchTheme(_colorSchemeLight),
    radioTheme: buildRadioTheme(_colorSchemeLight),
    sliderTheme: buildSliderTheme(_colorSchemeLight),
    toggleButtonsTheme: buildToggleButtonsTheme(_colorSchemeLight),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionHandleColor: AppColors.primary,
    ),
    checkboxTheme: buildCheckboxTheme(_colorSchemeLight),
    elevatedButtonTheme: buildElevatedButtonTheme(isDark: false),
  );

  return theme.copyWith(extensions: [AppSemanticColors.light]);
}

/// Dark theme data for the application
ThemeData darkTheme({Locale locale = const Locale('ar')}) {
  final fontFamily = getFontFamily(locale);
  final textTheme = _buildTextTheme(
    fontFamily: fontFamily,
    displayColor: AppColors.white,
    bodyColor: AppColors.white,
    labelColor: AppColors.gray500,
  );

  final theme = ThemeData(
    useMaterial3: true,
    colorScheme: _colorSchemeDark,
    scaffoldBackgroundColor: _colorSchemeDark.surface,
    fontFamily: fontFamily,
    textTheme: textTheme,
    splashColor: AppColors.transparent,
    highlightColor: AppColors.transparent,
    appBarTheme: buildAppBarTheme(
      colorScheme: _colorSchemeDark,
      scaffoldBackground: _colorSchemeDark.surface,
    ),
    inputDecorationTheme: buildInputDecorationTheme(_colorSchemeDark),
    buttonTheme: buildButtonTheme(),
    bottomSheetTheme: buildBottomSheetTheme(_colorSchemeDark),
    switchTheme: buildSwitchTheme(_colorSchemeDark),
    radioTheme: buildRadioTheme(_colorSchemeDark),
    sliderTheme: buildSliderTheme(_colorSchemeDark),
    toggleButtonsTheme: buildToggleButtonsTheme(_colorSchemeDark),
    cardColor: _colorSchemeDark.surfaceContainerLow,
    cardTheme: CardThemeData(
      color: _colorSchemeDark.surfaceContainerLow,
      surfaceTintColor: Colors.transparent,
    ),
    dialogTheme: const DialogThemeData(
      backgroundColor: _darkSurface,
      surfaceTintColor: Colors.transparent,
    ),
    checkboxTheme: buildCheckboxTheme(_colorSchemeDark),
    drawerTheme: const DrawerThemeData(backgroundColor: _darkSurface),
    popupMenuTheme: const PopupMenuThemeData(
      color: _darkSurfaceLow,
      surfaceTintColor: Colors.transparent,
    ),
    elevatedButtonTheme: buildElevatedButtonTheme(isDark: true),
    textButtonTheme: buildTextButtonTheme(isDark: true),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionHandleColor: AppColors.primary,
    ),
  );

  return theme.copyWith(extensions: [AppSemanticColors.dark]);
}

// ========================================================
// THEME EXTENSIONS & UTILITIES
// ========================================================

/// Extensions for the theme to provide additional convenient properties
extension AppThemeX on ThemeData {
  /// Light shadow color based on theme brightness
  Color get lightShadow => brightness == Brightness.light
      ? _lightShadow
      : const Color(0x4D000000); // black with 30% opacity

  /// Gradient colors for backgrounds and buttons
  List<Color> get gradientColors => [
    colorScheme.primary,
    colorScheme.secondary,
  ];

  List<Color> get premiumGradientColors => const [
    Color(0xFF9D06FE),
    Color(0xFF3D3CEE),
  ];

  Color get categoriesSectionBG => brightness == Brightness.light
      ? const Color(0xFFF6F8FF)
      : const Color.fromARGB(255, 33, 32, 42);

  Color get boxContainerBackground => brightness == Brightness.light
      ? const Color(0xFFF9FAFB)
      : const Color(0xFF000000);

  AppSemanticColors get semantic =>
      extension<AppSemanticColors>() ??
      (brightness == Brightness.dark
          ? AppSemanticColors.dark
          : AppSemanticColors.light);
}

/// Extension to add missing Figma type sizes to TextTheme
/// These sizes are from the Figma design system but don't have
/// direct equivalents in Material Design 3.
///
/// IMPORTANT: Before using these, check if a standard TextTheme property
/// would work instead:
/// - titleLarge (20px) instead of body20
/// - labelSmall (10px) for small captions
extension FigmaTextTheme on TextTheme {
  /// 8px text style - micro text (use sparingly)
  TextStyle get caption8 => labelSmall!.copyWith(fontSize: 8, height: 1.25);

  /// 6px text style - ultra micro text (use very sparingly)
  TextStyle get micro6 => labelSmall!.copyWith(fontSize: 6, height: 1.25);

  /// 5px text style - absolute minimum size (avoid if possible)
  TextStyle get micro5 => labelSmall!.copyWith(fontSize: 5, height: 1.25);
}
