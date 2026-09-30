import 'package:flutter/material.dart';
import 'package:portfolio/core/responsive/app_breakpoints.dart';

extension BuildContextX on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);

  double get screenWidth => screenSize.width;

  bool get isMobile => screenWidth < AppBreakpoints.mobile;

  bool get isTablet =>
      screenWidth >= AppBreakpoints.mobile &&
      screenWidth < AppBreakpoints.tablet;

  bool get isDesktop => screenWidth >= AppBreakpoints.tablet;

  EdgeInsets get pagePadding {
    if (isMobile) {
      return const EdgeInsets.symmetric(horizontal: 20);
    }
    if (isTablet) {
      return const EdgeInsets.symmetric(horizontal: 40);
    }
    return const EdgeInsets.symmetric(horizontal: 64);
  }
}
