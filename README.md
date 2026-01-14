# Flumo Flutter Example

A pragmatic Flutter example application built for showcasing experiments across multiple feature areas. It emphasizes clean architecture, modular design, and rapid prototyping while maintaining clarity, low boilerplate, Effective Dart, and null safety.

## Highlights

- Clean architecture and modular feature design ready for many experiments
- Centralized routing, theming, and reusable UI tokens
- Rapid prototyping with minimal boilerplate
- Experiments are isolated per feature to avoid cross‑coupling
- Deterministic sample data for reliable demos
- Strong hygiene: Effective Dart, null safety, static analysis, and tests

## Tech Stack

- Core

  - Flutter `>=3.3.0`
  - Dart null safety, Effective Dart conventions
  - Static analysis: `very_good_analysis`, `flutter_lints`
  - Testing: `flutter_test`

## Project Structure

```
lib/
  app/                         # App entry
  core/
    routing/app_routes.dart    # Centralized route names and navigation
    theme/                     # Colors, spacing, radius, typography
    widgets/                   # Shared UI widgets (e.g., AppBar)
  features/
    home/                      # Home grid navigation to examples
    map_cluster/
      data/                    # Models, repositories (dummy data)
      domain/                  # Entities and domain contracts
      presentation/            # Pages and widgets for UI
```

## Experiments Catalog

- Map (current example)
  - Carto basemaps (`https://{s}.basemaps.cartocdn.com/...`)
  - Wave ripple animation for cluster bubbles
  - Blue pin markers aligned precisely to coordinates
  - Dummy city/POI data (e.g., Jakarta, Bandung, Surabaya) with deterministic counts
- Neo‑brutal UI elements
  - `NeoBrutalAppBar` with safe‑area handling
  - `NeoBrutalTheme` tokens: clean cards, palette, radius, spacing

## Conventions

- Effective Dart style and full null safety
- Filenames: `lower_snake_case`
- Classes: `UpperCamelCase`
- Variables: `lowerCamelCase`
- Constants: `UPPER_SNAKE_CASE`
- Prefer `const` widgets for performance
- Modular feature structure; avoid heavy logic in `main.dart`
- Logging for experiments; minimal boilerplate

## Getting Started

1. Install Flutter (`>=3.3.0`)
2. Fetch dependencies:
   ```
   flutter pub get
   ```
3. Run static analysis and tests:
   ```
   flutter analyze
   flutter test
   ```
4. Launch the app:
   ```
   flutter run
   ```

## Platform Identifiers

- Android `applicationId`: `studio.flumo.example`
- iOS bundle identifier: `studio.flumo.example`

## Contributing

- Keep changes aligned with clean architecture and the existing feature layout.
- Follow the coding conventions listed above.
- Ensure `flutter analyze` and `flutter test` pass before submitting.

## License

This repository is intended for educational and experimental purposes. If you plan to adopt it for production, please introduce a license appropriate for your use case.
