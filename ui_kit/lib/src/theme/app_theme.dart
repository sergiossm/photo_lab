import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class AppTheme {
  AppTheme._({
    required this.theme,
    required this.color,
    required this.textStyle,
  });

  factory AppTheme.initializeTheme({
    required AppThemeColorScheme colorScheme,
    required ThemeData baseThemeData,
  }) {
    final textStyle = AppTextTheme.byColorScheme(colorScheme);

    return AppTheme._(
      color: colorScheme,
      theme: _createBaseThemeData(
        colorScheme,
        textStyle,
        baseThemeData,
      ),
      textStyle: textStyle,
      // radius: const AppRadius(),
    );
  }

  static AppTheme lightTheme = AppTheme.initializeTheme(
    colorScheme: AppThemeColorScheme.light,
    baseThemeData: ThemeData.light(),
  );

  static Iterable<AppTheme> themes = [lightTheme];

  static AppTheme of(BuildContext context) {
    final brightness = MediaQueryData.fromView(
      View.of(context),
    ).platformBrightness;
    return brightness == Brightness.dark
        ? AppTheme.lightTheme // TODO: Add dark theme
        : AppTheme.lightTheme;
  }

  static ThemeData _createBaseThemeData(
    AppThemeColorScheme colorScheme,
    AppTextTheme textStyle,
    ThemeData baseThemeData,
  ) {
    return baseThemeData.copyWith(
      colorScheme: colorScheme,
      textTheme: textStyle,
      primaryTextTheme: textStyle,
      appBarTheme: baseThemeData.appBarTheme.copyWith(
        color: colorScheme.surface,
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: textStyle.displaySmall,
        iconTheme: baseThemeData.iconTheme.copyWith(
          color: colorScheme.onSurface,
        ),
      ),
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
      cardColor: colorScheme.surface,
      dialogBackgroundColor: colorScheme.surface,
      buttonTheme: baseThemeData.buttonTheme.copyWith(
        buttonColor: colorScheme.primary,
        textTheme: ButtonTextTheme.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.onSurface,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.primary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.error,
          ),
        ),
      ),
    );
  }

  final ThemeData theme;
  final AppThemeColorScheme color;
  final AppTextTheme textStyle;
}

class ThemeProvider extends InheritedWidget {
  const ThemeProvider({
    required this.appTheme,
    required super.child,
    super.key,
  });

  final AppTheme appTheme;

  ThemeData get theme => appTheme.theme;
  AppTextTheme get textStyle => appTheme.textStyle;
  AppThemeColorScheme get color => appTheme.color;

  static ThemeProvider of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;

  @override
  bool updateShouldNotify(covariant ThemeProvider oldWidget) =>
      oldWidget.appTheme.theme.brightness != appTheme.theme.brightness;
}
