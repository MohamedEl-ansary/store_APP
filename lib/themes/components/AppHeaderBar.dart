import 'package:flutter/material.dart';

/// شريط علوي جاهز: زر رجوع + عنوان في المنتصف مع موازنة تلقائية.
/// يمكن تمرير أيقونات مخصّصة (مثلاً AppIcons.chevronLeft/Right)،
/// وإلا يستخدم أيقونات Material الافتراضية.
class AppHeaderBar extends StatelessWidget {
  const AppHeaderBar({
    super.key,
    required this.title,
    this.onBack,
    this.tapArea = 48,
    this.iconSize = 28,
    this.color,
    this.iconLTR,
    this.iconRTL,
  });

  final String title;
  final VoidCallback? onBack;
  final double tapArea; // مساحة زر الرجوع والموازِن
  final double iconSize; // حجم الأيقونة
  final Color? color; // لو null يستخدم onSurface
  final IconData? iconLTR; // أيقونة الرجوع في LTR
  final IconData? iconRTL; // أيقونة الرجوع في RTL

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    final backIcon = isRTL
        ? (iconRTL ?? Icons.chevron_left)
        : (iconLTR ?? Icons.chevron_right);

    final backBtn = SizedBox(
      width: tapArea,
      height: tapArea,
      child: IconButton(
        onPressed: onBack ?? () => Navigator.maybePop(context),
        icon: Icon(backIcon, size: iconSize),
        style: IconButton.styleFrom(
          foregroundColor: color ?? cs.onSurface,
          padding: const EdgeInsets.all(8),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      ),
    );

    final titleWidget = Text(
      title,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontFamily:
            'IBM Plex Sans Arabic', // تأكد أن الاسم مطابق لما في pubspec
        fontSize: 16, // font-size: 16px
        fontWeight: FontWeight.w500, // font-weight: 500
        height: 1.2, // line-height: 120%
        letterSpacing: -0.32,
        color: color ?? cs.onSurface,
      ),
    );

    return Row(
      children: [
        backBtn,
        Expanded(child: Center(child: titleWidget)),
        // موازِن يضمن بقاء العنوان في المنتصف بالضبط
        SizedBox(width: tapArea, height: tapArea),
      ],
    );
  }
}
