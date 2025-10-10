import 'package:flutter/material.dart';

/// زر CTA عام يعيد استخدامه في كل الشاشات
class CtaButton extends StatelessWidget {
  const CtaButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.width, // لو null ومع fullWidth=false هيبقى 343 افتراضيًا
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

    // أيقونة: display:flex; 24×24; padding:3.25; justify/align center; flex-shrink:0
    const double _iconBox = 24;
    const double _iconPad = 3.25; // ينتج أيقونة فعلية ≈ 17.5
    const double _gap = 10;

    final double effectiveWidth = fullWidth ? double.infinity : (width ?? 343);

    return SizedBox(
      width: effectiveWidth,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        clipBehavior: Clip.hardEdge, // يمنع خروج المحتوى خارج حدود الزر
        style: ElevatedButton.styleFrom(
          backgroundColor: cs.primary,
          foregroundColor: cs.onPrimary, // يلوّن النص والأيقونة افتراضيًا
          padding: const EdgeInsets.all(10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.all(Radius.circular(8)),
          ),
          textStyle: theme.textTheme.labelLarge?.copyWith(
            // CSS: font-family + size + weight + line-height: normal
            fontFamily: 'IBM Plex Sans Arabic',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.0,
          ),
        ),
        // محتوى الزر يتقلّص تلقائيًا لو العرض ضاق
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null)
                SizedBox(
                  width: _iconBox,
                  height: _iconBox,
                  child: Padding(
                    padding: const EdgeInsets.all(_iconPad),
                    // نضمن التوسيط الكامل للأيقونة داخل الصندوق
                    child: Center(
                      child: Icon(
                        icon,
                        size: _iconBox - _iconPad * 2, // ≈ 17.5
                        color: cs.onPrimary, // CSS: color: #FFF
                      ),
                    ),
                  ),
                ),
              if (icon != null) const SizedBox(width: _gap),
              // CSS: color #FFF, text-align center, font props أعلاه
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: theme.textTheme.labelLarge?.copyWith(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.0, // line-height: normal
                  color: cs.onPrimary, // var(--Primary-0, #FFF)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
