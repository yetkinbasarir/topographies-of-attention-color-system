# TOFAColorSystem Swift Package

This repository is ready to be added to Xcode as a Swift Package.

## Package product
- `TOFAColorSystem`

## Import
```swift
import TOFAColorSystem
```

## What the package gives you
- 26 directly addressable theme codes
- 2 shell themes
- 12 monthly day themes
- 12 monthly night themes
- role-based day/night resolution with no color mutation
- date/month and solar-phase helpers

## Fast start
```swift
let shell = TOFAThemeLibrary.shellTheme(for: .day)
let augustDay = TOFAThemeLibrary.monthlyTheme(for: .august, phase: .day)
let bundle = TOFAThemeLibrary.bundle(month: .august, phase: .night)
```

## Automatic date-based access
```swift
let bundle = TOFAThemeResolver.bundle(for: Date(), phase: .day)
```

## Sunrise / sunset based access
```swift
let bundle = TOFAThemeResolver.bundle(
    for: Date(),
    sunrise: sunriseDate,
    sunset: sunsetDate
)
```

## Theme count
```swift
let count = TOFAThemeLibrary.themeCount // 26
```
