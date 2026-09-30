import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constants/app_dimens.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData light() => _build(AppColorScheme.light, Brightness.light);

  static ThemeData dark() => _build(AppColorScheme.dark, Brightness.dark);

  static ThemeData _build(AppColorScheme colors, Brightness brightness) {
    final base = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: colors.background,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: colors.accent,
        onPrimary: AppColors.darkBackground,
        secondary: colors.accentDark,
        onSecondary: AppColors.white,
        error: colors.danger,
        onError: AppColors.white,
        surface: colors.surface,
        onSurface: colors.textPrimary,
      ),
    );

    return base.copyWith(
      textTheme: GoogleFonts.soraTextTheme(base.textTheme).apply(
        bodyColor: colors.textPrimary,
        displayColor: colors.textPrimary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.background.withValues(alpha: 0.85),
        elevation: 0,
        scrolledUnderElevation: 0,
        systemOverlayStyle: brightness == Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        titleTextStyle: GoogleFonts.sora(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: colors.textPrimary,
        ),
        iconTheme: IconThemeData(color: colors.textPrimary),
      ),
      dividerTheme: DividerThemeData(
        color: colors.border,
        thickness: AppDimens.borderWidth,
        space: 1,
      ),
      cardTheme: CardThemeData(
        color: colors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radius16),
          side: BorderSide(color: colors.border),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: colors.surfaceRaised,
        side: BorderSide(color: colors.border),
        labelStyle: GoogleFonts.jetBrainsMono(
          fontSize: 12,
          color: colors.textSecondary,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.space12,
          vertical: AppDimens.space8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusFull),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.accent,
          foregroundColor: AppColors.darkBackground,
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.space24,
            vertical: AppDimens.space16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radiusFull),
          ),
          textStyle: GoogleFonts.sora(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.textPrimary,
          side: BorderSide(color: colors.border),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.space24,
            vertical: AppDimens.space16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radiusFull),
          ),
          textStyle: GoogleFonts.sora(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      iconTheme: IconThemeData(color: colors.textSecondary),
    );
  }
}
