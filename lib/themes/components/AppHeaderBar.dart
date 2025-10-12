import 'package:flutter/material.dart';
import 'package:saber_static_ui/huge_icons.dart';

/// Ready-made top bar: Back button + centered title with auto-balancing.
/// Custom icons can be scrolled; otherwise, HugeIcons is used as the default.
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
  final double tapArea; //Back and balance button space
  final double iconSize; // Icon size
  final Color? color; // If null, use onSurface
  final IconData? iconLTR; // Back icon in LTR
  final IconData? iconRTL; // Back icon in RTL

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    // ✅ RTL → Right (chevron_right), LTR → Left (chevron_left) of HugeIcons
    final backIcon = isRTL
        ? (iconRTL ?? HugeIcons.arrow_right_01_rounded_outline)
        : (iconLTR ?? HugeIcons.arrow_left_01_rounded_outline);

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
        fontFamily: 'IBM Plex Sans Arabic',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.2,
        letterSpacing: -0.32,
        color: color ?? cs.onSurface,
      ),
    );

    return Row(
      children: [
        backBtn,
        Expanded(child: Center(child: titleWidget)),
        // Balancer ensures the title stays exactly centered        SizedBox(width: tapArea, height: tapArea),
      ],
    );
  }
}
