import 'package:flutter/material.dart';

/// Centralized color definitions and palettes used across the app.
class AppColors {
  /// Primary seed color for generating Material color schemes.
  static const Color seed = Color(0xFF2B8AEF);

  /// Scaffold background colors for light/dark themes.
  static const Color scaffoldLight = Color(0xFFF7EFE6);
  static const Color scaffoldDark = Color(0xFF101010);

  /// Commonly used neutral colors.
  static const Color black = Colors.black;
  static const Color white = Colors.white;

  /// Warm accent (inspired by chat app).

  /// Neo‑brutal color palette used for cards and app bar backgrounds.
  static const List<Color> palette = <Color>[
    Color(0xFFFFE066),
    Color(0xFFFF6B6B),
    Color(0xFF4ECDC4),
    Color(0xFF96F2D7),
    Color(0xFFFFC078),
    Color(0xFFA5D8FF),
  ];

  /// Warm subset palette for subtle card accents.
  static const List<Color> warmPalette = <Color>[
    Color(0xFFFFE066), // warm yellow
    Color(0xFFFFC078), // warm orange
  ];
}
