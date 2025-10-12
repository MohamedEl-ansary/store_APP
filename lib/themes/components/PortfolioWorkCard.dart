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
    this.menuIcon, // Swipe the menu icon from huge_icons if you like
    this.eyeIcon, // Swipe the eye icon from huge_icons if you like
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    const radius = 24.0;
    const contentPad = 16.0;
    const imageHeight = 200.0;

    final IconData menuIcon = widget.menuIcon ?? Icons.more_vert;
    final IconData eyeIcon = widget.eyeIcon ?? Icons.visibility_outlined;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          // ✅ There is no shadow and no underline on the card itself
          decoration: BoxDecoration(
            color: cs.surface,
            borderRadius: BorderRadius.circular(radius),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ---------- Image + Layers ----------
              SizedBox(
                height: imageHeight,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    PageView.builder(
                      controller: _controller,
                      itemCount: widget.images.length,
                      onPageChanged: (i) => setState(() => _index = i),
                      itemBuilder: (_, i) =>
                          Image.asset(widget.images[i], fit: BoxFit.cover),
                    ),

                    // Menu button — always top "north"
                    Positioned(
                      top: 12,
                      left: 12,
                      child: _RoundIcon(
                        icon: menuIcon,
                        bg: Colors.black.withOpacity(0.36),
                        fg: Colors.white,
                        onTap: widget.onMenu,
                      ),
                    ),

                    // View counter — always below "north"
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
                            Text(
                              '${widget.views}',
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(eyeIcon, size: 18, color: Colors.white),
                          ],
                        ),
                      ),
                    ),

                    // Page index (dots + pill) — bottom center
                    const _BottomPageIndicator(),
                  ],
                ),
              ),

              // ---------- Text area (light gray border) ----------
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(contentPad),
                decoration: BoxDecoration(
                  color: cs.surface,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(radius),
                  ),
                  //👇 The gray border around the container
                  border: Border.all(
                    color: cs.outline.withOpacity(0.7), //Light degree
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // the address
                    Text(
                      widget.title,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                        letterSpacing: -0.3,
                        color: cs.onSurface,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Classification
                    Text(
                      widget.category,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
        child: SizedBox(
          width: 36,
          height: 36,
          child: Icon(icon, color: fg, size: 18),
        ),
      ),
    );
  }
}

/* Page index below center */
class _BottomPageIndicator extends StatelessWidget {
  const _BottomPageIndicator();

  @override
  Widget build(BuildContext context) {
    final state = context.findAncestorStateOfType<_PortfolioWorkCardState>()!;
    final count = state.widget.images.length;
    final activeIndex = state._index;

    const dot = 6.0;
    const gap = 6.0;

    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Row(
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
      ),
    );
  }
}
