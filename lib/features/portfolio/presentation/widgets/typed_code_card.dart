import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/constants/app_dimens.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';

enum _CodeTone { keyword, identifier, string, plain }

class _CodeToken {
  const _CodeToken(this.text, this.tone);

  final String text;
  final _CodeTone tone;
}

/// macOS-style editor card that types Dart code with syntax colors + cursor.
class TypedCodeCard extends StatefulWidget {
  const TypedCodeCard({
    this.className = 'JwanKhalil',
    this.startDelay = const Duration(milliseconds: 500),
    this.charDelay = const Duration(milliseconds: 28),
    super.key,
  });

  final String className;
  final Duration startDelay;
  final Duration charDelay;

  @override
  State<TypedCodeCard> createState() => _TypedCodeCardState();
}

class _TypedCodeCardState extends State<TypedCodeCard>
    with SingleTickerProviderStateMixin {
  late final List<_CodeToken> _tokens;
  late final String _fullText;
  late final List<_CodeTone> _tones;
  late final AnimationController _cursorController;

  int _visibleChars = 0;
  Timer? _typeTimer;
  bool _isTypingComplete = false;

  @override
  void initState() {
    super.initState();
    _tokens = [
      const _CodeToken('class ', _CodeTone.keyword),
      _CodeToken('${widget.className} ', _CodeTone.identifier),
      const _CodeToken('{\n', _CodeTone.plain),
      const _CodeToken('  final ', _CodeTone.keyword),
      const _CodeToken('role = ', _CodeTone.identifier),
      const _CodeToken('"Flutter Developer";\n', _CodeTone.string),
      const _CodeToken('  final ', _CodeTone.keyword),
      const _CodeToken('background = ', _CodeTone.identifier),
      const _CodeToken('"Informatics Engineer";\n', _CodeTone.string),
      const _CodeToken('  bool ', _CodeTone.keyword),
      const _CodeToken('isOpenToWork = ', _CodeTone.identifier),
      const _CodeToken('true', _CodeTone.keyword),
      const _CodeToken(';\n', _CodeTone.plain),
      const _CodeToken('}', _CodeTone.plain),
    ];

    final buffer = StringBuffer();
    final tones = <_CodeTone>[];
    for (final token in _tokens) {
      buffer.write(token.text);
      for (var i = 0; i < token.text.length; i++) {
        tones.add(token.tone);
      }
    }
    _fullText = buffer.toString();
    _tones = tones;

    _cursorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 530),
    )..repeat(reverse: true);

    Future<void>.delayed(widget.startDelay, _startTyping);
  }

  void _startTyping() {
    if (!mounted) return;
    _typeTimer?.cancel();
    _typeTimer = Timer.periodic(widget.charDelay, (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_visibleChars >= _fullText.length) {
        timer.cancel();
        setState(() => _isTypingComplete = true);
        return;
      }
      setState(() => _visibleChars++);
    });
  }

  @override
  void dispose() {
    _typeTimer?.cancel();
    _cursorController.dispose();
    super.dispose();
  }

  Color _colorFor(_CodeTone tone, AppColorScheme colors) {
    final isDark = colors.background.computeLuminance() < 0.5;
    return switch (tone) {
      _CodeTone.keyword => colors.accent,
      _CodeTone.identifier => colors.textPrimary,
      _CodeTone.string =>
        isDark ? const Color(0xFFD4C4A8) : const Color(0xFF8B6914),
      _CodeTone.plain => colors.textPrimary,
    };
  }

  List<InlineSpan> _buildSpans(AppColorScheme colors) {
    if (_visibleChars == 0) return const [];

    final spans = <InlineSpan>[];
    var index = 0;
    while (index < _visibleChars) {
      final tone = _tones[index];
      final start = index;
      while (index < _visibleChars && _tones[index] == tone) {
        index++;
      }
      spans.add(
        TextSpan(
          text: _fullText.substring(start, index),
          style: TextStyle(color: _colorFor(tone, colors)),
        ),
      );
    }
    return spans;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final baseStyle = AppTextStyles.mono(colors);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimens.space24),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppDimens.radius20),
        border: Border.all(color: colors.border),
        boxShadow: [
          BoxShadow(
            color: colors.accent.withValues(alpha: 0.08),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _WindowDot(const Color(0xFFFF5F56)),
              const SizedBox(width: 6),
              _WindowDot(const Color(0xFFFFBD2E)),
              const SizedBox(width: 6),
              _WindowDot(const Color(0xFF27C93F)),
              const Spacer(),
              Text('developer.dart', style: AppTextStyles.labelMedium(colors)),
            ],
          ),
          const SizedBox(height: AppDimens.space20),
          // Reserve height so the card doesn't jump while typing.
          SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                Opacity(
                  opacity: 0,
                  child: Text(
                    _fullText,
                    style: baseStyle,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    style: baseStyle,
                    children: [
                      ..._buildSpans(colors),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: FadeTransition(
                          opacity: _cursorController,
                          child: Container(
                            width: 8,
                            height: 16,
                            margin: const EdgeInsetsDirectional.only(start: 1),
                            decoration: BoxDecoration(
                              color: colors.accent,
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                        ),
                      ),
                      if (_isTypingComplete)
                        TextSpan(
                          text: '',
                          style: TextStyle(color: colors.accent),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.1, end: 0, curve: Curves.easeOutCubic)
        .then(delay: 200.ms)
        .animate(onPlay: (c) => c.repeat(reverse: true))
        .moveY(
          begin: 0,
          end: -6,
          duration: 3200.ms,
          curve: Curves.easeInOut,
        );
  }
}

class _WindowDot extends StatelessWidget {
  const _WindowDot(this.color);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
