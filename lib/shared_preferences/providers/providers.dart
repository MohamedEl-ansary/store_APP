import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:saber_static_ui/shared_preferences/services/shared_preferences_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Raw SharedPreferences instance provider
/// This must be overridden in bootstrap.dart with an actual instance
final sharedPrefsInstanceProvider = Provider<SharedPreferences>(
  (_) => throw UnimplementedError('Override me in bootstrap()'),
);

/// Main provider for SharedPreferencesNotifier
final preferencesNotifierProvider =
    StateNotifierProvider<SharedPreferencesNotifier, PreferencesState>((ref) {
  // Get the SharedPreferences instance from the instance provider
  final prefs = ref.watch(sharedPrefsInstanceProvider);
  return SharedPreferencesNotifier(prefs);
});

/// Convenience provider for direct access to SharedPreferences instance
final prefsInstanceProvider = Provider<SharedPreferences>((ref) {
  return ref.watch(preferencesNotifierProvider).prefs;
});

/// Convenience provider for direct access to preferences data
final prefsDataProvider = Provider<Map<String, dynamic>>((ref) {
  return ref.watch(preferencesNotifierProvider).data;
});
