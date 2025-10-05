# SharedPreferences System Documentation

## Access
```dart
// Providers
ref.watch(preferencesNotifierProvider).notifier // SharedPreferencesNotifier
ref.watch(prefsInstanceProvider) // SharedPreferences
ref.watch(prefsDataProvider) // Map<String, dynamic> cache
```

## Core Operations
Type-specific getters/setters follow pattern: get{Type}(key, defaultValue) / set{Type}(key, value)
Types: String, Int, Double, Bool, StringList

```dart
notifier.getString("key", defaultValue: "")
await notifier.setString("key", "value") // returns Future<bool>

// Generic auto-type detection
await notifier.set("key", anyValue)
notifier.containsKey("key")
await notifier.remove("key")
await notifier.clear()
```

## Extended Types
```dart
// DateTime via ISO8601 string
await notifier.setDateTime("key", DateTime.now())
notifier.getDateTime("key") // DateTime?

// Uri via toString
await notifier.setUri("key", uri)
notifier.getUri("key") // Uri?

// JSON via jsonEncode/decode
await notifier.setJson("key", object)
notifier.getJson("key", (json) => MyClass.fromJson(json))
```

## Batch Operations
```dart
await notifier.setMultiple({"k1": "v1", "k2": 42})
notifier.getMultiple(["k1", "k2"]) // Map<String, dynamic>
await notifier.updateValue<int>("counter", (curr) => (curr ?? 0) + 1)
```

## Bootstrap
```dart
// In bootstrap.dart
final prefs = await SharedPreferences.getInstance();
container.updateOverrides([
  sharedPrefsInstanceProvider.overrideWithValue(prefs),
]);
```

## Notes
- All writes return Future<bool> success indicator
- Reads synchronous from cached Map<String, dynamic>
- State changes trigger provider rebuilds
- Uses ConvertObject for safe type conversions
- null values handled via remove()
