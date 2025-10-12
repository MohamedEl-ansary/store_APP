import 'package:flutter/material.dart';
import 'package:saber_static_ui/huge_icons.dart';

import 'package:saber_static_ui/themes/components/AppHeaderBar.dart';
import 'package:saber_static_ui/themes/components/CtaButton.dart';
import 'package:saber_static_ui/themes/components/PortfolioWorkCard.dart';

class MyPortfolioGalleryPage extends StatelessWidget {
  const MyPortfolioGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Demo data for cards (preferably names without spaces/brackets)
    const images = [
      'assets/images/download (1).jfif',
      'assets/images/download (1).jfif',
      'assets/images/download (1).jfif',
    ];
    // Header (back right icon)
    final header = Directionality(
      textDirection: TextDirection
          .rtl, // 👈 Leave the back button on the right side of the screen
      child: AppHeaderBar(
        title: 'معرض أعمالي',
        onBack: () => Navigator.pop(context),
        iconLTR: HugeIcons.arrow_left_01_rounded_outline,
        iconRTL: HugeIcons.arrow_right_01_rounded_outline,
        tapArea: 48,
        iconSize: 28,
      ),
    );

    const double pagePad = 24;
    const double ctaHeight = 48;
    const double ctaBottomPad = 24; // Distance between button and edge
    const double listSpacing = 12;

    final double safeBottom = MediaQuery.of(context).padding.bottom;
    // The space reserved below the scroll so that the last card does not disappear behind the button
    final double scrollBottomSpacer = ctaHeight + ctaBottomPad + safeBottom;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            // ===== Scrollable Content (Header + Cards) =====
            Positioned.fill(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  //External padding
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: pagePad,
                      vertical: pagePad,
                    ),
                    sliver: SliverToBoxAdapter(child: header),
                  ),

                  // List of cards with commas
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: pagePad),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          // We build: card, separator, card, separator...
                          if (index.isOdd) {
                            return const SizedBox(height: listSpacing);
                          }
                          final itemIndex = index ~/ 2;
                          // If the number of elements is 3: childCount = 3*2-1 = 5                          if (itemIndex >= 3) return const SizedBox.shrink();
                          return PortfolioWorkCard(
                            images: images,
                            title: 'تصميم هوية بصرية لمطعم',
                            category: 'تصميم جرافيك',
                            views: 0,
                            // views: 0 + itemIndex,
                            onMenu: () {},
                            onTap: () {},
                            // Pass your icons from the HugeIcons font if you like:
                            // menuIcon: HugeIcons.more_vertical_01_rounded_outline,
                            // eyeIcon:  HugeIcons.eye_01_rounded_outline,
                          );
                        },
                        childCount: 3 * 2 - 1, // Elements + Commas
                      ),
                    ),
                  ),

                  // Spacer at the end of the scroll bar so it doesn't disappear behind the button
                  SliverToBoxAdapter(
                    child: SizedBox(height: scrollBottomSpacer),
                  ),
                ],
              ),
            ),

            // ===== Overlay button (outside scroll) =====
            Positioned(
              left: pagePad,
              right: pagePad,
              bottom: ctaBottomPad + safeBottom,
              child: CtaButton(
                icon: HugeIcons.add_01_rounded_bold,
                label: 'إضافة عمل جديد',

                fullWidth: true,
                height: ctaHeight,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
