# iOS usage

This folder contains a simple SwiftUI-ready implementation of the current color system.

Files:
- `ThemeModels.swift`
- `Color+Hex.swift`
- `ThemeLibrary.swift`

Basic usage:

```swift
let theme = TOFAThemeLibrary.resolvedTheme(for: .august, mode: .day)
```

Theme result:
- `background`
- `primaryText`
- `secondaryText`
- `line`
- `attention`

Night mode does not create any new colors.
It only reassigns roles inside the same monthly set.
