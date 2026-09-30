import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/constants/app_dimens.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/core/widgets/animated_icon_badge.dart';
import 'package:portfolio/core/widgets/animated_section.dart';
import 'package:portfolio/core/widgets/section_header.dart';
import 'package:portfolio/features/portfolio/domain/entities/skill.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({required this.skillsByCategory, super.key});

  final Map<String, List<Skill>> skillsByCategory;

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  bool _isVisible = false;

  IconData _iconFor(String? key) {
    return switch (key) {
      'bloc' || 'cubit' => Icons.account_tree_outlined,
      'provider' || 'getx' => Icons.sync_alt_rounded,
      'architecture' || 'feature' || 'mvvm' => Icons.layers_outlined,
      'api' || 'dio' || 'graphql' => Icons.cloud_outlined,
      'router' || 'di' => Icons.alt_route_rounded,
      'git' || 'github' => Icons.merge_type_rounded,
      'firebase' => Icons.local_fire_department_outlined,
      'responsive' || 'theme' || 'material' => Icons.palette_outlined,
      _ => Icons.bolt_outlined,
    };
  }

  IconData _categoryIcon(String category) {
    final lower = category.toLowerCase();
    if (lower.contains('state') || lower.contains('الحالة')) {
      return Icons.hub_outlined;
    }
    if (lower.contains('arch') || lower.contains('هندس')) {
      return Icons.account_tree_outlined;
    }
    if (lower.contains('api') || lower.contains('network') || lower.contains('واجه')) {
      return Icons.cloud_queue_outlined;
    }
    if (lower.contains('nav') || lower.contains('di') || lower.contains('تنقل')) {
      return Icons.route_outlined;
    }
    if (lower.contains('tool') || lower.contains('أدوا')) {
      return Icons.build_circle_outlined;
    }
    return Icons.widgets_outlined;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final entries = widget.skillsByCategory.entries.toList();

    return AnimatedSection(
      id: 'skills-section',
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimens.space64),
        child: VisibilityDetector(
          key: const Key('skills-cascade'),
          onVisibilityChanged: (info) {
            if (!_isVisible && info.visibleFraction > 0.12) {
              setState(() => _isVisible = true);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                eyebrowKey: 'skills.eyebrow',
                titleKey: 'skills.title',
                subtitleKey: 'skills.subtitle',
                icon: Icons.auto_awesome_rounded,
              ),
              const SizedBox(height: AppDimens.space40),
              ...entries.asMap().entries.map((mapEntry) {
                final index = mapEntry.key;
                final category = mapEntry.value.key;
                final skills = mapEntry.value.value;

                return Padding(
                  padding: const EdgeInsets.only(bottom: AppDimens.space32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          AnimatedIconBadge(
                            icon: _categoryIcon(category),
                            size: 34,
                            iconSize: 16,
                          ),
                          const SizedBox(width: AppDimens.space12),
                          Text(
                            category,
                            style: AppTextStyles.titleMedium(colors),
                          ),
                        ],
                      )
                          .animate(target: _isVisible ? 1 : 0)
                          .fadeIn(delay: (80 * index).ms, duration: 400.ms)
                          .slideX(begin: -0.04, end: 0),
                      const SizedBox(height: AppDimens.space16),
                      Wrap(
                        spacing: AppDimens.space12,
                        runSpacing: AppDimens.space12,
                        children: skills.asMap().entries.map((skillEntry) {
                          final skill = skillEntry.value;
                          final delayMs =
                              90 * index + 55 * skillEntry.key;
                          final chip = _SkillChip(
                            label: skill.name,
                            icon: _iconFor(skill.iconKey),
                          );
                          if (!_isVisible) {
                            return Opacity(opacity: 0, child: chip);
                          }
                          return chip
                              .animate(delay: delayMs.ms)
                              .fadeIn(duration: 420.ms)
                              .slideY(begin: 0.12, end: 0)
                              .scale(
                                begin: const Offset(0.86, 0.86),
                                end: const Offset(1, 1),
                                curve: Curves.easeOutBack,
                              );
                        }).toList(),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillChip extends StatefulWidget {
  const _SkillChip({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.space16,
          vertical: AppDimens.space12,
        ),
        decoration: BoxDecoration(
          color: _isHovered ? colors.accentMuted : colors.surface,
          borderRadius: BorderRadius.circular(AppDimens.radius12),
          border: Border.all(
            color: _isHovered ? colors.accent : colors.border,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.icon,
              size: 18,
              color: colors.accent,
            )
                .animate(target: _isHovered ? 1 : 0)
                .rotate(begin: 0, end: 0.08),
            const SizedBox(width: AppDimens.space8),
            Text(
              widget.label,
              style: AppTextStyles.bodyMedium(colors).copyWith(
                color: colors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
