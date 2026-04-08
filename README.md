# topographies-of-attention-color-system

Color system repository for **t-of-a**.

This repository contains the current reference implementation of the
**Topographies of Attention** color system for future apps.

## Source of truth
The token file is the source of truth:

`tokens/topographies-of-attention-color-system.json`

HTML files are visual references.

## Core principles
- colors never change between day and night
- night mode is built only by role reassignment
- topography is the primary monthly reference
- line is always attention
- shell colors come only from the reference sets

## Repository structure
- `tokens/` machine-readable source of truth
- `reference/` visual reference files
- `ios/` Swift implementation files
- `docs/` design rules and change notes

## Included reference
- `reference/t-of-a-day-night-system-v11.html`
