# Saber Static UI

Frontend playground for Saber design explorations. The app stitches together UI demo flows using Riverpod for state management and SharedPreferences for lightweight persistence.

## Prerequisites
- Flutter SDK 3.19.0+ (project uses Dart 3.9.2 SDK constraint)
- Xcode or Android Studio toolchain for your target platform
- An emulator/simulator or a connected device

## Quick Start
1. Install Flutter dependencies:
   ```bash
   flutter pub get
   ```
2. Choose a target and run the app:
   ```bash
   flutter run
   ```
3. Hot restart (`r`) after code changes, hot reload (`R`) for Dart-only edits.

## Project Notes
- `main.dart` bootstraps a global `ProviderScope`, wiring SharedPreferences into Riverpod. Without this scope you'll see "no ProviderScope found" errors.
- Theme state lives in `lib/themes/theme_provider.dart` via a `StateNotifier`. Use `themeModeProvider` to read/write the current theme.
- SharedPreferences helpers reside under `lib/shared_preferences/` and expose convenient setters/getters plus memoized map access.
- The current UI entry point is `TestScreen` (`lib/test_dashboard/test_screen.dart`) which lists placeholder flows for interns to implement.

## Common Tasks for New Contributors
- Add a new UI example: create a widget under `lib/test_dashboard/` and hook it into `TestScreen`.
- Persist onboarding flags or sample settings: inject `preferencesNotifierProvider` and call the appropriate setter.
- Update theming: tweak the color schemes in `lib/themes/app_theme.dart` and adjust typography as needed.

## Troubleshooting
- **No ProviderScope found**: ensure `main.dart` is used as-is so Riverpod has a root scope with the SharedPreferences override.
- **Stale dependencies**: run `flutter pub upgrade` or `flutter pub get`.
- **Analyzer warnings**: `flutter analyze` surfaces lint issues enforced by `analysis_options.yaml`.

Happy building!
