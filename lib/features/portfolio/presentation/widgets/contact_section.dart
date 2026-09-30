import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/core/constants/app_dimens.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/widgets/animated_section.dart';
import 'package:portfolio/core/widgets/app_buttons.dart';
import 'package:portfolio/core/widgets/section_header.dart';
import 'package:portfolio/core/utils/resume_downloader.dart';
import 'package:portfolio/features/portfolio/domain/entities/profile.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({required this.profile, super.key});

  final Profile profile;

  Future<void> _downloadResume(BuildContext context) async {
    try {
      await ResumeDownloader.download();
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('contact.resume_downloaded'.tr()),
          backgroundColor: context.appColors.surfaceRaised,
        ),
      );
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('contact.resume_failed'.tr()),
          backgroundColor: context.appColors.surfaceRaised,
        ),
      );
    }
  }

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return AnimatedSection(
      id: 'contact-section',
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimens.space64),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppDimens.space40),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colors.surface,
                colors.surfaceRaised,
              ],
            ),
            borderRadius: BorderRadius.circular(AppDimens.radius24),
            border: Border.all(color: colors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                eyebrowKey: 'contact.eyebrow',
                titleKey: 'contact.title',
                subtitleKey: 'contact.subtitle',
                icon: Icons.chat_bubble_outline_rounded,
              ),
              const SizedBox(height: AppDimens.space32),
              Wrap(
                spacing: AppDimens.space12,
                runSpacing: AppDimens.space12,
                children: [
                  AppPrimaryButton(
                    label: 'contact.email_me'.tr(),
                    icon: Icons.mail_outline_rounded,
                    onPressed: () => _open('mailto:${profile.email}'),
                  ),
                  AppSecondaryButton(
                    label: 'contact.download_resume'.tr(),
                    icon: Icons.download_rounded,
                    onPressed: () => _downloadResume(context),
                  ),
                  if (profile.linkedinUrl != null)
                    AppSecondaryButton(
                      label: 'contact.linkedin'.tr(),
                      icon: Icons.business_center_outlined,
                      onPressed: () => _open(profile.linkedinUrl!),
                    ),
                  if (profile.githubUrl != null)
                    AppSecondaryButton(
                      label: 'contact.github'.tr(),
                      icon: Icons.code_rounded,
                      onPressed: () => _open(profile.githubUrl!),
                    ),
                  AppSecondaryButton(
                    label: 'contact.copy_email'.tr(),
                    icon: Icons.copy_rounded,
                    onPressed: () async {
                      await Clipboard.setData(
                        ClipboardData(text: profile.email),
                      );
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('contact.copied'.tr()),
                            backgroundColor: colors.surfaceRaised,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
