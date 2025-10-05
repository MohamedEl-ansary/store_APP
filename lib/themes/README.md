# Flutter Theme API Reference

## Core Rule
Use theme colors for automatic dark mode. **AppColors is reserved for brightness-invariant tokens only** (brand colors, semantic foregrounds, neutrals, utilities). Brightness-specific colors (surfaces, outlines, alert containers, input backgrounds, etc.) live in `ThemeData` / `ColorScheme` or dedicated `ThemeExtension`s (see `AppSemanticColors`).

## Color Mappings

Text:
- Primary: colorScheme.onSurface
- Secondary: colorScheme.onSurfaceVariant  
- Placeholder: colorScheme.onSurfaceVariant.setOpacity(0.7)
- Disabled: colorScheme.onSurface.setOpacity(0.38)
- Error: colorScheme.error
- Link: colorScheme.primary

Backgrounds:
- App: scaffoldBackgroundColor
- Card: colorScheme.surfaceContainerLow
- Input: colorScheme.surfaceContainerLow
- Elevated: colorScheme.surface
- Modal: colorScheme.surfaceContainerHighest
- Semantic banners/chips: `theme.semantic.[success|warning|danger|info]Container`

Borders:
- Default: colorScheme.outline
- Focus: colorScheme.primary
- Error: colorScheme.error
- Divider: colorScheme.outline.setOpacity(0.5)

Icons:
- Primary: colorScheme.onSurface
- Secondary: colorScheme.onSurfaceVariant
- Action: colorScheme.primary
- Disabled: colorScheme.onSurface.setOpacity(0.38)

## RTL/LTR Directional Properties

Required mappings for multi-language support:
- EdgeInsets.only(left|right) → EdgeInsetsDirectional.only(start|end)
- Alignment.center[Left|Right] → AlignmentDirectional.center[Start|End]
- Border([left|right]: side) → BorderDirectional([start|end]: side)
- BorderRadius.only(top[Left|Right]) → BorderRadiusDirectional.only(top[Start|End])
- Positioned([left|right]: value) → PositionedDirectional([start|end]: value)
- AnimatedPositioned([left|right]) → AnimatedPositionedDirectional([start|end])
- TextAlign.[left|right] → TextAlign.[start|end]

Hint: using the flutter_helper_utils package:
you have `final isRTL = context.isRTL` & `context.isLTR`, `context.directionality` and `context.locale`.

## Theme Helpers (flutter_helper_utils)

Direct access shortcuts:
```dart
final theme = context.themeData;
Text('Title', style: theme.bodyMedium)
Text('Subtitle', style: theme.labelSmallCopy(color: theme.primary))
final primary = theme.primary;      // Instead of theme.colorScheme.primary
final isLight = theme.isLight;      // Check if light theme
```

## Widget Examples

Text with theme:
```dart
Text('Title', style: Theme.of(context).textTheme.bodyMedium)
Text('Subtitle', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant))
```

Container with borders:
```dart
Container(
  padding: EdgeInsetsDirectional.only(start: 16, end: 8),
  alignment: AlignmentDirectional.centerStart,
  decoration: BoxDecoration(
    color: Theme.of(context).colorScheme.surfaceContainerLow,
    border: BorderDirectional(
      start: BorderSide(color: Theme.of(context).colorScheme.outline),
    ),
    borderRadius: BorderRadiusDirectional.only(
      topStart: Radius.circular(8),
    ),
  ),
  child: content,
)
```

Input field:
```dart
TextField(
  textAlign: TextAlign.start,
  decoration: InputDecoration(
    filled: true,
    fillColor: Theme.of(context).colorScheme.surfaceContainerLow,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
    ),
  ),
)
```

Buttons:
```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Theme.of(context).colorScheme.primary,
    foregroundColor: Theme.of(context).colorScheme.onPrimary,
  ),
  onPressed: () {},
  child: Text('Submit'),
)
```

## Opacity Values
- High emphasis: 1.0
- Medium emphasis: 0.74
- Disabled: 0.38
- Dividers: 0.12

CRITICAL: Use .setOpacity(double) not .setOpacity. Flutter deprecated setOpacity for withValues(alpha:).
setOpacity wraps the new API: color.setOpacity(0.7) → color.withValues(alpha: 0.7)

## Migration Notes
- Removed `AppColors` entries that depended on theme brightness (e.g. `bg`, `bgHome`, `surfaceContainer`, `errorContainer`, `messagesBg`, etc.). Use `Theme.of(context).colorScheme` or `theme.semantic` instead.
- `AppColors.light500` → `AppColors.primaryTint`
- `AppColors.light700` → `AppColors.primaryShade`

## Testing
```dart
MaterialApp(
  theme: lightTheme(),
  darkTheme: darkTheme(),
  themeMode: ThemeMode.system,  // Toggle to test both modes
)
```
## Icons

**CRITICAL**: Always use AppIcons. Never any icon libraries directly in code.

### Icon Selection Priority
With 25k+ icons available in HugeIcons, follow this priority order:

1. **Use existing AppIcons** - Check current definitions first
2. **Search HugeIcons** - If not in AppIcons, search through HugeIcons library and add to AppIcons
3. **Material Icons** - If not in HugeIcons, use standard Material Icons
4. **Cupertino Icons** - Last resort for iOS-specific icons

### Adding Icons to AppIcons
```dart
// Add from HugeIcons (priority 2)
static const IconData edit_02_bold = HugeIcons.strokeRoundedEdit02;

// Add from Material Icons (priority 3)
static const IconData share = Icons.share;

// Add from Cupertino Icons (priority 4)
static const IconData ios_settings = CupertinoIcons.settings;
```
Figma Rules:
- When I share figma code, it will be a reference for the actual design to get things closer, not to use it eaxctly as is.
- If there is a specific color very close (90%+) to what we have in our theme objects we just use it instead.
- If there is a color that is not inside our colors system, we just coansider it special case in this component and we just add it hardcoded.
