// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:saber_static_ui/huge_icons.dart';
// import 'package:saber_static_ui/themes/components/AppHeaderBar.dart';
// import 'package:saber_static_ui/themes/components/CtaButton.dart';

// class MyPortfolioGallery extends StatelessWidget {
//   const MyPortfolioGallery({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final cs = theme.colorScheme;
//     final isLight = theme.brightness == Brightness.light;

//     Widget _illustration() => Image.asset(
//       'assets/images/Upload-photo 1.png',
//       width: 221,
//       height: 252,
//       fit: BoxFit.contain,
//     );

//     Widget _headline() => SizedBox(
//       width: double.infinity,
//       child: Text(
//         'ابدأ بإضافة أول عمل في معرضك!',
//         textAlign: TextAlign.center,
//         style: theme.textTheme.titleLarge?.copyWith(
//           fontFamily: 'IBM Plex Sans Arabic',
//           fontSize: 20,
//           fontWeight: FontWeight.w700,
//           height: 1.2,
//           letterSpacing: -0.4,
//           color: isLight ? const Color(0xFF161616) : cs.onSurface,
//         ),
//       ),
//     );

//     Widget _subtitle() => SizedBox(
//       width: double.infinity,
//       child: Text(
//         'اعرض أعمالك الإبداعية واجعل معرضك الشخصي يتألق',
//         textAlign: TextAlign.center,
//         style: theme.textTheme.bodyMedium?.copyWith(
//           fontFamily: 'IBM Plex Sans Arabic',
//           fontSize: 16,
//           fontWeight: FontWeight.w400,
//           height: 1.2,
//           letterSpacing: -0.32,
//           color: isLight ? const Color(0xFF7A7A7A) : cs.onSurfaceVariant,
//         ),
//       ),
//     );

//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,

//       // ✅ العنوان + زر الرجوع في appBar
//       appBar: const AppHeaderBar(
//         buttonSide: HeaderButtonSide.right, // 👈 زر الرجوع يمين
//         title: 'معرض أعمالي',
//         // لو تريد الرجوع بـ go_router:
//         // onBack: () => context.pop(),  // ما ينفعش const هنا؛ خليه بدون const لو حابب تمرر onBack
//       ),

//       body: SafeArea(
//         top: false, // لأن appBar أخذ الـSafeArea العلوي
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: LayoutBuilder(
//             builder: (context, constraints) {
//               final isLandscape = constraints.maxWidth > constraints.maxHeight;

//               if (!isLandscape) {
//                 // Portrait
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 0,
//                     vertical: 5,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const SizedBox(height: 50),
//                       _illustration(),
//                       const SizedBox(height: 30),
//                       _headline(),
//                       const SizedBox(height: 16),
//                       _subtitle(),
//                       const Spacer(),
//                       CtaButton(
//                         label: 'إضافة عمل جديد',
//                         icon: HugeIcons.add_01_rounded_bold,
//                         width: 343,
//                         height: 48,
//                         onPressed: () => context.pushNamed('galleryPage'),
//                       ),
//                       const Spacer(flex: 3),
//                     ],
//                   ),
//                 );
//               }

//               // Landscape
//               return Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: SingleChildScrollView(
//                   physics: const ClampingScrollPhysics(),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const SizedBox(height: 24),
//                       _illustration(),
//                       const SizedBox(height: 24),
//                       _headline(),
//                       const SizedBox(height: 12),
//                       _subtitle(),
//                       const SizedBox(height: 24),
//                       CtaButton(
//                         label: 'إضافة عمل جديد',
//                         icon: HugeIcons.add_01_rounded_bold,
//                         fullWidth: true,
//                         height: 48,
//                         onPressed: () => context.pushNamed('galleryPage'),
//                       ),
//                       const SizedBox(height: 24),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saber_static_ui/huge_icons.dart';
import 'package:saber_static_ui/themes/components/AppHeaderBar.dart';
import 'package:saber_static_ui/themes/components/CtaButton.dart';

class MyPortfolioGallery extends StatelessWidget {
  const MyPortfolioGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final isLight = theme.brightness == Brightness.light;

    Widget _illustration() => Image.asset(
      'assets/images/Upload-photo 1.png',
      width: 221,
      height: 252,
      fit: BoxFit.contain,
    );

    Widget _headline() => SizedBox(
      width: double.infinity,
      child: Text(
        'ابدأ بإضافة أول عمل في معرضك!',
        textAlign: TextAlign.center,
        style: theme.textTheme.titleLarge?.copyWith(
          fontFamily: 'IBM Plex Sans Arabic',
          fontSize: 20,
          fontWeight: FontWeight.w700,
          height: 1.2,
          letterSpacing: -0.4,
          color: isLight ? const Color(0xFF161616) : cs.onSurface,
        ),
      ),
    );

    Widget _subtitle() => SizedBox(
      width: double.infinity,
      child: Text(
        'اعرض أعمالك الإبداعية واجعل معرضك الشخصي يتألق',
        textAlign: TextAlign.center,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontFamily: 'IBM Plex Sans Arabic',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.2,
          letterSpacing: -0.32,
          color: isLight ? const Color(0xFF7A7A7A) : cs.onSurfaceVariant,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      // ✅ العنوان + زر الرجوع في appBar
      appBar: const AppHeaderBar(
        buttonSide: HeaderButtonSide.right, // زر الرجوع يمين
        title: 'معرض أعمالي',
      ),

      body: SafeArea(
        top: false, // لأن appBar أخذ الـSafeArea العلوي
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isLandscape = constraints.maxWidth > constraints.maxHeight;

              if (!isLandscape) {
                // Portrait
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      _illustration(),
                      const SizedBox(height: 30),
                      _headline(),
                      const SizedBox(height: 16),
                      _subtitle(),
                      const Spacer(),
                      CtaButton(
                        label: 'إضافة عمل جديد',
                        icon: HugeIcons.add_01_rounded_bold,
                        width: 375,
                        height: 48,
                        onPressed: () => context.pushNamed('galleryPage'),
                      ),
                      const Spacer(flex: 3),
                    ],
                  ),
                );
              }

              // Landscape
              return Padding(
                padding: const EdgeInsets.all(16), // 👈 padding = 16
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),
                      _illustration(),
                      const SizedBox(height: 16),
                      _headline(),
                      const SizedBox(height: 12),
                      _subtitle(),
                      const SizedBox(height: 16),
                      CtaButton(
                        label: 'إضافة عمل جديد',
                        icon: HugeIcons.add_01_rounded_bold,
                        fullWidth: true,
                        height: 48,
                        onPressed: () => context.pushNamed('galleryPage'),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
