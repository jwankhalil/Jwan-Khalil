import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/constants/app_dimens.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/core/widgets/animated_section.dart';
import 'package:portfolio/core/widgets/section_header.dart';
import 'package:portfolio/features/portfolio/domain/entities/project.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({required this.projects, super.key});

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = context.isDesktop
        ? 2
        : context.isTablet
            ? 2
            : 1;

    return AnimatedSection(
      id: 'projects-section',
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimens.space64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              eyebrowKey: 'projects.eyebrow',
              titleKey: 'projects.title',
              subtitleKey: 'projects.subtitle',
              icon: Icons.apps_rounded,
            ),
            const SizedBox(height: AppDimens.space40),
            LayoutBuilder(
              builder: (context, constraints) {
                final spacing = AppDimens.space24;
                final itemWidth = crossAxisCount == 1
                    ? constraints.maxWidth
                    : (constraints.maxWidth - spacing) / crossAxisCount;

                return Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children: projects.asMap().entries.map((entry) {
                    return SizedBox(
                      width: itemWidth,
                      child: _ProjectCard(project: entry.value)
                          .animate(delay: (100 * entry.key).ms)
                          .fadeIn(duration: 500.ms)
                          .slideY(begin: 0.06, end: 0)
                          .scale(
                            begin: const Offset(0.97, 0.97),
                            end: const Offset(1, 1),
                          ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({required this.project});

  final Project project;

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  Offset _pointer = Offset.zero;
  late final AnimationController _shineController;

  @override
  void initState() {
    super.initState();
    _shineController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
  }

  @override
  void dispose() {
    _shineController.dispose();
    super.dispose();
  }

  Future<void> _open(String? url) async {
    if (url == null) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final project = widget.project;
    final parallaxX = (_pointer.dx - 0.5) * (_isHovered ? 10 : 0);
    final parallaxY = (_pointer.dy - 0.5) * (_isHovered ? 8 : 0);

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _shineController.forward(from: 0);
      },
      onExit: (_) => setState(() {
        _isHovered = false;
        _pointer = const Offset(0.5, 0.5);
      }),
      onHover: (event) {
        final box = context.findRenderObject() as RenderBox?;
        if (box == null || !box.hasSize) return;
        final local = box.globalToLocal(event.position);
        setState(() {
          _pointer = Offset(
            (local.dx / box.size.width).clamp(0.0, 1.0),
            (local.dy / box.size.height).clamp(0.0, 1.0),
          );
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        transform: Matrix4.identity()
          ..translateByDouble(0, _isHovered ? -8 : 0, 0, 1),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(AppDimens.radius20),
          border: Border.all(
            color: _isHovered ? colors.accent : colors.border,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: colors.accent.withValues(alpha: 0.14),
                    blurRadius: 28,
                    offset: const Offset(0, 14),
                  ),
                ]
              : null,
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (project.imageUrl != null)
                  SizedBox(
                    height: AppDimens.projectImageHeight,
                    width: double.infinity,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          transform: Matrix4.identity()
                            ..translateByDouble(parallaxX, parallaxY, 0, 1)
                            ..scaleByDouble(
                              _isHovered ? 1.06 : 1,
                              _isHovered ? 1.06 : 1,
                              1,
                              1,
                            ),
                          child: Image.network(
                            project.imageUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              color: colors.surfaceRaised,
                              child: Icon(
                                Icons.image_outlined,
                                color: colors.textMuted,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: _isHovered ? 1 : 0,
                          duration: const Duration(milliseconds: 200),
                          child: Container(
                            color: colors.background.withValues(alpha: 0.45),
                            alignment: Alignment.center,
                            child: project.githubUrl == null
                                ? const SizedBox.shrink()
                                : ElevatedButton.icon(
                                    onPressed: () => _open(project.githubUrl),
                                    icon: const Icon(
                                      Icons.code_rounded,
                                      size: 18,
                                    ),
                                    label: Text('projects.view_code'.tr()),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(AppDimens.space24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.folder_special_outlined,
                            size: 18,
                            color: colors.accent,
                          ),
                          const SizedBox(width: AppDimens.space8),
                          Expanded(
                            child: Text(
                              project.title,
                              style: AppTextStyles.titleLarge(colors),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppDimens.space12),
                      Text(
                        project.description,
                        style: AppTextStyles.bodyMedium(colors),
                      ),
                      const SizedBox(height: AppDimens.space16),
                      Wrap(
                        spacing: AppDimens.space8,
                        runSpacing: AppDimens.space8,
                        children: project.techStack
                            .map(
                              (tech) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppDimens.space12,
                                  vertical: AppDimens.space8,
                                ),
                                decoration: BoxDecoration(
                                  color: colors.surfaceRaised,
                                  borderRadius: BorderRadius.circular(
                                    AppDimens.radiusFull,
                                  ),
                                  border: Border.all(color: colors.border),
                                ),
                                child: Text(
                                  tech,
                                  style: AppTextStyles.labelMedium(colors)
                                      .copyWith(color: colors.textSecondary),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      if (project.githubUrl != null) ...[
                        const SizedBox(height: AppDimens.space16),
                        TextButton.icon(
                          onPressed: () => _open(project.githubUrl),
                          icon: Icon(
                            Icons.open_in_new_rounded,
                            size: 16,
                            color: colors.accent,
                          ),
                          label: Text(
                            'projects.github'.tr(),
                            style: AppTextStyles.bodyMedium(colors).copyWith(
                              color: colors.accent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            // Shine sweep — Positioned must be a direct Stack child
            Positioned.fill(
              child: IgnorePointer(
                child: AnimatedBuilder(
                  animation: _shineController,
                  builder: (context, _) {
                    final t = _shineController.value;
                    if (!_isHovered && t == 0) {
                      return const SizedBox.shrink();
                    }
                    return Opacity(
                      opacity: (1 - t) * 0.35,
                      child: Transform.translate(
                        offset: Offset(
                          -120 + t * 420,
                          -40 + t * 80,
                        ),
                        child: Transform.rotate(
                          angle: -0.55,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 70,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    colors.accent.withValues(alpha: 0.35),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
