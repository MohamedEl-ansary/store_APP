import 'dart:async';

import 'package:flutter_helper_utils/flutter_helper_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shared_preferences/shared_preferences.dart';

// State class to hold preferences data and instance
class PreferencesState {
  const PreferencesState({
    required this.prefs,
    required this.data,
  });

  final SharedPreferences prefs;
  final Map<String, dynamic> data;

  PreferencesState copyWith({
    SharedPreferences? prefs,
    Map<String, dynamic>? data,
  }) {
    return PreferencesState(
      prefs: prefs ?? this.prefs,
      data: data ?? this.data,
    );
  }
}

/// Interface for persistent storage services
abstract class StorageService {
  /// Gets a string value
  String getString(String key, {String defaultValue});

  /// Sets a string value
  Future<bool> setString(String key, String value);

  /// Gets an integer value
  int getInt(String key, {int defaultValue});

  /// Sets an integer value
  Future<bool> setInt(String key, int value);

  /// Gets a double value
  double getDouble(String key, {double defaultValue});

  /// Sets a double value
  Future<bool> setDouble(String key, double value);

  /// Gets a boolean value
  bool getBool(String key, {bool defaultValue});

  /// Sets a boolean value
  Future<bool> setBool(String key, bool value);

  /// Gets a list of strings
  List<String> getStringList(String key, {List<String> defaultValue});

  /// Sets a list of strings
  Future<bool> setStringList(String key, List<String> value);

  /// Removes a value
  Future<bool> remove(String key);

  /// Clears all values
  Future<bool> clear();

  /// Checks if a key exists
  bool containsKey(String key);
}

// Comprehensive StateNotifier for all SharedPreferences operations
class SharedPreferencesNotifier extends StateNotifier<PreferencesState>
    implements StorageService {
  SharedPreferencesNotifier(SharedPreferences prefs)
      : super(PreferencesState(prefs: prefs, data: {})) {
    _loadAllPreferences();
  }

  // Expose the SharedPreferences instance
  SharedPreferences get prefs => state.prefs;

  // Load all preferences into state
  void _loadAllPreferences() {
    final allKeys = state.prefs.getKeys();
    final loadedData = <String, dynamic>{};

    for (final key in allKeys) {
      loadedData[key] = state.prefs.get(key);
    }

    state = state.copyWith(data: loadedData);
  }

  // CREATE/UPDATE operations
  @override
  Future<bool> setString(String key, String value) async {
    final success = await state.prefs.setString(key, value);
    if (success) {
      state = state.copyWith(
        data: {...state.data, key: value},
      );
    }
    return success;
  }

  @override
  Future<bool> setInt(String key, int value) async {
    final success = await state.prefs.setInt(key, value);
    if (success) {
      state = state.copyWith(
        data: {...state.data, key: value},
      );
    }
    return success;
  }

  @override
  Future<bool> setDouble(String key, double value) async {
    final success = await state.prefs.setDouble(key, value);
    if (success) {
      state = state.copyWith(
        data: {...state.data, key: value},
      );
    }
    return success;
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    final success = await state.prefs.setBool(key, value);
    if (success) {
      state = state.copyWith(
        data: {...state.data, key: value},
      );
    }
    return success;
  }

  @override
  Future<bool> setStringList(String key, List<String> value) async {
    final success = await state.prefs.setStringList(key, value);
    if (success) {
      state = state.copyWith(
        data: {...state.data, key: value},
      );
    }
    return success;
  }

  // Generic set method using dart_helper_utils
  Future<bool> set<T>(String key, T value) async {
    if (value == null) return remove(key);

    var success = false;

    if (value is String) {
      success = await setString(key, value);
    } else if (value is int) {
      success = await setInt(key, value);
    } else if (value is double) {
      success = await setDouble(key, value);
    } else if (value is bool) {
      success = await setBool(key, value);
    } else if (value is List<String>) {
      success = await setStringList(key, value);
    } else {
      // Convert to string for complex objects
      success = await setString(key, value.toString());
    }

    return success;
  }

  // Specific getters with defaults
  @override
  String getString(String key, {String defaultValue = ''}) {
    return state.data[key]?.toString() ?? defaultValue;
  }

  @override
  int getInt(String key, {int defaultValue = 0}) {
    return ConvertObject.toInt(state.data[key], defaultValue: defaultValue);
  }

  @override
  double getDouble(String key, {double defaultValue = 0.0}) {
    return ConvertObject.toDouble(state.data[key], defaultValue: defaultValue);
  }

  @override
  bool getBool(String key, {bool defaultValue = false}) {
    return ConvertObject.toBool(state.data[key], defaultValue: defaultValue);
  }

  @override
  List<String> getStringList(
    String key, {
    List<String> defaultValue = const [],
  }) {
    return ConvertObject.toList<String>(
      state.data[key],
      defaultValue: defaultValue,
    );
  }

  // DELETE operations
  @override
  Future<bool> remove(String key) async {
    final success = await state.prefs.remove(key);
    if (success) {
      final newData = Map<String, dynamic>.from(state.data)..remove(key);
      state = state.copyWith(data: newData);
    }
    return success;
  }

  @override
  Future<bool> clear() async {
    final success = await state.prefs.clear();
    if (success) {
      state = state.copyWith(data: {});
    }
    return success;
  }

  // Utility methods
  @override
  bool containsKey(String key) => state.data.containsKey(key);

  Set<String> get keys => state.data.keys.toSet();

  // Batch operations
  Future<void> setMultiple(Map<String, dynamic> values) async {
    for (final entry in values.entries) {
      await set(entry.key, entry.value);
    }
  }

  Map<String, dynamic> getMultiple(List<String> keys) {
    final result = <String, dynamic>{};
    for (final key in keys) {
      if (containsKey(key)) {
        result[key] = state.data[key];
      }
    }
    return result;
  }

  // Advanced operations
  Future<void> updateValue<T>(
    String key,
    T Function(T? current) updater,
  ) async {
    final currentValue = toType<T>(key);
    final newValue = updater(currentValue);
    await set(key, newValue);
  }
}
