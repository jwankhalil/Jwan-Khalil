import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_dimens.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';

class AppPrimaryButton extends StatefulWidget {
  const AppPrimaryButton({
    required this.label,
    required this.onPressed,
    this.icon,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  @override
  State<AppPrimaryButton> createState() => _AppPrimaryButtonState();
}

class _AppPrimaryButtonState extends State<AppPrimaryButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedScale(
        scale: _isHovered ? 1.03 : 1,
        duration: const Duration(milliseconds: 180),
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: _isHovered ? colors.accentDark : colors.accent,
            shadowColor: colors.accent.withValues(alpha: 0.35),
            elevation: _isHovered ? 8 : 0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, size: 18),
                const SizedBox(width: AppDimens.space8),
              ],
              Text(
                widget.label,
                style: AppTextStyles.button(colors).copyWith(
                  color: AppColors.darkBackground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppSecondaryButton extends StatefulWidget {
  const AppSecondaryButton({
    required this.label,
    required this.onPressed,
    this.icon,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  @override
  State<AppSecondaryButton> createState() => _AppSecondaryButtonState();
}

class _AppSecondaryButtonState extends State<AppSecondaryButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: OutlinedButton(
        onPressed: widget.onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: _isHovered ? colors.accent : colors.border,
          ),
          foregroundColor: colors.textPrimary,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.icon != null) ...[
              Icon(widget.icon, size: 18),
              const SizedBox(width: AppDimens.space8),
            ],
            Text(widget.label, style: AppTextStyles.button(colors)),
          ],
        ),
      ),
    );
  }
}
