import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/constants/app_dimens.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/core/widgets/animated_section.dart';
import 'package:portfolio/core/widgets/section_header.dart';
import 'package:portfolio/features/portfolio/domain/entities/experience.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({required this.experiences, super.key});

  final List<Experience> experiences;

  @override
  Widget build(BuildContext context) {
    return AnimatedSection(
      id: 'experience-section',
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimens.space64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              eyebrowKey: 'experience.eyebrow',
              titleKey: 'experience.title',
              subtitleKey: 'experience.subtitle',
              icon: Icons.work_history_outlined,
            ),
            const SizedBox(height: AppDimens.space40),
            ...experiences.asMap().entries.map((entry) {
              return _ExperienceCard(
                experience: entry.value,
                isLast: entry.key == experiences.length - 1,
              )
                  .animate(delay: (120 * entry.key).ms)
                  .fadeIn(duration: 500.ms)
                  .slideX(begin: 0.04, end: 0);
            }),
          ],
        ),
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  const _ExperienceCard({
    required this.experience,
    required this.isLast,
  });

  final Experience experience;
  final bool isLast;

  String _formatDate(DateTime date) {
    return DateFormat.yMMM().format(date);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final period = experience.isCurrent
        ? '${_formatDate(experience.startDate)} — ${'experience.present'.tr()}'
        : '${_formatDate(experience.startDate)} — ${experience.endDate != null ? _formatDate(experience.endDate!) : ''}';

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 28,
            child: Column(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: colors.accent,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: colors.accent.withValues(alpha: 0.4),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      color: colors.border,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppDimens.space16),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                bottom: isLast ? 0 : AppDimens.space24,
              ),
              padding: const EdgeInsets.all(AppDimens.space24),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(AppDimens.radius16),
                border: Border.all(color: colors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    experience.role,
                    style: AppTextStyles.titleLarge(colors),
                  ),
                  const SizedBox(height: AppDimens.space8),
                  Text(
                    experience.company,
                    style: AppTextStyles.titleMedium(colors).copyWith(
                      color: colors.accent,
                    ),
                  ),
                  const SizedBox(height: AppDimens.space8),
                  Text(period, style: AppTextStyles.labelMedium(colors)),
                  if (experience.employmentType != null) ...[
                    const SizedBox(height: AppDimens.space4),
                    Text(
                      experience.employmentType!,
                      style: AppTextStyles.bodySmall(colors),
                    ),
                  ],
                  const SizedBox(height: AppDimens.space16),
                  ...experience.highlights.map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: AppDimens.space8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: Icon(
                              Icons.arrow_right_rounded,
                              size: 18,
                              color: colors.accent,
                            ),
                          ),
                          const SizedBox(width: AppDimens.space4),
                          Expanded(
                            child: Text(
                              item,
                              style: AppTextStyles.bodyMedium(colors),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
