import 'package:flutter/material.dart';

class PortfolioWorkCard extends StatefulWidget {
  const PortfolioWorkCard({
    super.key,
    required this.images,
    required this.title,
    required this.category,
    this.views = 0,
    this.onMenu,
    this.onTap,
    this.menuIcon,
    this.eyeIcon,
  });

  final List<String> images;
  final String title;
  final String category;
  final int views;
  final VoidCallback? onMenu;
  final VoidCallback? onTap;
  final IconData? menuIcon;
  final IconData? eyeIcon;

  @override
  State<PortfolioWorkCard> createState() => _PortfolioWorkCardState();
}

class _PortfolioWorkCardState extends State<PortfolioWorkCard> {
  final _controller = PageController();
  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //Size constants as required
  static const double _cardW = 390; // Show card
  static const double _cardH = 302; // Card height
  static const double _imgH = 229; //Image height
  static const double _radius = 12;
  static const double _contentH = _cardH - _imgH; // 73

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final IconData menuIcon = widget.menuIcon ?? Icons.more_vert;
    final IconData eyeIcon = widget.eyeIcon ?? Icons.visibility_outlined;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(_radius),
        child: Container(
          width: _cardW,
          height: _cardH,
          decoration: BoxDecoration(
            color: cs.surface,
            borderRadius: BorderRadius.circular(_radius),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ---------- Image (343×229) ----------
              SizedBox(
                width: _cardW,
                height: _imgH,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Image slider
                    PageView.builder(
                      controller: _controller,
                      itemCount: widget.images.length,
                      onPageChanged: (i) => setState(() => _index = i),
                      itemBuilder: (_, i) => ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(_radius),
                        ),
                        child: Image.asset(
                          widget.images[i],
                          width: _cardW,
                          height: _imgH,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Menu button - top left
                    Positioned(
                      top: 10,
                      left: 10,
                      child: _RoundIcon(
                        icon: menuIcon,
                        bg: Colors.black.withOpacity(0.36),
                        fg: Colors.white,
                        onTap: widget.onMenu,
                      ),
                    ),

                    // View counter — bottom left
                    Positioned(
                      bottom: 12,
                      left: 12,
                      child: Container(
                        height: 30,
                        padding: const EdgeInsetsDirectional.only(
                          start: 12,
                          end: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.36),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(eyeIcon, size: 18, color: Colors.white),
                            const SizedBox(width: 6),
                            Text(
                              '${widget.views}',
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            // const SizedBox(width: 8),
                            // Icon(eyeIcon, size: 18, color: Colors.white),
                          ],
                        ),
                      ),
                    ),

                    // Page index at bottom center
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: _PageIndicator(
                        activeIndex: _index,
                        count: widget.images.length,
                      ),
                    ),
                  ],
                ),
              ),

              // ---------- Text Area (Fixed Height 73) ----------
              SizedBox(
                width: _cardW,
                height: _contentH,
                child: Container(
                  decoration: BoxDecoration(
                    color: cs.surface,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(_radius),
                    ),
                    border: Border.all(
                      color: cs.outline.withOpacity(0.7), //Grey border
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title (maximum 2 lines)
                      Text(
                        widget.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontFamily: 'IBM Plex Sans Arabic',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                          letterSpacing: -0.3,
                          color: cs.onSurface,
                        ),
                      ),
                      const SizedBox(height: 6),
                      // Classification (one line)
                      Text(
                        widget.category,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontFamily: 'IBM Plex Sans Arabic',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          letterSpacing: -0.2,
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* Small round button */
class _RoundIcon extends StatelessWidget {
  const _RoundIcon({
    required this.icon,
    required this.bg,
    required this.fg,
    this.onTap,
  });

  final IconData icon;
  final Color bg;
  final Color fg;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bg,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: const SizedBox(
          width: 25,
          height: 25,
          child: Center(
            child: Icon(Icons.more_vert, color: Colors.white, size: 22),
          ),
        ),
      ),
    );
  }
}

/* Simple page pointer (dots + pill) */
class _PageIndicator extends StatelessWidget {
  const _PageIndicator({required this.activeIndex, required this.count});

  final int activeIndex;
  final int count;

  @override
  Widget build(BuildContext context) {
    const dot = 6.0;
    const gap = 6.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final isActive = i == activeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 240),
          width: isActive ? 24 : dot,
          height: dot,
          margin: const EdgeInsets.symmetric(horizontal: gap / 2),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(999),
          ),
        );
      }),
    );
  }
}
