import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_kit/ui_kit.dart';

class AppTextTheme extends TextTheme {
  const AppTextTheme({
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    required this.headlineLarge,
    required this.headlineMedium,
    required this.headlineSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
  }) : super();

  factory AppTextTheme.byColorScheme(
    AppThemeColorScheme colorScheme,
  ) {
    return AppTextTheme(
      displayLarge: AppThemeTextStyle(colorScheme).merge(
        GoogleFonts.bebasNeue(
          fontSize: 96,
          fontWeight: FontWeight.w700,
          color: colorScheme.onSurface,
        ),
      ),
      displayMedium: AppThemeTextStyle(colorScheme).merge(
        GoogleFonts.bebasNeue(
          fontSize: 60,
          fontWeight: FontWeight.w700,
          color: colorScheme.onSurface,
        ),
      ),
      displaySmall: AppThemeTextStyle(colorScheme).merge(
        GoogleFonts.bebasNeue(
          fontSize: 48,
          fontWeight: FontWeight.w700,
          color: colorScheme.onSurface,
        ),
      ),
      headlineLarge: AppThemeTextStyle(colorScheme).merge(
        GoogleFonts.roboto(
          fontSize: 34,
          fontWeight: FontWeight.w700,
          color: colorScheme.onSurface,
        ),
      ),
      headlineMedium: AppThemeTextStyle(colorScheme).merge(
        GoogleFonts.roboto(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: colorScheme.onSurface,
        ),
      ),
      headlineSmall: AppThemeTextStyle(colorScheme).merge(
        GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: colorScheme.onSurface,
        ),
      ),
      titleLarge: AppThemeTextStyle(colorScheme).merge(
        GoogleFonts.roboto(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: colorScheme.onSurface,
        ),
      ),
      titleMedium: AppThemeTextStyle(colorScheme).merge(
        GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: colorScheme.onSurface,
        ),
      ),
      titleSmall: AppThemeTextStyle(colorScheme).merge(
        GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: colorScheme.onSurface,
        ),
      ),
    );
  }

  @override
  final AppThemeTextStyle displayLarge;
  @override
  final AppThemeTextStyle displayMedium;
  @override
  final AppThemeTextStyle displaySmall;
  @override
  final AppThemeTextStyle headlineLarge;
  @override
  final AppThemeTextStyle headlineMedium;
  @override
  final AppThemeTextStyle headlineSmall;
  @override
  final AppThemeTextStyle titleLarge;
  @override
  final AppThemeTextStyle titleMedium;
  @override
  final AppThemeTextStyle titleSmall;
}

class AppThemeTextStyle extends TextStyle {
  const AppThemeTextStyle(
    this.colorScheme, {
    super.inherit,
    super.color,
    super.backgroundColor,
    super.fontFamily,
    super.fontFamilyFallback,
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.letterSpacing,
    super.wordSpacing,
    super.textBaseline,
    super.height,
    super.locale,
    super.foreground,
    super.background,
    super.decoration,
    super.decorationColor,
    super.decorationStyle,
    super.decorationThickness,
    super.debugLabel,
    super.shadows,
    super.fontFeatures,
  });

  final AppThemeColorScheme colorScheme;

  @override
  AppThemeTextStyle copyWith({
    bool? inherit,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    TextLeadingDistribution? leadingDistribution,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    List<FontVariation>? fontVariations,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    String? package,
    TextOverflow? overflow,
  }) {
    return AppThemeTextStyle(
      colorScheme,
      inherit: inherit ?? this.inherit,
      color: this.foreground == null && foreground == null
          ? color ?? this.color
          : null,
      backgroundColor: this.background == null && background == null
          ? backgroundColor ?? this.backgroundColor
          : null,
      fontFamily: fontFamily ?? this.fontFamily,
      fontFamilyFallback: fontFamilyFallback ?? this.fontFamilyFallback,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      textBaseline: textBaseline ?? this.textBaseline,
      height: height ?? this.height,
      locale: locale ?? this.locale,
      foreground: foreground ?? this.foreground,
      background: background ?? this.background,
      shadows: shadows ?? this.shadows,
      fontFeatures: fontFeatures ?? this.fontFeatures,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationStyle: decorationStyle ?? this.decorationStyle,
      decorationThickness: decorationThickness ?? this.decorationThickness,
    );
  }

  @override
  AppThemeTextStyle merge(TextStyle? other) {
    final merged = super.merge(other);

    return copyWith(
      inherit: merged.inherit,
      color: merged.color,
      backgroundColor: merged.backgroundColor,
      fontFamily: merged.fontFamily,
      fontFamilyFallback: merged.fontFamilyFallback,
      fontSize: merged.fontSize,
      fontWeight: merged.fontWeight,
      fontStyle: merged.fontStyle,
      letterSpacing: merged.letterSpacing,
      wordSpacing: merged.wordSpacing,
      textBaseline: merged.textBaseline,
      height: merged.height,
      locale: merged.locale,
      foreground: merged.foreground,
      background: merged.background,
      shadows: merged.shadows,
      fontFeatures: merged.fontFeatures,
      decoration: merged.decoration,
      decorationColor: merged.decorationColor,
      decorationStyle: merged.decorationStyle,
      decorationThickness: merged.decorationThickness,
      debugLabel: merged.debugLabel,
    );
  }
}
