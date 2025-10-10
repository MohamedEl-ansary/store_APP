// import 'package:flutter/material.dart';

// class AppIcons {
//   const AppIcons._();
//   static const IconData add = Icons.add;
//   static const IconData chevronLeft = Icons.chevron_left;
//   static const IconData chevronRight = Icons.chevron_right;
// }

// class MyPortfolioGallery extends StatelessWidget {
//   const MyPortfolioGallery({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final cs = theme.colorScheme;
//     final isRTL = Directionality.of(context) == TextDirection.rtl;

//     // عنصر العنوان (علشان ما نكررش الكود)
//     Widget _title() => Text(
//       'معرض أعمالي',
//       textAlign: TextAlign.center,
//       style: theme.textTheme.titleMedium?.copyWith(
//         fontSize: 16,
//         fontWeight: FontWeight.w500,
//         height: 1.2,
//         letterSpacing: -0.32,
//         color: cs.onSurface,
//       ),
//     );

//     // عنصر الصورة
//     Widget _illustration() => Image.asset(
//       'assets/images/Upload-photo 1.png',
//       width: 221,
//       height: 252,
//       fit: BoxFit.contain,
//     );

//     // عنوان تشجيعي
//     Widget _headline() => SizedBox(
//       width: double.infinity,
//       child: Text(
//         'ابدأ بإضافة أول عمل في معرضك!',
//         textAlign: TextAlign.center,
//         style: theme.textTheme.titleLarge?.copyWith(
//           fontSize: 20,
//           fontWeight: FontWeight.w700,
//           height: 1.2,
//           letterSpacing: -0.4,
//           color: cs.onSurface,
//         ),
//       ),
//     );

//     // نص ثانوي
//     Widget _subtitle() => SizedBox(
//       width: double.infinity,
//       child: Text(
//         'اعرض أعمالك الإبداعية واجعل معرضك الشخصي يتألق',
//         textAlign: TextAlign.center,
//         style: theme.textTheme.bodyMedium?.copyWith(
//           fontSize: 16,
//           fontWeight: FontWeight.w400,
//           height: 1.2,
//           letterSpacing: -0.32,
//           color: cs.onSurfaceVariant,
//         ),
//       ),
//     );

