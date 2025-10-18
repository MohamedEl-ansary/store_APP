import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saber_static_ui/shared_preferences/shared_preferences.dart';
import 'package:saber_static_ui/test_dashboard/MyPortfolioGalleryPage.dart';
import 'package:saber_static_ui/test_dashboard/test_screen.dart';
import 'package:saber_static_ui/test_dashboard/My%20Portfolio.dart';
import 'package:saber_static_ui/themes/app_theme.dart';
import 'package:saber_static_ui/themes/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPrefsInstanceProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MyApp(),
    ),
  );
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'root',
      builder: (context, state) => const TestScreen(),
      routes: [
        // My gallery page
        GoRoute(
          path: 'gallery',
          name: 'gallery',
          builder: (context, state) => const MyPortfolioGallery(),
          routes: [
            // List of works within the exhibition page
            GoRoute(
              path: 'page',
              name: 'galleryPage',
              builder: (context, state) => const MyPortfolioGalleryPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: lightTheme(locale: const Locale('en')),
      darkTheme: darkTheme(locale: const Locale('en')),
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
    );
  }
}
