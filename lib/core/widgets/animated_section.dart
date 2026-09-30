import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimatedSection extends StatefulWidget {
  const AnimatedSection({
    required this.child,
    required this.id,
    this.delay = Duration.zero,
    super.key,
  });

  final Widget child;
  final String id;
  final Duration delay;

  @override
  State<AnimatedSection> createState() => _AnimatedSectionState();
}

class _AnimatedSectionState extends State<AnimatedSection> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.id),
      onVisibilityChanged: (info) {
        if (!_isVisible && info.visibleFraction > 0.1) {
          setState(() => _isVisible = true);
        }
      },
      child: _isVisible
          ? widget.child
              .animate(delay: widget.delay)
              .fadeIn(duration: 650.ms, curve: Curves.easeOutCubic)
              .slideY(
                begin: 0.07,
                end: 0,
                duration: 650.ms,
                curve: Curves.easeOutCubic,
              )
              .scale(
                begin: const Offset(0.985, 0.985),
                end: const Offset(1, 1),
                duration: 650.ms,
                curve: Curves.easeOutCubic,
              )
          : Opacity(opacity: 0, child: widget.child),
    );
  }
}

/// Staggers a list of children when they first enter the viewport.
class StaggeredReveal extends StatefulWidget {
  const StaggeredReveal({
    required this.id,
    required this.children,
    this.itemDelay = const Duration(milliseconds: 70),
    super.key,
  });

  final String id;
  final List<Widget> children;
  final Duration itemDelay;

  @override
  State<StaggeredReveal> createState() => _StaggeredRevealState();
}

class _StaggeredRevealState extends State<StaggeredReveal> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('stagger-${widget.id}'),
      onVisibilityChanged: (info) {
        if (!_isVisible && info.visibleFraction > 0.08) {
          setState(() => _isVisible = true);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.children.asMap().entries.map((entry) {
          final child = entry.value;
          if (!_isVisible) {
            return Opacity(opacity: 0, child: child);
          }
          return child
              .animate(delay: widget.itemDelay * entry.key)
              .fadeIn(duration: 480.ms, curve: Curves.easeOutCubic)
              .slideY(begin: 0.07, end: 0, curve: Curves.easeOutCubic)
              .scale(
                begin: const Offset(0.96, 0.96),
                end: const Offset(1, 1),
                curve: Curves.easeOutBack,
              );
        }).toList(),
      ),
    );
  }
}
