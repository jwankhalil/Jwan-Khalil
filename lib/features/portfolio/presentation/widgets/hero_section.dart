import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/constants/app_dimens.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/core/widgets/app_buttons.dart';
import 'package:portfolio/core/utils/resume_downloader.dart';
import 'package:portfolio/core/widgets/animated_icon_badge.dart';
import 'package:portfolio/features/portfolio/domain/entities/profile.dart';
import 'package:portfolio/features/portfolio/presentation/widgets/typed_code_card.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    required this.profile,
    required this.onContactTap,
    required this.onProjectsTap,
    super.key,
  });

  final Profile profile;
  final VoidCallback onContactTap;
  final VoidCallback onProjectsTap;

  Future<void> _open(String? url) async {
    if (url == null) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

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
    final isDesktop = context.isDesktop;
    final nameStyle = isDesktop
        ? AppTextStyles.displayLarge(colors)
        : AppTextStyles.displayMedium(colors);

    return Padding(
      padding: EdgeInsets.only(
        top: isDesktop ? AppDimens.space96 : AppDimens.space48,
        bottom: AppDimens.space80,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: AppDimens.heroMinHeight - 120),
        child: isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 6, child: _copy(context, nameStyle)),
                  const SizedBox(width: AppDimens.space48),
                  const Expanded(flex: 5, child: TypedCodeCard()),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _copy(context, nameStyle),
                  const SizedBox(height: AppDimens.space40),
                  const TypedCodeCard(),
                ],
              ),
      ),
    );
  }

  Widget _copy(BuildContext context, TextStyle nameStyle) {
    final colors = context.appColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const AnimatedIconBadge(
              icon: Icons.bolt_rounded,
              size: 36,
              iconSize: 18,
            ),
            const SizedBox(width: AppDimens.space12),
            Text(
              'hero.eyebrow'.tr().toUpperCase(),
              style: AppTextStyles.labelLarge(colors),
            ),
          ],
        )
            .animate()
            .fadeIn(duration: 450.ms)
            .slideX(begin: -0.08, end: 0),
        const SizedBox(height: AppDimens.space20),
        Text(profile.fullName, style: nameStyle)
            .animate(delay: 180.ms)
            .fadeIn(duration: 650.ms)
            .slideY(begin: 0.12, end: 0)
            .shimmer(
              delay: 400.ms,
              duration: 1200.ms,
              color: colors.accent.withValues(alpha: 0.18),
            ),
        const SizedBox(height: AppDimens.space16),
        Text(
          profile.title,
          style: AppTextStyles.titleLarge(colors).copyWith(
            color: colors.accent,
          ),
        )
            .animate(delay: 320.ms)
            .fadeIn(duration: 600.ms)
            .slideX(begin: -0.04, end: 0),
        const SizedBox(height: AppDimens.space24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Text(
            'hero.tagline'.tr(),
            style: AppTextStyles.bodyLarge(colors),
          ),
        )
            .animate(delay: 420.ms)
            .fadeIn(duration: 600.ms)
            .slideY(begin: 0.06, end: 0),
        const SizedBox(height: AppDimens.space32),
        Wrap(
          spacing: AppDimens.space12,
          runSpacing: AppDimens.space12,
          children: [
            AppPrimaryButton(
              label: 'hero.cta_contact'.tr(),
              icon: Icons.mail_outline_rounded,
              onPressed: onContactTap,
            ),
            AppSecondaryButton(
              label: 'hero.cta_work'.tr(),
              icon: Icons.work_outline_rounded,
              onPressed: onProjectsTap,
            ),
            AppSecondaryButton(
              label: 'hero.cta_resume'.tr(),
              icon: Icons.download_rounded,
              onPressed: () => _downloadResume(context),
            ),
          ],
        )
            .animate(delay: 560.ms)
            .fadeIn(duration: 600.ms)
            .slideY(begin: 0.1, end: 0)
            .scale(begin: const Offset(0.96, 0.96), end: const Offset(1, 1)),
        const SizedBox(height: AppDimens.space32),
        Row(
          children: [
            if (profile.githubUrl != null)
              _SocialIcon(
                icon: Icons.code_rounded,
                tooltip: 'GitHub',
                onTap: () => _open(profile.githubUrl),
              ),
            if (profile.linkedinUrl != null)
              _SocialIcon(
                icon: Icons.business_center_outlined,
                tooltip: 'LinkedIn',
                onTap: () => _open(profile.linkedinUrl),
              ),
            _SocialIcon(
              icon: Icons.email_outlined,
              tooltip: profile.email,
              onTap: () => _open('mailto:${profile.email}'),
            ),
          ],
        )
            .animate(delay: 700.ms)
            .fadeIn(duration: 600.ms)
            .slideY(begin: 0.08, end: 0),
      ],
    );
  }

}

class _SocialIcon extends StatefulWidget {
  const _SocialIcon({
    required this.icon,
    required this.onTap,
    required this.tooltip,
  });

  final IconData icon;
  final VoidCallback onTap;
  final String tooltip;

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Padding(
      padding: const EdgeInsetsDirectional.only(end: AppDimens.space8),
      child: Tooltip(
        message: widget.tooltip,
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          cursor: SystemMouseCursors.click,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(AppDimens.radiusFull),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: const EdgeInsets.all(AppDimens.space12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _isHovered ? colors.accent : colors.border,
                ),
                color: _isHovered ? colors.accentMuted : Colors.transparent,
              ),
              child: Icon(
                widget.icon,
                size: 20,
                color: _isHovered ? colors.accent : colors.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
