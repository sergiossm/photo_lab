import 'package:flutter/material.dart';

abstract class AppThemeColorScheme extends ColorScheme {
  const AppThemeColorScheme({
    required super.brightness,
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.error,
    required this.onError,
    required this.surface,
    required this.onSurface,
  }) : super(
          primary: primary,
          onPrimary: onPrimary,
          secondary: secondary,
          onSecondary: onSecondary,
          error: error,
          onError: onError,
          surface: surface,
          onSurface: onSurface,
        );

  static LightColorScheme light = const LightColorScheme();

  @override
  final Color primary;
  @override
  final Color onPrimary;
  @override
  final Color secondary;
  @override
  final Color onSecondary;
  @override
  final Color error;
  @override
  final Color onError;
  @override
  final Color surface;
  @override
  final Color onSurface;
}

class LightColorScheme extends AppThemeColorScheme {
  const LightColorScheme()
      : super(
          brightness: Brightness.light,
          primary: const Color(0xFF6200EE),
          onPrimary: const Color(0xFFFFFFFF),
          secondary: const Color(0xFF03DAC6),
          onSecondary: const Color(0xFF000000),
          error: const Color(0xFFB00020),
          onError: const Color(0xFFFFFFFF),
          surface: const Color(0xFFFFFFFF),
          onSurface: const Color(0xFF000000),
        );
}
