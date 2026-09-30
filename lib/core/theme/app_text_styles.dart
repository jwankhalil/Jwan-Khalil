import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextStyle displayLarge(AppColorScheme colors) => GoogleFonts.sora(
        fontSize: 64,
        fontWeight: FontWeight.w700,
        height: 1.05,
        letterSpacing: -1.6,
        color: colors.textPrimary,
      );

  static TextStyle displayMedium(AppColorScheme colors) => GoogleFonts.sora(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        height: 1.1,
        letterSpacing: -1.2,
        color: colors.textPrimary,
      );

  static TextStyle headlineLarge(AppColorScheme colors) => GoogleFonts.sora(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        height: 1.15,
        letterSpacing: -0.8,
        color: colors.textPrimary,
      );

  static TextStyle headlineMedium(AppColorScheme colors) => GoogleFonts.sora(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        height: 1.2,
        letterSpacing: -0.4,
        color: colors.textPrimary,
      );

  static TextStyle titleLarge(AppColorScheme colors) => GoogleFonts.sora(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        height: 1.3,
        color: colors.textPrimary,
      );

  static TextStyle titleMedium(AppColorScheme colors) => GoogleFonts.sora(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.35,
        color: colors.textPrimary,
      );

  static TextStyle bodyLarge(AppColorScheme colors) => GoogleFonts.sora(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 1.65,
        color: colors.textSecondary,
      );

  static TextStyle bodyMedium(AppColorScheme colors) => GoogleFonts.sora(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: colors.textSecondary,
      );

  static TextStyle bodySmall(AppColorScheme colors) => GoogleFonts.sora(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: colors.textMuted,
      );

  static TextStyle labelLarge(AppColorScheme colors) =>
      GoogleFonts.jetBrainsMono(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.2,
        height: 1.3,
        color: colors.accent,
      );

  static TextStyle labelMedium(AppColorScheme colors) =>
      GoogleFonts.jetBrainsMono(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.8,
        height: 1.3,
        color: colors.textMuted,
      );

  static TextStyle button(AppColorScheme colors) => GoogleFonts.sora(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: colors.textPrimary,
      );

  static TextStyle mono(AppColorScheme colors) => GoogleFonts.jetBrainsMono(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        height: 1.55,
        color: colors.textSecondary,
      );
}