//     // زر CTA (في اللاندسكيب هنخليه ياخد عرض الشاشة المتاح، وفي البورتريت 343 زي التصميم)
//     Widget _cta(bool isLandscape, double maxWidth) => SizedBox(
//       width: isLandscape ? double.infinity : 343,
//       height: 48,
//       child: ElevatedButton(
//         onPressed: () {},
//         style: ElevatedButton.styleFrom(
//           backgroundColor: cs.primary,
//           foregroundColor: cs.onPrimary,
//           padding: const EdgeInsets.all(10),
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadiusDirectional.all(Radius.circular(8)),
//           ),
//           textStyle: theme.textTheme.labelLarge?.copyWith(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//             height: 1.0,
//           ),
//         ),
//         // لو العرض ضاق جدًا في اللاندسكيب، صغّر المحتوى للداخل
//         child: FittedBox(
//           fit: BoxFit.scaleDown,
//           alignment: Alignment.center,
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(
//                 width: 24,
//                 height: 24,
//                 child: Padding(
//                   padding: const EdgeInsets.all(3.25),
//                   child: Icon(AppIcons.add, size: 17.5, color: cs.onPrimary),
//                 ),
//               ),
//               const SizedBox(width: 10),
//               Text(
//                 'إضافة عمل جديد',
//                 style: theme.textTheme.labelLarge?.copyWith(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: cs.onPrimary,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );

//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       body: SafeArea(
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: LayoutBuilder(
//             builder: (context, constraints) {
//               final isLandscape = constraints.maxWidth > constraints.maxHeight;

//               // شريط علوي ثابت
//               final topBar = Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     onPressed: () => Navigator.pop(context),
//                     icon: Icon(
//                       isRTL ? AppIcons.chevronRight : AppIcons.chevronLeft,
//                       size: 28,
//                     ),
//                     style: IconButton.styleFrom(foregroundColor: cs.onSurface),
//                     tooltip: 'رجوع',
//                   ),
//                   _title(),
//                   const SizedBox(width: 48),
//                 ],
//               );

//               // =============== Portrait: عمود عادي مع Spacer (بدون Scroll) ===============
//               if (!isLandscape) {
//                 return Padding(
//                   padding: const EdgeInsets.all(24.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       topBar,
//                       const SizedBox(height: 60),
//                       _illustration(),
//                       const SizedBox(height: 40),
//                       _headline(),
//                       const SizedBox(height: 16),
//                       _subtitle(),
//                       const Spacer(), // يزق الزر لتحت
//                       _cta(false, constraints.maxWidth),
//                       const Spacer(flex: 3),
//                     ],
//                   ),
//                 );
//               }

//               // =============== Landscape: نفس العناصر لكن Scroll رأسي ===============
//               // مهم: ما نستخدمش Spacer جوه Scroll، ونزود مسافات ثابتة بدلها
//               return Padding(
//                 padding: const EdgeInsets.all(24.0),
//                 child: SingleChildScrollView(
//                   physics: const ClampingScrollPhysics(),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       topBar,
//                       const SizedBox(height: 24),
//                       _illustration(),
//                       const SizedBox(height: 24),
//                       _headline(),
//                       const SizedBox(height: 12),
//                       _subtitle(),
//                       const SizedBox(height: 24),
//                       _cta(
//                         true,
//                         constraints.maxWidth,
//                       ), // ياخد عرض المساحة المتاحة
//                       const SizedBox(height: 24), // مسافة سفلية بسيطة
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

// import 'package:flutter/material.dart';
// import 'package:saber_static_ui/themes/components/CtaButton.dart';

// class AppIcons {
//   const AppIcons._();
//   static const IconData add = Icons.add;
//   static const IconData chevronLeft = Icons.chevron_left;
//   static const IconData chevronRight = Icons.chevron_right;
// }

// class MyPortfolioGallery extends StatelessWidget {
//   const MyPortfolioGallery({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final cs = theme.colorScheme;
//     final isRTL = Directionality.of(context) == TextDirection.rtl;

//     // عنصر العنوان
//     Widget _title() => Text(
//       'معرض أعمالي',
//       textAlign: TextAlign.center,
//       style: theme.textTheme.titleMedium?.copyWith(
//         fontSize: 16,
//         fontWeight: FontWeight.w500,
//         height: 1.2,
//         letterSpacing: -0.32,
//         color: cs.onSurface,
//       ),
//     );

//     // عنصر الصورة
//     Widget _illustration() => Image.asset(
//       'assets/images/Upload-photo 1.png',
//       width: 221,
//       height: 252,
//       fit: BoxFit.contain,
//     );

//     // عنوان تشجيعي
//     Widget _headline() => SizedBox(
//       width: double.infinity,
//       child: Text(
//         'ابدأ بإضافة أول عمل في معرضك!',
//         textAlign: TextAlign.center,
//         style: theme.textTheme.titleLarge?.copyWith(
//           fontSize: 20,
//           fontWeight: FontWeight.w700,
//           height: 1.2,
//           letterSpacing: -0.4,
//           color: cs.onSurface,
//         ),
//       ),
//     );

//     // نص ثانوي
//     Widget _subtitle() => SizedBox(
//       width: double.infinity,
//       child: Text(
//         'اعرض أعمالك الإبداعية واجعل معرضك الشخصي يتألق',
//         textAlign: TextAlign.center,
//         style: theme.textTheme.bodyMedium?.copyWith(
//           fontSize: 16,
//           fontWeight: FontWeight.w400,
//           height: 1.2,
//           letterSpacing: -0.32,
//           color: cs.onSurfaceVariant,
//         ),
//       ),
//     );

//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       body: SafeArea(
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: LayoutBuilder(
//             builder: (context, constraints) {
//               final isLandscape = constraints.maxWidth > constraints.maxHeight;

//               // شريط علوي ثابت
//               final topBar = Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     onPressed: () => Navigator.pop(context),
//                     icon: Icon(
//                       isRTL ? AppIcons.chevronRight : AppIcons.chevronLeft,
//                       size: 28,
//                     ),
//                     style: IconButton.styleFrom(foregroundColor: cs.onSurface),
//                     tooltip: 'رجوع',
//                   ),
//                   _title(),
//                   const SizedBox(width: 48),
//                 ],
//               );

//               // =============== Portrait: عمود عادي مع Spacer (بدون Scroll) ===============
//               if (!isLandscape) {
//                 return Padding(
//                   padding: const EdgeInsets.all(24.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       topBar,
//                       const SizedBox(height: 60),
//                       _illustration(),
//                       const SizedBox(height: 40),
//                       _headline(),
//                       const SizedBox(height: 16),
//                       _subtitle(),
//                       const Spacer(), // يزق الزر لتحت
//                       // 👇 استخدام CtaButton بعرض 343px كما في التصميم
//                       CtaButton(
//                         label: 'إضافة عمل جديد',
//                         icon: AppIcons.add,
//                         width: 343,
//                         height: 48,
//                         onPressed: () {
//                           // TODO: إضافة عمل جديد
//                         },
//                       ),
//                       const Spacer(flex: 3),
//                     ],
//                   ),
//                 );
//               }

//               // =============== Landscape: نفس العناصر لكن Scroll رأسي ===============
//               // (لا نستخدم Spacer داخل Scroll؛ نستبدل بمسافات ثابتة)
//               return Padding(
//                 padding: const EdgeInsets.all(24.0),
//                 child: SingleChildScrollView(
//                   physics: const ClampingScrollPhysics(),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       topBar,
//                       const SizedBox(height: 24),
//                       _illustration(),
//                       const SizedBox(height: 24),
//                       _headline(),
//                       const SizedBox(height: 12),
//                       _subtitle(),
//                       const SizedBox(height: 24),
//                       // 👇 في العرضي: الزر يتمدّد بعرض المساحة المتاحة
//                       CtaButton(
//                         label: 'إضافة عمل جديد',
//                         icon: AppIcons.add,
//                         fullWidth: true,
//                         height: 48,
//                         onPressed: () {
//                           // TODO: إضافة عمل جديد
//                         },
//                       ),
//                       const SizedBox(height: 24), // مسافة سفلية بسيطة
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
import 'package:saber_static_ui/themes/components/AppHeaderBar.dart';
import 'package:saber_static_ui/themes/components/CtaButton.dart';

class AppIcons {
  const AppIcons._();
  static const IconData add = Icons.add;
  static const IconData chevronLeft = Icons.chevron_left;
  static const IconData chevronRight = Icons.chevron_right;
}

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

    // ✅ مطابق للـCSS: color #161616 (Light) / onSurface (Dark), center, IBM Plex Sans Arabic, 20/700/1.2/-0.4
    Widget _headline() => SizedBox(
      width: double.infinity,
      child: Text(
        'ابدأ بإضافة أول عمل في معرضك!',
        textAlign: TextAlign.center,
        style: theme.textTheme.titleLarge?.copyWith(
          fontFamily:
              'IBM Plex Sans Arabic', // لو مسجلة كـ IBMPlexSansArabic غيّر الاسم هنا
          fontSize: 20,
          fontWeight: FontWeight.w700,
          height: 1.2, // 120%
          letterSpacing: -0.4, // -0.4px
          color: isLight ? const Color(0xFF161616) : cs.onSurface,
        ),
      ),
    );

    // ✅ مطابق للـCSS: color #7A7A7A (Light) / onSurfaceVariant (Dark), right, IBM Plex Sans Arabic, 16/400/1.2/-0.32
    Widget _subtitle() => SizedBox(
      width: double.infinity,
      child: Text(
        'اعرض أعمالك الإبداعية واجعل معرضك الشخصي يتألق',
        textAlign: TextAlign
            .center, // CSS: right (لو تحب دعم RTL/LTR استخدم TextAlign.start)
        style: theme.textTheme.bodyMedium?.copyWith(
          fontFamily: 'IBM Plex Sans Arabic',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.2, // 120%
          letterSpacing: -0.32, // -0.32px
          color: isLight ? const Color(0xFF7A7A7A) : cs.onSurfaceVariant,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isLandscape = constraints.maxWidth > constraints.maxHeight;

              // ✅ استدعاء الهيدر من ملف واحد
              final topBar = AppHeaderBar(
                title: 'معرض أعمالي',
                onBack: () => Navigator.pop(context),
                iconLTR: AppIcons.chevronRight, // كما عندك
                iconRTL: AppIcons.chevronLeft, // كما عندك
                tapArea: 48,
                iconSize: 28,
              );

              if (!isLandscape) {
                // -------- Portrait
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      topBar,
                      const SizedBox(height: 60),
                      _illustration(),
                      const SizedBox(height: 40),
                      _headline(),
                      const SizedBox(height: 16),
                      _subtitle(),
                      const Spacer(),
                      CtaButton(
                        label: 'إضافة عمل جديد',
                        icon: AppIcons.add,
                        width: 343,
                        height: 48,
                        onPressed: () {},
                      ),
                      const Spacer(flex: 3),
                    ],
                  ),
                );
              }

              // -------- Landscape (Scrollable)
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      topBar,
                      const SizedBox(height: 24),
                      _illustration(),
                      const SizedBox(height: 24),
                      _headline(),
                      const SizedBox(height: 12),
                      _subtitle(),
                      const SizedBox(height: 24),
                      CtaButton(
                        label: 'إضافة عمل جديد',
                        icon: AppIcons.add,
                        fullWidth: true,
                        height: 48,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 24),
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
