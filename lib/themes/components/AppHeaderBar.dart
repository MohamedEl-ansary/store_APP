import 'package:flutter/material.dart';
import 'package:saber_static_ui/huge_icons.dart';

enum HeaderButtonSide { left, right }

/// Ready-made AppBar: Back button + centered title with auto-balance.
/// Works directly in Scaffold.appBar, and you can choose which side the back button is on.
class AppHeaderBar extends StatelessWidget implements PreferredSizeWidget {
  const AppHeaderBar({
    super.key,
    required this.title,
    this.onBack,
    this.tapArea = 48,
    this.iconSize = 28,
    this.color,
    this.iconLTR,
    this.iconRTL,
    this.buttonSide = HeaderButtonSide.left, // 👈 اختَر مكان الزر
  });

  final String title;
  final VoidCallback? onBack;
  final double tapArea; // مساحة زر الرجوع/الموازن
  final double iconSize; // حجم الأيقونة
  final Color? color; // إن كان null يستخدم onSurface
  final IconData? iconLTR; // أيقونة الرجوع في LTR
  final IconData? iconRTL; // أيقونة الرجوع في RTL
  final HeaderButtonSide buttonSide;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final isRTL = Directionality.of(context) == TextDirection.ltr;

    // السهم الصحيح حسب اتجاه الواجهة (مش حسب مكان الزر)
    final backIcon = isRTL
        ? (iconRTL ?? HugeIcons.arrow_right_01_rounded_outline)
        : (iconLTR ?? HugeIcons.arrow_left_01_rounded_outline);

    // زر الرجوع
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

    // العنوان
    final titleWidget = Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: theme.textTheme.titleMedium?.copyWith(
        fontFamily: 'IBM Plex Sans Arabic',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.2,
        letterSpacing: -0.32,
        color: color ?? cs.onSurface,
      ),
    );

    // موازن علشان العنوان يفضل Center
    final balancer = SizedBox(width: tapArea, height: tapArea);

    // ترتيب العناصر حسب الجهة المطلوبة
    final children = (buttonSide == HeaderButtonSide.left)
        ? <Widget>[
            backBtn,
            Expanded(child: Center(child: titleWidget)),
            balancer,
          ]
        : <Widget>[
            balancer,
            Expanded(child: Center(child: titleWidget)),
            backBtn,
          ];

    return Material(
      color: theme.scaffoldBackgroundColor,
      elevation: 0,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: kToolbarHeight,
          child: Row(children: children),
        ),
      ),
    );
  }
}
