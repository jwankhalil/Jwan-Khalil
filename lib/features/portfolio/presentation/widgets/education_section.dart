import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_dimens.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/core/widgets/animated_section.dart';
import 'package:portfolio/core/widgets/section_header.dart';
import 'package:portfolio/features/portfolio/domain/entities/certification.dart';
import 'package:portfolio/features/portfolio/domain/entities/education.dart';
import 'package:portfolio/features/portfolio/domain/entities/language_proficiency.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({
    required this.educations,
    required this.certifications,
    required this.languages,
    super.key,
  });

  final List<Education> educations;
  final List<Certification> certifications;
  final List<LanguageProficiency> languages;

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;

    return AnimatedSection(
      id: 'education-section',
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimens.space64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              eyebrowKey: 'education.eyebrow',
              titleKey: 'education.title',
              subtitleKey: 'education.subtitle',
              icon: Icons.school_outlined,
            ),
            const SizedBox(height: AppDimens.space40),
            if (isDesktop)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _Panel(
                      title: 'education.degrees'.tr(),
                      child: Column(
                        children: educations
                            .map((e) => _EducationTile(education: e))
                            .toList(),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppDimens.space24),
                  Expanded(
                    child: Column(
                      children: [
                        _Panel(
                          title: 'education.certs'.tr(),
                          child: Column(
                            children: certifications
                                .map((c) => _CertTile(certification: c))
                                .toList(),
                          ),
                        ),
                        const SizedBox(height: AppDimens.space24),
                        _Panel(
                          title: 'education.languages'.tr(),
                          child: Column(
                            children: languages
                                .map((l) => _LanguageTile(language: l))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            else ...[
              _Panel(
                title: 'education.degrees'.tr(),
                child: Column(
                  children: educations
                      .map((e) => _EducationTile(education: e))
                      .toList(),
                ),
              ),
              const SizedBox(height: AppDimens.space24),
              _Panel(
                title: 'education.certs'.tr(),
                child: Column(
                  children: certifications
                      .map((c) => _CertTile(certification: c))
                      .toList(),
                ),
              ),
              const SizedBox(height: AppDimens.space24),
              _Panel(
                title: 'education.languages'.tr(),
                child: Column(
                  children: languages
                      .map((l) => _LanguageTile(language: l))
                      .toList(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Panel extends StatelessWidget {
  const _Panel({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimens.space24),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppDimens.radius16),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.titleMedium(colors)),
          const SizedBox(height: AppDimens.space16),
          child,
        ],
      ),
    );
  }
}

class _EducationTile extends StatelessWidget {
  const _EducationTile({required this.education});

  final Education education;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final period = education.isCurrent
        ? '${education.startDate?.year ?? ''} — ${'experience.present'.tr()}'
        : '${education.startDate?.year ?? ''} — ${education.endDate?.year ?? ''}';

    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.space16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.school_outlined, color: colors.accent, size: 22),
          const SizedBox(width: AppDimens.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(education.degree, style: AppTextStyles.titleMedium(colors)),
                const SizedBox(height: AppDimens.space4),
                Text(
                  education.institution,
                  style: AppTextStyles.bodyMedium(colors),
                ),
                Text(period, style: AppTextStyles.labelMedium(colors)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CertTile extends StatelessWidget {
  const _CertTile({required this.certification});

  final Certification certification;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.space12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.verified_outlined, color: colors.accent, size: 20),
          const SizedBox(width: AppDimens.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  certification.title,
                  style: AppTextStyles.bodyMedium(colors).copyWith(
                    color: colors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  certification.issuer,
                  style: AppTextStyles.bodySmall(colors),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  const _LanguageTile({required this.language});

  final LanguageProficiency language;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.space12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              language.name,
              style: AppTextStyles.bodyMedium(colors).copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(language.proficiency, style: AppTextStyles.labelMedium(colors)),
        ],
      ),
    );
  }
}
