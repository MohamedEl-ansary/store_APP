import 'dart:async';
import 'dart:convert';

import 'package:saber_static_ui/shared_preferences/services/shared_preferences_notifier.dart';

/// Extension methods for SharedPreferencesNotifier
extension PrefsExtension on SharedPreferencesNotifier {
  /// Get a value as DateTime
  DateTime? getDateTime(String key) {
    final value = getString(key);
    if (value.isEmpty) return null;

    try {
      return DateTime.parse(value);
    } catch (_) {
      return null;
    }
  }

  /// Save a DateTime value
  Future<bool> setDateTime(String key, DateTime value) {
    return setString(key, value.toIso8601String());
  }

  /// Get value as Uri
  Uri? getUri(String key) {
    final value = getString(key);
    if (value.isEmpty) return null;

    try {
      return Uri.parse(value);
    } catch (_) {
      return null;
    }
  }

  /// Save a URI value
  Future<bool> setUri(String key, Uri value) {
    return setString(key, value.toString());
  }

  /// Save an object as JSON
  Future<bool> setJson<T>(String key, T value) {
    try {
      final jsonString = jsonEncode(value);
      return setString(key, jsonString);
    } catch (_) {
      return Future.value(false);
    }
  }

  /// Get a JSON object
  T? getJson<T>(String key, T Function(Map<String, dynamic> json) fromJson) {
    final value = getString(key);
    if (value.isEmpty) return null;

    try {
      final map = jsonDecode(value) as Map<String, dynamic>;
      return fromJson(map);
    } catch (_) {
      return null;
    }
  }
}
