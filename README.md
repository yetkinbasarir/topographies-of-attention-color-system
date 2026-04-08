# topographies-of-attention-color-system

Color system repository for **t-of-a**.

This repository contains the current reference implementation of the **Topographies of Attention** color system for future iOS apps.

## Source of truth
The token file is the source of truth:

`tokens/topographies-of-attention-color-system.json`

HTML files are visual references.

## What is included
- `reference/` visual reference files
- `tokens/` machine-readable source of truth
- `Sources/TOFAColorSystem/` Swift Package source for Xcode and iOS apps
- `docs/` design rules and change notes
- `index.html` root visual reference for GitHub Pages

## Core principles
- colors never change between day and night
- night mode is built only by role reassignment
- topography is the primary monthly reference
- attention is always the line color
- shell colors come only from the reference sets

## Theme count
This system exposes **26 defined theme codes**:
- 2 shell themes
- 12 monthly day themes
- 12 monthly night themes

## Xcode integration
This repository includes a Swift Package:
- package name: `TOFAColorSystem`
- product name: `TOFAColorSystem`

In Xcode you can add this repo as a package dependency and import:

```swift
import TOFAColorSystem
```

## Included reference
- `reference/t-of-a-day-night-system-v11.html`
- `index.html`
