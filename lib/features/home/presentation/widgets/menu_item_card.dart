import 'package:flumo_flutter_example/core/theme/neo_brutal_theme.dart';
import 'package:flumo_flutter_example/core/theme/app_colors.dart';
import 'package:flumo_flutter_example/core/theme/app_typography.dart';
import 'package:flumo_flutter_example/core/theme/app_spacing.dart';
import 'package:flumo_flutter_example/features/home/domain/menu_item.dart';
import 'package:flutter/material.dart';

class MenuItemCard extends StatelessWidget {
  const MenuItemCard({
    required this.item,
    required this.onTap,
    required this.index,
    super.key,
  });
  final MenuItem item;
  final VoidCallback onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: NeoBrutalTheme.card(index),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, size: 28, color: AppColors.black),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: AppTypography.titleSmallBoldBlack(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
