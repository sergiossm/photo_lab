import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

extension ThemeX on BuildContext {
  AppTextTheme get textStyle => ThemeProvider.of(this).textStyle;

  AppThemeColorScheme get color => ThemeProvider.of(this).color;

  ThemeData get theme => ThemeProvider.of(this).theme;
}
