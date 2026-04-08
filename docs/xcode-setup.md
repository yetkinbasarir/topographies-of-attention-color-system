# Xcode setup

## Add package
In Xcode:
- File
- Add Package Dependencies...
- paste the repository URL
- choose the latest version or branch
- add product: `TOFAColorSystem`

## Minimum app-facing theme API
- `TOFAThemeLibrary.shellTheme(for:)`
- `TOFAThemeLibrary.monthlyTheme(for:phase:)`
- `TOFAThemeLibrary.bundle(month:phase:)`
- `TOFAThemeResolver.bundle(for:phase:)`
- `TOFAThemeResolver.bundle(for:sunrise:sunset:)`

## Contract
Apps should not hardcode colors.
Apps should read from this package only.
