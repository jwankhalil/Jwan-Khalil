import 'package:flutter/material.dart';

/// Obsidian + Emerald palette inspired by premium developer portfolios.
class AppColors {
  const AppColors._();

  // Brand accent
  static const Color emerald = Color(0xFF3ECF8E);
  static const Color emeraldDark = Color(0xFF2BA86F);
  static const Color emeraldMuted = Color(0x333ECF8E);

  // Dark theme
  static const Color darkBackground = Color(0xFF0B0F0E);
  static const Color darkSurface = Color(0xFF121816);
  static const Color darkSurfaceRaised = Color(0xFF1A211E);
  static const Color darkBorder = Color(0xFF2A332F);
  static const Color darkTextPrimary = Color(0xFFF2F5F3);
  static const Color darkTextSecondary = Color(0xFF9AA8A0);
  static const Color darkTextMuted = Color(0xFF6B7871);

  // Light theme
  static const Color lightBackground = Color(0xFFF3F6F4);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceRaised = Color(0xFFE8EEEA);
  static const Color lightBorder = Color(0xFFD5DED8);
  static const Color lightTextPrimary = Color(0xFF0F1714);
  static const Color lightTextSecondary = Color(0xFF4A5851);
  static const Color lightTextMuted = Color(0xFF7A8A82);

  static const Color danger = Color(0xFFE5484D);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
}

class AppColorScheme {
  const AppColorScheme({
    required this.background,
    required this.surface,
    required this.surfaceRaised,
    required this.border,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.accent,
    required this.accentDark,
    required this.accentMuted,
    required this.danger,
  });

  final Color background;
  final Color surface;
  final Color surfaceRaised;
  final Color border;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color accent;
  final Color accentDark;
  final Color accentMuted;
  final Color danger;

  static const AppColorScheme dark = AppColorScheme(
    background: AppColors.darkBackground,
    surface: AppColors.darkSurface,
    surfaceRaised: AppColors.darkSurfaceRaised,
    border: AppColors.darkBorder,
    textPrimary: AppColors.darkTextPrimary,
    textSecondary: AppColors.darkTextSecondary,
    textMuted: AppColors.darkTextMuted,
    accent: AppColors.emerald,
    accentDark: AppColors.emeraldDark,
    accentMuted: AppColors.emeraldMuted,
    danger: AppColors.danger,
  );

  static const AppColorScheme light = AppColorScheme(
    background: AppColors.lightBackground,
    surface: AppColors.lightSurface,
    surfaceRaised: AppColors.lightSurfaceRaised,
    border: AppColors.lightBorder,
    textPrimary: AppColors.lightTextPrimary,
    textSecondary: AppColors.lightTextSecondary,
    textMuted: AppColors.lightTextMuted,
    accent: AppColors.emerald,
    accentDark: AppColors.emeraldDark,
    accentMuted: AppColors.emeraldMuted,
    danger: AppColors.danger,
  );
}

extension AppColorSchemeX on BuildContext {
  AppColorScheme get appColors {
    final brightness = Theme.of(this).brightness;
    return brightness == Brightness.dark
        ? AppColorScheme.dark
        : AppColorScheme.light;
  }
}
