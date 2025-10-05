import 'package:flutter/material.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';

SliderThemeData buildSliderTheme(ColorScheme colorScheme) {
  return SliderThemeData(
    trackHeight: 4,
    activeTrackColor: colorScheme.primary,
    inactiveTrackColor: colorScheme.outline,
    thumbColor: colorScheme.primary,
    overlayColor: colorScheme.primary.setOpacity(0.10),
    valueIndicatorColor: colorScheme.primary,
    inactiveTickMarkColor: colorScheme.onSurfaceVariant,
    activeTickMarkColor: colorScheme.onPrimary,
    rangeThumbShape: const RoundRangeSliderThumbShape(),
    thumbShape: const RoundSliderThumbShape(),
    showValueIndicator: ShowValueIndicator.onlyForDiscrete,
  );
}
