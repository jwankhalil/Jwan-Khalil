import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/constants/app_dimens.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/core/theme/theme_cubit.dart';
import 'package:portfolio/core/utils/resume_downloader.dart';

class PortfolioNavBar extends StatelessWidget {
  const PortfolioNavBar({
    required this.onNavigate,
    required this.brandName,
    this.scrollProgress = 0,
    this.activeSectionId,
    super.key,
  });

  final void Function(String sectionId) onNavigate;
  final String brandName;
  final double scrollProgress;
  final String? activeSectionId;

  Future<void> _downloadResume(BuildContext context) async {
    try {
      await ResumeDownloader.download();
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('contact.resume_downloaded'.tr())),
      );
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('contact.resume_failed'.tr())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final isMobile = context.isMobile;
    final progress = scrollProgress.clamp(0.0, 1.0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: AppDimens.navHeight,
          padding: context.pagePadding,
          color: colors.background.withValues(alpha: 0.88),
          child: Row(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/jk_mark.svg',
                    width: 28,
                    height: 28,
                  ),
                  const SizedBox(width: AppDimens.space12),
                  Text(
                    brandName,
                    style: AppTextStyles.titleMedium(colors).copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              if (!isMobile) ...[
                _NavLink(
                  label: 'nav.about'.tr(),
                  isActive: activeSectionId == 'about',
                  onTap: () => onNavigate('about'),
                ),
                _NavLink(
                  label: 'nav.experience'.tr(),
                  isActive: activeSectionId == 'experience',
                  onTap: () => onNavigate('experience'),
                ),
                _NavLink(
                  label: 'nav.projects'.tr(),
                  isActive: activeSectionId == 'projects',
                  onTap: () => onNavigate('projects'),
                ),
                _NavLink(
                  label: 'nav.skills'.tr(),
                  isActive: activeSectionId == 'skills',
                  onTap: () => onNavigate('skills'),
                ),
                _NavLink(
                  label: 'nav.contact'.tr(),
                  isActive: activeSectionId == 'contact',
                  onTap: () => onNavigate('contact'),
                ),
                const SizedBox(width: AppDimens.space8),
            _ResumeNavButton(onPressed: () => _downloadResume(context)),
            const SizedBox(width: AppDimens.space8),
          ],
          IconButton(
            tooltip: 'nav.theme'.tr(),
            onPressed: () => context.read<ThemeCubit>().toggleLightDark(),
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
              color: colors.textPrimary,
            ),
          ),
              if (isMobile)
                PopupMenuButton<String>(
                  icon: Icon(Icons.menu_rounded, color: colors.textPrimary),
                  color: colors.surface,
                  onSelected: (value) {
                    if (value == 'resume') {
                      _downloadResume(context);
                      return;
                    }
                    onNavigate(value);
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'about',
                      child: Text('nav.about'.tr()),
                    ),
                    PopupMenuItem(
                      value: 'experience',
                      child: Text('nav.experience'.tr()),
                    ),
                    PopupMenuItem(
                      value: 'projects',
                      child: Text('nav.projects'.tr()),
                    ),
                    PopupMenuItem(
                      value: 'skills',
                      child: Text('nav.skills'.tr()),
                    ),
                    PopupMenuItem(
                      value: 'contact',
                      child: Text('nav.contact'.tr()),
                    ),
                    PopupMenuItem(
                      value: 'resume',
                      child: Text('nav.resume'.tr()),
                    ),
                  ],
                ),
            ],
          ),
        ),
        // Scroll progress bar
        SizedBox(
          height: 2,
          width: double.infinity,
          child: Stack(
            children: [
              Container(color: colors.border),
              FractionallySizedBox(
                widthFactor: progress,
                alignment: AlignmentDirectional.centerStart,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [colors.accent, colors.accentDark],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: colors.accent.withValues(alpha: 0.45),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ResumeNavButton extends StatefulWidget {
  const _ResumeNavButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<_ResumeNavButton> createState() => _ResumeNavButtonState();
}

class _ResumeNavButtonState extends State<_ResumeNavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.space16,
            vertical: AppDimens.space8,
          ),
          decoration: BoxDecoration(
            color: _isHovered ? colors.accent : Colors.transparent,
            borderRadius: BorderRadius.circular(AppDimens.radiusFull),
            border: Border.all(color: colors.accent),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.download_rounded,
                size: 16,
                color: _isHovered ? AppColors.darkBackground : colors.accent,
              ),
              const SizedBox(width: AppDimens.space8),
              Text(
                'nav.resume'.tr(),
                style: AppTextStyles.bodyMedium(colors).copyWith(
                  color: _isHovered ? AppColors.darkBackground : colors.accent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink({
    required this.label,
    required this.onTap,
    this.isActive = false,
  });

  final String label;
  final VoidCallback onTap;
  final bool isActive;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final highlighted = widget.isActive || _isHovered;

    return Padding(
      padding: const EdgeInsetsDirectional.only(end: AppDimens.space16),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.label,
                style: AppTextStyles.bodyMedium(colors).copyWith(
                  color: highlighted ? colors.accent : colors.textSecondary,
                  fontWeight: widget.isActive ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOutCubic,
                margin: const EdgeInsets.only(top: 4),
                height: 2,
                width: highlighted ? (widget.isActive ? 22 : 18) : 0,
                color: colors.accent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
