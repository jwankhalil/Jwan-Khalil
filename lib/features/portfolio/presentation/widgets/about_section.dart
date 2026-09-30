import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_dimens.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/core/widgets/animated_section.dart';
import 'package:portfolio/core/widgets/section_header.dart';
import 'package:portfolio/features/portfolio/domain/entities/profile.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({required this.profile, super.key});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;

    return AnimatedSection(
      id: 'about-section',
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimens.space64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              eyebrowKey: 'about.eyebrow',
              titleKey: 'about.title',
              subtitleKey: 'about.subtitle',
              icon: Icons.person_outline_rounded,
            ),
            const SizedBox(height: AppDimens.space40),
            if (isDesktop)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: _TypedAboutCodeBlock(profile: profile),
                  ),
                  const SizedBox(width: AppDimens.space40),
                  Expanded(flex: 2, child: _ContactCard(profile: profile)),
                ],
              )
            else ...[
              _TypedAboutCodeBlock(profile: profile),
              const SizedBox(height: AppDimens.space32),
              _ContactCard(profile: profile),
            ],
          ],
        ),
      ),
    );
  }
}

enum _Tone { keyword, plain, nameValue, titleValue, bio }

class _Token {
  const _Token(this.text, this.tone);
  final String text;
  final _Tone tone;
}

class _TypedAboutCodeBlock extends StatefulWidget {
  const _TypedAboutCodeBlock({required this.profile});

  final Profile profile;

  @override
  State<_TypedAboutCodeBlock> createState() => _TypedAboutCodeBlockState();
}

