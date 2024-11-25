import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Photo Lab';

  @override
  String get appDescription => 'A photo editing app';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get logIn => 'Log in';

  @override
  String get signUp => 'Sign up';
}
