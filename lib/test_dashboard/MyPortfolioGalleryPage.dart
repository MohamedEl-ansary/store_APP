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

    const double pagePad = 16;
    const double ctaHeight = 48;
    const double ctaBottomPad = 24; // Distance between button and edge
    const double itemSpacing = 20;

    final double safeBottom = MediaQuery.of(context).padding.bottom;
    //Padding the bottom of the list so that the last card does not disappear behind the button
    final double listBottomPadding =
        ctaHeight + ctaBottomPad + safeBottom + pagePad;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      // ✅ AppBar fixed in Scaffold
      appBar: AppHeaderBar(
        title: 'معرض أعمالي',
        onBack: () => Navigator.pop(context),
        buttonSide: HeaderButtonSide.right, // 👈 Back button right
        iconLTR: HugeIcons.arrow_left_01_rounded_outline,
        iconRTL: HugeIcons.arrow_right_01_rounded_outline,
        tapArea: 48,
        iconSize: 28,
      ),

      body: SafeArea(
        top:
            false, // So we don't double the SafeArea above (the appBar covers it)
        child: Stack(
          children: [
            // ===== Scrollable Content (ListView) =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: pagePad),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                  top: pagePad,
                  bottom:
                      listBottomPadding, // 👈 Important so that the button does not cover the last element
                ),
                itemCount: 10,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: itemSpacing),
                itemBuilder: (_, i) => PortfolioWorkCard(
                  images: images,
                  title: 'تصميم هوية بصرية لمطعم',
                  category: 'تصميم جرافيك',
                  views: 0,
                  onMenu: () {},
                  onTap: () {},
                  // If you want your icons from HugeIcons:
                  menuIcon: HugeIcons.more_vertical_rounded_bold,
                  eyeIcon: HugeIcons.view_sharp_outline,
                ),
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
                onPressed: () {
                  // TODO: Go to the Create New Job page
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
