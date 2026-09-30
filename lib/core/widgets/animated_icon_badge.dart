import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/constants/app_dimens.dart';
import 'package:portfolio/core/theme/app_colors.dart';

/// Soft pulsing emblem used in section headers and skill chips.
class AnimatedIconBadge extends StatefulWidget {
  const AnimatedIconBadge({
    required this.icon,
    this.size = 40,
    this.iconSize = 20,
    super.key,
  });

  final IconData icon;
  final double size;
  final double iconSize;

  @override
  State<AnimatedIconBadge> createState() => _AnimatedIconBadgeState();
}

class _AnimatedIconBadgeState extends State<AnimatedIconBadge>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    )..repeat(reverse: true);
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
      builder: (context, child) {
        final t = Curves.easeInOut.transform(_controller.value);
        return Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: colors.accentMuted,
            borderRadius: BorderRadius.circular(AppDimens.radius12),
            border: Border.all(
              color: Color.lerp(colors.border, colors.accent, t * 0.55)!,
            ),
            boxShadow: [
              BoxShadow(
                color: colors.accent.withValues(alpha: 0.08 + t * 0.12),
                blurRadius: 10 + t * 10,
              ),
            ],
          ),
          child: child,
        );
      },
      child: Icon(widget.icon, size: widget.iconSize, color: colors.accent)
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .rotate(
            begin: -0.02,
            end: 0.02,
            duration: 2800.ms,
            curve: Curves.easeInOut,
          ),
    );
  }
}
