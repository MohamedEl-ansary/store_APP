import 'package:flutter/material.dart';

/// Generic CTA button that reuses across all fullwidth screens
class CtaButton extends StatelessWidget {
  const CtaButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.width, // If null and fullWidth=false, it will be 343 by default
    this.height = 48,
    this.fullWidth = false,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final double? width;
  final double height;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    // Icon box 24x24 with padding 3.25 => Actual size ≈ 17.5
    const double _iconBox = 24;
    const double _iconPad = 3.25;
    const double _gap = 10;

    final double effectiveWidth = fullWidth ? double.infinity : (width ?? 343);

    return SizedBox(
      width: effectiveWidth,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        clipBehavior: Clip.hardEdge,
        style: ElevatedButton.styleFrom(
          backgroundColor: cs.primary,
          foregroundColor: cs.onPrimary,
          padding: const EdgeInsets.all(10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.all(Radius.circular(8)),
          ),
          textStyle: theme.textTheme.labelLarge?.copyWith(
            fontFamily: 'IBM Plex Sans Arabic',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.0,
          ),
        ),
        // Button content shrinks automatically if width narrows
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          //👇 We fix the content direction LTR: icon first, then text always
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null)
                  SizedBox(
                    width: _iconBox,
                    height: _iconBox,
                    child: Padding(
                      padding: const EdgeInsets.all(_iconPad),
                      child: Center(
                        child: Icon(
                          icon,
                          size: _iconBox - _iconPad * 2, // ≈ 17.5
                          color: cs.onPrimary,
                        ),
                      ),
                    ),
                  ),
                if (icon != null) const SizedBox(width: _gap),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.0,
                    color: cs.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