class _TypedAboutCodeBlockState extends State<_TypedAboutCodeBlock>
    with SingleTickerProviderStateMixin {
  late final List<_Token> _tokens;
  late final String _fullText;
  late final List<_Tone> _tones;
  late final AnimationController _cursorController;

  int _visibleChars = 0;
  Timer? _typeTimer;
  bool _hasStarted = false;

  @override
  void initState() {
    super.initState();
    _buildTokens();
    _cursorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 530),
    )..repeat(reverse: true);
  }

  void _buildTokens() {
    final p = widget.profile;
    _tokens = [
      const _Token('AboutMe', _Tone.keyword),
      const _Token(' {\n', _Tone.plain),
      const _Token('  name', _Tone.keyword),
      const _Token(': "', _Tone.plain),
      _Token(p.fullName, _Tone.nameValue),
      const _Token('"\n', _Tone.plain),
      const _Token('  title', _Tone.keyword),
      const _Token(': "', _Tone.plain),
      _Token(p.title, _Tone.titleValue),
      const _Token('"\n', _Tone.plain),
      const _Token('  bio', _Tone.keyword),
      const _Token(': """\n', _Tone.plain),
      _Token(p.summary, _Tone.bio),
      const _Token('\n  """\n', _Tone.plain),
      const _Token('}', _Tone.plain),
    ];

    final buffer = StringBuffer();
    final tones = <_Tone>[];
    for (final token in _tokens) {
      buffer.write(token.text);
      for (var i = 0; i < token.text.length; i++) {
        tones.add(token.tone);
      }
    }
    _fullText = buffer.toString();
    _tones = tones;
  }

  @override
  void didUpdateWidget(covariant _TypedAboutCodeBlock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.profile != widget.profile) {
      _typeTimer?.cancel();
      _hasStarted = false;
      _visibleChars = 0;
      _buildTokens();
      setState(() {});
    }
  }

  void _startTyping() {
    if (_hasStarted || !mounted) return;
    _hasStarted = true;
    _typeTimer?.cancel();
    _typeTimer = Timer.periodic(const Duration(milliseconds: 14), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_visibleChars >= _fullText.length) {
        timer.cancel();
        return;
      }

      // Type faster through the long bio paragraph.
      final step = _tones[_visibleChars] == _Tone.bio ? 4 : 1;
      setState(() {
        _visibleChars = (_visibleChars + step).clamp(0, _fullText.length);
      });
    });
  }

  @override
  void dispose() {
    _typeTimer?.cancel();
    _cursorController.dispose();
    super.dispose();
  }

  Color _colorFor(_Tone tone, AppColorScheme colors) {
    final isDark = colors.background.computeLuminance() < 0.5;
    return switch (tone) {
      _Tone.keyword => colors.accent,
      _Tone.plain => colors.textMuted,
      _Tone.nameValue => colors.textPrimary,
      _Tone.titleValue => colors.accent,
      _Tone.bio =>
        isDark ? colors.textPrimary : colors.textPrimary,
    };
  }

  List<InlineSpan> _buildSpans(AppColorScheme colors, TextStyle base) {
    if (_visibleChars == 0) return const [];

    final spans = <InlineSpan>[];
    var index = 0;
    while (index < _visibleChars) {
      final tone = _tones[index];
      final start = index;
      while (index < _visibleChars && _tones[index] == tone) {
        index++;
      }
      final isBio = tone == _Tone.bio;
      spans.add(
        TextSpan(
          text: _fullText.substring(start, index),
          style: base.copyWith(
            color: _colorFor(tone, colors),
            fontWeight: tone == _Tone.nameValue ? FontWeight.w600 : null,
            fontFamily: isBio ? null : base.fontFamily,
            fontSize: isBio ? 16 : base.fontSize,
            height: isBio ? 1.65 : base.height,
          ),
        ),
      );
    }
    return spans;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final base = AppTextStyles.mono(colors);

    return VisibilityDetector(
      key: const Key('typed-about-code-block'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2) {
          _startTyping();
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(AppDimens.radius20),
          border: Border.all(color: colors.border),
          boxShadow: [
            BoxShadow(
              color: colors.accent.withValues(alpha: 0.06),
              blurRadius: 28,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _EditorTitleBar(fileName: 'about_me.dart'),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppDimens.space24,
                AppDimens.space20,
                AppDimens.space24,
                AppDimens.space24,
              ),
              child: Stack(
                children: [
                  // Reserve full height so layout doesn't jump while typing.
                  Opacity(
                    opacity: 0,
                    child: Text(_fullText, style: base.copyWith(height: 1.55)),
                  ),
                  Text.rich(
                    TextSpan(
                      style: base.copyWith(height: 1.55),
                      children: [
                        ..._buildSpans(colors, base),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: FadeTransition(
                            opacity: _cursorController,
                            child: Container(
                              width: 8,
                              height: 16,
                              margin:
                                  const EdgeInsetsDirectional.only(start: 1),
                              decoration: BoxDecoration(
                                color: colors.accent,
                                borderRadius: BorderRadius.circular(1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EditorTitleBar extends StatelessWidget {
  const _EditorTitleBar({required this.fileName});

  final String fileName;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.space16,
        vertical: AppDimens.space12,
      ),
      decoration: BoxDecoration(
        color: colors.surfaceRaised.withValues(alpha: 0.55),
        border: Border(bottom: BorderSide(color: colors.border)),
      ),
      child: Row(
        children: [
          _dot(const Color(0xFFFF5F56)),
          const SizedBox(width: 6),
          _dot(const Color(0xFFFFBD2E)),
          const SizedBox(width: 6),
          _dot(const Color(0xFF27C93F)),
          const Spacer(),
          Text(fileName, style: AppTextStyles.labelMedium(colors)),
        ],
      ),
    );
  }

  Widget _dot(Color color) => Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      );
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({required this.profile});

  final Profile profile;

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
        children: [
          _InfoRow(
            icon: Icons.location_on_outlined,
            label: profile.location ?? '',
          ),
          const SizedBox(height: AppDimens.space16),
          _InfoRow(
            icon: Icons.mail_outline_rounded,
            label: profile.email,
          ),
          if (profile.phone != null) ...[
            const SizedBox(height: AppDimens.space16),
            _InfoRow(
              icon: Icons.phone_outlined,
              label: profile.phone!,
            ),
          ],
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(AppDimens.space8),
          decoration: BoxDecoration(
            color: colors.accentMuted,
            borderRadius: BorderRadius.circular(AppDimens.radius8),
          ),
          child: Icon(icon, size: 18, color: colors.accent),
        ),
        const SizedBox(width: AppDimens.space12),
        Expanded(
          child: Text(label, style: AppTextStyles.bodyMedium(colors)),
        ),
      ],
    );
  }
}
