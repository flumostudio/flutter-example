import 'package:flutter/material.dart';
import 'package:flumo_flutter_example/core/theme/app_colors.dart';

/// Centralized typography helpers for consistent text styling.
class AppTypography {
  /// Bold medium title in black.
  static TextStyle? titleMediumBoldBlack(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.black,
          );

  /// Bold small title in black.
  static TextStyle? titleSmallBoldBlack(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.black,
          );
}
