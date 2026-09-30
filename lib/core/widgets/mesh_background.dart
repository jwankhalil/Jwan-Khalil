import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class MeshBackground extends StatefulWidget {
  const MeshBackground({super.key});

  @override
  State<MeshBackground> createState() => _MeshBackgroundState();
}

class _MeshBackgroundState extends State<MeshBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final t = _controller.value * 2 * math.pi;
        return CustomPaint(
          painter: _MeshPainter(
            progress: t,
            background: colors.background,
            accent: colors.accent.withValues(alpha: 0.14),
            secondary: colors.accentDark.withValues(alpha: 0.08),
          ),
          child: const SizedBox.expand(),
        );
      },
    );
  }
}

class _MeshPainter extends CustomPainter {
  _MeshPainter({
    required this.progress,
    required this.background,
    required this.accent,
    required this.secondary,
  });

  final double progress;
  final Color background;
  final Color accent;
  final Color secondary;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = background);

    final blob1 = Paint()
      ..shader = RadialGradient(
        colors: [accent, accent.withValues(alpha: 0)],
      ).createShader(
        Rect.fromCircle(
          center: Offset(
            size.width * (0.18 + 0.04 * math.sin(progress)),
            size.height * (0.22 + 0.05 * math.cos(progress)),
          ),
          radius: size.shortestSide * 0.45,
        ),
      );

    final blob2 = Paint()
      ..shader = RadialGradient(
        colors: [secondary, secondary.withValues(alpha: 0)],
      ).createShader(
        Rect.fromCircle(
          center: Offset(
            size.width * (0.82 + 0.03 * math.cos(progress * 0.8)),
            size.height * (0.65 + 0.04 * math.sin(progress * 1.1)),
          ),
          radius: size.shortestSide * 0.5,
        ),
      );

    canvas.drawRect(Offset.zero & size, blob1);
    canvas.drawRect(Offset.zero & size, blob2);
  }

  @override
  bool shouldRepaint(covariant _MeshPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
