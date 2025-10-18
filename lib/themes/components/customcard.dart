import 'package:flutter/material.dart';

/// Generic header built inside a Container with title + trailing/actions
/// Supports simple action fields:
/// - actionImage (asset )
/// - actionLabel (String)
/// - actionIcon (IconData) — auto flips on LTR using Transform
/// - actionSwitchValue + onActionSwitchChanged (custom 44x24 switch)
///
/// Order (generated): image -> label -> icon -> switch
class CustomCard extends StatelessWidget {
  final Widget? leading;
  final String title;

  // kept for compatibility
  final int? count;
  final Widget? trailing;

  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final BorderRadiusGeometry borderRadius;

  /// If provided, this list is used (priority) instead of generated actions
  final List<Widget>? actions;

  // simple-action fields
  final String? actionImage; // asset path or network url
  final bool actionImageIsNetwork;
  final double actionImageSize;
  final VoidCallback? onActionImageTap;

  final String? actionLabel;
  final TextStyle? actionLabelStyle;
  final VoidCallback? onActionLabelTap;

  final IconData? actionIcon;
  final double actionIconSize;
  final VoidCallback? onActionIconTap;

  final bool? actionSwitchValue;
  final ValueChanged<bool>? onActionSwitchChanged;
  final Color? switchOnColor; // #3B479D by default
  final Color? switchOffColor; // #DBDBDB by default

  /// direction (default RTL = Arabic first)
  final TextDirection textDirection;

  /// gap between action items
  final double actionsGap;

  /// Fixed color for text and icon (according to your request)
  static const Color _fixedForeground = Color(0xFF393939);

