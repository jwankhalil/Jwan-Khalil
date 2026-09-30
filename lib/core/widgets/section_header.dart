import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/constants/app_dimens.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/core/widgets/animated_icon_badge.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.eyebrowKey,
    required this.titleKey,
    this.subtitleKey,
    this.icon,
    super.key,
  });

  final String eyebrowKey;
  final String titleKey;
  final String? subtitleKey;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              AnimatedIconBadge(icon: icon!),
              const SizedBox(width: AppDimens.space16),
            ],
            Text(
              eyebrowKey.tr().toUpperCase(),
              style: AppTextStyles.labelLarge(colors),
            )
                .animate()
                .fadeIn(duration: 400.ms)
                .slideX(begin: -0.06, end: 0),
          ],
        ),
        const SizedBox(height: AppDimens.space12),
        Text(titleKey.tr(), style: AppTextStyles.headlineLarge(colors))
            .animate(delay: 80.ms)
            .fadeIn(duration: 500.ms)
            .slideY(begin: 0.08, end: 0),
        if (subtitleKey != null) ...[
          const SizedBox(height: AppDimens.space12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Text(
              subtitleKey!.tr(),
              style: AppTextStyles.bodyLarge(colors),
            )
                .animate(delay: 160.ms)
                .fadeIn(duration: 500.ms)
                .slideY(begin: 0.06, end: 0),
          ),
        ],
      ],
    );
  }
}
