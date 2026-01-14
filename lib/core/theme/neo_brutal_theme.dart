import 'package:flutter/material.dart';
import 'package:flumo_flutter_example/core/theme/app_colors.dart';
import 'package:flumo_flutter_example/core/theme/app_radius.dart';

class NeoBrutalTheme {
  /// Shared palette sourced from [AppColors.palette].
  static const List<Color> palette = AppColors.palette;

  static BoxDecoration card(int seed) {
    final color = palette[seed % palette.length];
    return BoxDecoration(
      color: color,
      borderRadius: AppRadius.card,
      border: Border.all(width: 2),
      boxShadow: [
        BoxShadow(
          color: AppColors.black.withValues(alpha: 0.22),
          offset: const Offset(2, 2),
          blurRadius: 2,
        ),
      ],
    );
  }

  static BoxDecoration cleanCard(int seed) {
    final accent = palette[seed % palette.length];
    return BoxDecoration(
      color: AppColors.white,
      borderRadius: AppRadius.card,
      border: Border.all(width: 2, color: accent),
      boxShadow: [
        BoxShadow(
          color: AppColors.black.withValues(alpha: 0.12),
          offset: const Offset(2, 2),
          blurRadius: 2,
        ),
      ],
    );
  }

  static BoxDecoration cleanCardWarm() {
    return BoxDecoration(
      color: AppColors.white,
      borderRadius: AppRadius.card,
      border: Border.all(width: 1.5),
      boxShadow: [
        BoxShadow(
          color: AppColors.black.withValues(alpha: 0.08),
          offset: const Offset(1.5, 1.5),
          blurRadius: 3,
        ),
      ],
    );
  }
}
