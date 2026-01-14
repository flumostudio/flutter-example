import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flumo_flutter_example/core/theme/app_colors.dart';
import 'package:flumo_flutter_example/core/theme/app_spacing.dart';
import 'package:flumo_flutter_example/core/theme/app_typography.dart';
import 'package:flumo_flutter_example/core/theme/neo_brutal_theme.dart';
import 'package:flutter/services.dart';

class NeoBrutalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NeoBrutalAppBar({
    required this.title,
    this.actions,
    this.leading,
    this.colorSeedIndex = 0,
    super.key,
  });
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final int colorSeedIndex;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8);

  @override
  Widget build(BuildContext context) {
    final bg = NeoBrutalTheme.palette[colorSeedIndex % NeoBrutalTheme.palette.length];
    final canPop = Navigator.of(context).canPop();
    final leadingWidget = leading ??
        (canPop
            ? IconButton(
                onPressed: () => Navigator.of(context).maybePop(),
                icon: Icon(
                  Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                  color: AppColors.black,
                ),
              )
            : const SizedBox.shrink());

    return AppBar(
      backgroundColor: bg,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      leading: leadingWidget,
      titleSpacing: 0,
      toolbarHeight: kToolbarHeight + AppSpacing.xs + AppSpacing.xs,
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTypography.titleMediumBoldBlack(context),
      ),
      actions: actions,
      flexibleSpace: DecoratedBox(
        decoration: BoxDecoration(
          color: bg,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.22),
              offset: const Offset(2, 2),
              blurRadius: 2,
            ),
          ],
          border: Border.all(width: 2),
        ),
      ),
    );
  }
}
