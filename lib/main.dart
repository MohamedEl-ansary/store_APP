import 'package:flutter/material.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saber_static_ui/shared_preferences/shared_preferences.dart';
import 'package:saber_static_ui/test_dashboard/My%20Portfolio.dart';
import 'package:saber_static_ui/test_dashboard/test_screen.dart';
import 'package:saber_static_ui/themes/app_theme.dart';
import 'package:saber_static_ui/themes/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme(locale: const Locale('en')),
      darkTheme: darkTheme(locale: const Locale('en')),
      themeMode: themeMode,
      home: TestScreen(),
    );
  }
}
