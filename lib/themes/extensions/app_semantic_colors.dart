import 'package:flutter/material.dart';
import 'package:saber_static_ui/themes/app_colors.dart' show AppColors;

/// Theme-managed semantic container colors that adapt to brightness.
/// Foreground semantic tokens stay in [AppColors].
@immutable
class AppSemanticColors extends ThemeExtension<AppSemanticColors> {
  const AppSemanticColors({
    required this.successContainer,
    required this.infoContainer,
    required this.warningContainer,
    required this.dangerContainer,
  });

  final Color successContainer;
  final Color infoContainer;
  final Color warningContainer;
  final Color dangerContainer;

  static const AppSemanticColors light = AppSemanticColors(
    successContainer: Color(0xFFE7FDEF),
    infoContainer: Color(0xFFF5FAFF),
    warningContainer: Color(0xFFFDF8E7),
    dangerContainer: Color(0xFFFFF4F2),
  );

  static const AppSemanticColors dark = AppSemanticColors(
    successContainer: Color(0x33E7FDEF),
    infoContainer: Color(0x33F5FAFF),
    warningContainer: Color(0x33FDF8E7),
    dangerContainer: Color(0x33FFF4F2),
  );

  @override
  AppSemanticColors copyWith({
    Color? successContainer,
    Color? infoContainer,
    Color? warningContainer,
    Color? dangerContainer,
  }) {
    return AppSemanticColors(
      successContainer: successContainer ?? this.successContainer,
      infoContainer: infoContainer ?? this.infoContainer,
      warningContainer: warningContainer ?? this.warningContainer,
      dangerContainer: dangerContainer ?? this.dangerContainer,
    );
  }

  @override
  AppSemanticColors lerp(ThemeExtension<AppSemanticColors>? other, double t) {
    if (other is! AppSemanticColors) return this;
    return AppSemanticColors(
      successContainer:
          Color.lerp(successContainer, other.successContainer, t)!,
      infoContainer: Color.lerp(infoContainer, other.infoContainer, t)!,
      warningContainer:
          Color.lerp(warningContainer, other.warningContainer, t)!,
      dangerContainer: Color.lerp(dangerContainer, other.dangerContainer, t)!,
    );
  }
}