  const CustomCard({
    super.key,
    this.leading,
    required this.title,
    this.count,
    this.trailing,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    this.backgroundColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.actions,
    // simple actions
    this.actionImage,
    this.actionImageIsNetwork = false,
    this.actionImageSize = 24.0,
    this.onActionImageTap,
    this.actionLabel,
    this.actionLabelStyle,
    this.onActionLabelTap,
    this.actionIcon,
    this.actionIconSize = 24.0,
    this.onActionIconTap,
    // switch
    this.actionSwitchValue,
    this.onActionSwitchChanged,
    this.switchOnColor,
    this.switchOffColor,
    // layout
    this.textDirection = TextDirection.rtl,
    this.actionsGap = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final dir = textDirection;
    final bg = backgroundColor ?? Theme.of(context).cardColor;
    final BorderRadius resolvedBorderRadius = borderRadius.resolve(dir);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Directionality(
        textDirection: dir,
        child: Material(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: resolvedBorderRadius),
          child: InkWell(
            borderRadius: resolvedBorderRadius,
            onTap: onTap,
            child: Container(
              padding: padding,
              decoration: BoxDecoration(
                color: bg,
                borderRadius: borderRadius,
                border: Border.all(
                  color: const Color(0xFFF2F2F7),
                  width: 0.5, // سمك الإطار (تقدر تغيرها)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 8,
                    // offset: const Offset(0, 2),
                  ),
                ],
              ),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (leading != null) ...[leading!, const SizedBox(width: 12)],
                  Expanded(
                    child: Row(
                      children: [
                        // title (colored solid)
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontFamily: 'IBM Plex Sans Arabic',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: _fixedForeground,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        // actions list (priority) OR generated from simple fields
                        if (actions != null && actions!.isNotEmpty) ...[
                          const SizedBox(width: 12),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: _withGaps(actions!, actionsGap),
                          ),
                        ] else
                          ..._buildGeneratedActions(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildGeneratedActions(BuildContext context) {
    final generated = <Widget>[];

    // ===== image: 25x20; centered; no shrink =====
    if (actionImage != null && actionImage!.isNotEmpty) {
      Widget rawImage;

      rawImage = Image.asset(actionImage!, fit: BoxFit.contain);

      Widget img = SizedBox(
        width: 20,
        height: 15,
        child: Center(
          child: FittedBox(fit: BoxFit.contain, child: rawImage),
        ),
      );

      if (onActionImageTap != null) {
        img = GestureDetector(onTap: onActionImageTap, child: img);
      }
      generated.add(img);
    }

    // ===== text: IBM Plex Sans Arabic; 14px; 500; #393939 (fixed) =====
    if (actionLabel != null && actionLabel!.isNotEmpty) {
      final fallback = const TextStyle(
        fontFamily: 'IBM Plex Sans Arabic',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.0,
        color: _fixedForeground,
      );

      // Even if we get actionLabelStyle, we fix the color to _fixedForeground and keep the rest of the properties
      final TextStyle labelStyle = (actionLabelStyle ?? fallback).copyWith(
        color: _fixedForeground,
      );

      Widget lbl = Text(
        actionLabel!,
        style: labelStyle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
      if (onActionLabelTap != null)
        lbl = GestureDetector(onTap: onActionLabelTap, child: lbl);
      generated.add(lbl);
    }

    // ===== icon: 20x20; padding 1.042 / 1.875; centered; auto-flip on LTR; color fixed #393939 =====
    if (actionIcon != null) {
      final rawIcon = Icon(
        actionIcon!,
        size: actionIconSize,
        color: _fixedForeground,
      );

      final bool isLtr = textDirection == TextDirection.ltr;
      final flippedIcon = isLtr
          ? Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
              child: rawIcon,
            )
          : rawIcon;

      final iconBox = SizedBox(
        width: 22,
        height: 22,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 1.042,
            horizontal: 1.875,
          ),
          child: FittedBox(fit: BoxFit.contain, child: flippedIcon),
        ),
      );

      Widget ic = InkResponse(
        onTap: onActionIconTap,
        containedInkWell: true,
        borderRadius: BorderRadius.circular(4),
        child: Align(alignment: Alignment.center, child: iconBox),
      );

      generated.add(ic);
    }

    // ===== switch: 44x24 =====
    if (actionSwitchValue != null || onActionSwitchChanged != null) {
      generated.add(
        _InlineSwitch(
          initialValue: actionSwitchValue ?? false,
          onChanged: onActionSwitchChanged,
          onColor: switchOnColor ?? const Color(0xFF3B479D),
          offColor: switchOffColor ?? const Color(0xFFDBDBDB),
        ),
      );
    }

    if (generated.isEmpty) {
      if (trailing != null) {
        return [
          const SizedBox(width: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 40),
            child: trailing!,
          ),
        ];
      }
      return <Widget>[];
    }

    return [
      const SizedBox(width: 12),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: _withGaps(generated, actionsGap),
      ),
    ];
  }

  List<Widget> _withGaps(List<Widget> children, double gap) {
    final out = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      out.add(children[i]);
      if (i != children.length - 1) out.add(SizedBox(width: gap));
    }
    return out;
  }
}

/// Custom inline switch (44x24) with rounded track and animated knob
class _InlineSwitch extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;
  final Color onColor;
  final Color offColor;

  const _InlineSwitch({
    required this.initialValue,
    this.onChanged,
    required this.onColor,
    required this.offColor,
    super.key,
  });

  @override
  State<_InlineSwitch> createState() => _InlineSwitchState();
}

class _InlineSwitchState extends State<_InlineSwitch> {
  late bool value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  void didUpdateWidget(covariant _InlineSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue &&
        widget.initialValue != value) {
      setState(() => value = widget.initialValue);
    }
  }

  void _toggle() {
    setState(() => value = !value);
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    const width = 44.0;
    const height = 24.0;
    const knob = 20.0;

    final bg = value ? widget.onColor : widget.offColor;

    return GestureDetector(
      onTap: _toggle,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeInOut,
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(1000),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeInOut,
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: knob,
            height: knob,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0x22000000),
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
