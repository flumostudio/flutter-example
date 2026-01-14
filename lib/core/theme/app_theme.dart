import 'package:flutter/material.dart';
import 'package:flumo_flutter_example/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.seed),
      scaffoldBackgroundColor: AppColors.scaffoldLight,
      useMaterial3: true,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.seed,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: AppColors.scaffoldDark,
      useMaterial3: true,
    );
  }
}
